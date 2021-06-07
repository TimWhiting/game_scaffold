import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:realtime_client/realtime_client.dart' hide Logger;
import 'package:riverpod/riverpod.dart';
// ignore: implementation_imports
import 'package:supabase/src/supabase_query_builder.dart';
import 'package:supabase/supabase.dart' hide Provider;
// ignore_for_file: avoid_print
import '../../game_scaffold.dart';

const SupabaseLocation = 'supabase-server';

final _supaLogger = Logger('SupabaseClients');
final supabaseProvider = Provider<SupabaseClient>(
    (ref) => throw UnimplementedError('Please Override Supabase Provider'));

class SupabaseServerClient extends ServerClient {
  SupabaseServerClient(Reader read, String playerID) : super(read, playerID);
  SupabaseClient get _supaClient => read(supabaseProvider);
  SupabaseQueryBuilder get gameDB => _supaClient.from('Game');
  @override
  Future<void> createGame() async {
    final config = game.gameConfig.copyWith(adminId: playerID);

    final response = await gameDB.insert({
      'id': generateGameID([]),
      'config': config.toJson(),
    }).execute();

    if (response.error != null) {
      _supaLogger
          .severe('In create game Supabase Error ${response.error?.message}');
      return;
    }
    // ignore: avoid_dynamic_calls
    final code = response.data[0]['id'];
    game.gameCode = code as String;
    _supaLogger.info('GameCode: $code');
  }

  @override
  Future<bool> deleteGame() async {
    final response = await gameDB.delete().eq('id', game.gameCode).execute();
    if (response.error != null) {
      _supaLogger
          .severe('In delete game Supabase Error ${response.error?.message}');
      return false;
    }
    return response.count == 1;
  }

  @override
  void dispose() {
    // I don't think anything needs to happen here because there are no listeners
  }

  // @override
  // Future<void> getGameInfo(String gameId) async {
  //   final response = await gameDB.select().eq('id', gameId).execute();
  //   if (response.error != null || response.count == 0) {
  //     _supaLogger
  //         .severe('In get game info Supabase Error ${response.error?.message}');
  //     return;
  //   }
  //   // ignore: avoid_dynamic_calls
  //   final gameInfo = response.data[0] as Map<String, dynamic>;
  //   game.currentGameInfo = infoFromRow(gameInfo);
  // }

  GameInfo infoFromRow(Map<String, dynamic> gameInfo) {
    // print(gameInfo);
    final config =
        GameConfig.fromJson(gameInfo['config'] as Map<String, dynamic>);
    final players = (gameInfo['players'] as List)
        .map((p) => Player.fromJson(p as Map<String, dynamic>))
        .toIList();
    return GameInfo(
      gameId: gameInfo['id'] as String,
      players: players.map((p) => p.nameOrID).toIList(),
      player: players.firstWhereOrNull((p) => p.id == playerID)?.nameOrID ?? '',
      creator: config.adminId == playerID,
      gameType: config.gameType,
    );
  }

  @override
  Future<IList<GameInfo>> getGames() async {
    final response = await _supaClient
        .rpc('getallgames', params: {'playerid': playerID}).execute();

    if (response.error != null || response.count == 0) {
      _supaLogger
          .severe('In get game info Supabase Error ${response.error?.message}');
    }
    final gameInfo = response.data as List;
    // ignore: unnecessary_lambdas
    final allGames =
        gameInfo.map((d) => infoFromRow(d as Map<String, dynamic>)).toList();
    _supaLogger.info('All Games: $allGames');
    return allGames.lock;
  }

  static void registerImplementation() {
    ServerClient.registerImplementation(SupabaseLocation,
        (reader, address, id) => SupabaseServerClient(reader, id));
  }
}

class SupabaseGameClient extends GameClient {
  SupabaseGameClient(String playerID, Reader read) : super(playerID, read);
  SupabaseClient get _supaClient => read(supabaseProvider);
  SupabaseQueryBuilder get gameDB => _supaClient.from('Game');
  late RealtimeSubscription _gameSub;
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void exitGame() {
    // TODO: implement exitGame
  }

  @override
  Future<void> register() async {
    var result =
        await gameDB.select('players, config').eq('id', gameCode).execute();
    if (result.error == null) {
      _supaLogger.info(result.data);
      // ignore: avoid_dynamic_calls
      final oldPlayers = (result.data[0]['players'] as List)
          .map((p) => Player.fromJson(p as Map<String, dynamic>))
          .toList();

      final gameConfig =
          // ignore: avoid_dynamic_calls
          GameConfig.fromJson(result.data[0]['config'] as Map<String, dynamic>);
      // _supaClient.realtime.onOpen(() => print('Socket opened.'));
      // _supaClient.realtime.onClose((event) => print('Socket closed $event'));
      _supaClient.realtime.onError((error) => print('Socket error: $error'));
      _supaClient.realtime.onMessage((d) => print('Socket Message: $d'));
      _gameSub = gameDB.on(SupabaseEventTypes.all, (d) {
        print('_______________\n\n\n\n\n\n\n');
        _supaLogger.info('$d');
        print('_______________\n\n\n\n\n\n\n');
      }).subscribe((e, {errorMsg}) => print('$e, $errorMsg'));
      print(_gameSub.topic);
      _gameSub.onError(print);

      if (oldPlayers.any((p) => p.id == playerID)) {
        _supaLogger.info('Player $playerID Rejoining');
        return;
      }
      final newPlayers = oldPlayers.lock
          .add(Player(playerID, name: read.gameFor(playerID).playerName));
      if (newPlayers.length == gameConfig.maxPlayers) {
        _supaLogger.info('Max Limit');

        result = await gameDB
            .update({
              'players': newPlayers,
              'state': Game.getInitialState(gameConfig, newPlayers,
                  BackendGameReader(read, BackendProvider(read, gameCode)))
            })
            .eq('id', gameCode)
            .execute();
      } else {
        _supaLogger.info('More players please');
        result = await gameDB
            .update({'players': newPlayers})
            .eq('id', gameCode)
            .execute();
      }
    } else {
      _supaLogger.info(result.error?.details);
      _supaLogger.info(result.error?.message);
    }
  }

  @override
  void sendEvent(Event event) {}

  static void registerImplementation() {
    GameClient.registerImplementation(
      SupabaseLocation,
      (read, address, id) => SupabaseGameClient(id, read),
    );
  }
}

void registerSupabaseServerClients() {
  SupabaseServerClient.registerImplementation();
  SupabaseGameClient.registerImplementation();
}

extension PlayerXName on Player {
  String get nameOrID => name == '' ? id : name;
}
