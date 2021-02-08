import 'dart:convert';

import 'package:game_scaffold/game_scaffold.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/all.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase/src/supabase_query_builder.dart';
import 'package:realtime_client/realtime_client.dart' hide Logger;

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
          .severe('In create game Supabase Error ${response.statusText}');
      return;
    }
    final code = response.data[0]['id'];
    game.gameCode = code;
    _supaLogger.info('GameCode: $code');
  }

  @override
  Future<bool> deleteGame() async {
    final response = await gameDB.delete().eq('id', game.gameCode).execute();
    if (response.error != null) {
      _supaLogger
          .severe('In delete game Supabase Error ${response.statusText}');
      return false;
    }
    return response.count == 1;
  }

  @override
  void dispose() {
    // I don't think anything needs to happen here because there are no listeners
  }

  @override
  Future<void> getGameInfo(String gameId) async {
    final response = await gameDB.select().eq('id', gameId).execute();
    if (response.error != null || response.count == 0) {
      _supaLogger
          .severe('In get game info Supabase Error ${response.statusText}');
      return;
    }
    final gameInfo = response.data[0] as Map<String, dynamic>;
    game.currentGameInfo = infoFromRow(gameInfo);
  }

  GameInfo infoFromRow(Map<String, dynamic> gameInfo) {
    print(gameInfo);
    final config = GameConfig.fromJson(gameInfo['config']);
    final players =
        (gameInfo['players'] as List).map((p) => Player.fromJson(p)).toList();
    return GameInfo(
      gameInfo['id'],
      players.map((p) => p.nameOrID).toList(),
      players.firstOrNullWhere((p) => p.id == playerID)?.nameOrID,
      config.adminId == playerID,
      config.gameType,
    );
  }

  @override
  Future<List<GameInfo>> getGames() async {
    final response =
        await _supaClient.rpc('getallgames', {'playerid': playerID}).execute();

    if (response.error != null || response.count == 0) {
      _supaLogger
          .severe('In get game info Supabase Error ${response.statusText}');
    }
    final gameInfo = response.data as List;
    final allGames = gameInfo.map((gi) => infoFromRow(gi)).toList();
    _supaLogger.info('All Games: $allGames');
    return allGames;
  }

  static void registerImplementation() {
    ServerClient.registerImplementation(
      SupabaseLocation,
      (reader, address, id) => SupabaseServerClient(reader, id),
    );
  }
}

class SupabaseGameClient extends GameClient {
  SupabaseGameClient(String playerID, Reader read) : super(playerID, read);
  SupabaseClient get _supaClient => read(supabaseProvider);
  SupabaseQueryBuilder get gameDB => _supaClient.from('Game');
  RealtimeSubscription _gameSub;
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
      final oldPlayers = (result.data[0]['players'] as List)
          .map((p) => Player.fromJson(p))
          .toList();

      final gameConfig = GameConfig.fromJson(result.data[0]['config']);
      // _supaClient.realtime.onOpen(() => print('Socket opened.'));
      // _supaClient.realtime.onClose((event) => print('Socket closed $event'));
      // _supaClient.realtime.onError((error) => print('Socket error: $error'));
      // _supaClient.realtime.onMessage((d) => print('Socket Message: $d'));
      _supaClient.realtime.connect();
      _gameSub = _supaClient.realtime.channel(
        'realtime:public:Game',
        chanParams: {'id': gameCode},
      );
      _gameSub.on(SupabaseEventTypes.update.name(), (d, {String ref}) {
        print('_______________\n\n\n\n\n\n\n');
        _supaLogger.info('$d');
        print('_______________\n\n\n\n\n\n\n');
      });
      _gameSub.subscribe();

      if (oldPlayers.any((p) => p.id == playerID)) {
        _supaLogger.info('Player $playerID Rejoining');
        return;
      }
      final newPlayers = [
        ...oldPlayers,
        Player(playerID, name: read.gameFor(playerID).playerName),
      ];
      if (newPlayers.length == gameConfig.maxPlayers) {
        _supaLogger.info('Max Limit');
        // TODO: This
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
      _supaLogger.info(result.statusText);
      _supaLogger.info(result.error.message);
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
  String get nameOrID => name == null || name == '' ? id : name;
}
