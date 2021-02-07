import 'package:game_scaffold/game_scaffold.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/all.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase/src/supabase_query_builder.dart';

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
    game.gameCode = response.data[0]['id'];
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
    final config = GameConfig.fromJson(gameInfo['config']);
    final players =
        (gameInfo['players'] as List).map((p) => Player.fromJson(p)).toList();
    return GameInfo(
      gameInfo['id'],
      players.map((p) => p.name).toList(),
      players.firstOrNullWhere((p) => p.id == playerID)?.name,
      config.adminId == playerID,
      config.gameType,
    );
  }

  @override
  Future<List<GameInfo>> getGames() async {
    final response = await gameDB.select('id, config, players').execute();
    if (response.error != null || response.count == 0) {
      _supaLogger
          .severe('In get game info Supabase Error ${response.statusText}');
    }
    final gameInfo = response.data as List;
    return gameInfo.map((gi) => infoFromRow(gi)).toList();
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
      final newPlayers = (result.data[0]['players'] as List)
          .map((p) => Player.fromJson(p))
          .toList()
            ..add(
              Player(playerID, name: read.gameFor(playerID).playerName),
            );
      final gameConfig = GameConfig.fromJson(result.data[0]['config']);
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

      // TODO: Subscribe to the game state
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
