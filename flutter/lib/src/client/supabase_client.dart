import 'dart:convert';

import 'package:game_scaffold/game_scaffold.dart';
import 'package:riverpod/all.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase/src/supabase_query_builder.dart';

const SupabaseLocation = 'supabase-server';

final supabaseProvider = Provider<SupabaseClient>(
    (ref) => throw UnimplementedError('Please Override Supabase Provider'));

class SupabaseServerClient extends ServerClient {
  SupabaseServerClient(Reader read, String id) : super(read, id);
  SupabaseClient get _supaClient => read(supabaseProvider);
  SupabaseQueryBuilder get gameDB => _supaClient.from('Game');
  @override
  Future<void> createGame() async {
    final response = await gameDB.insert({
      'id': generateGameID([]),
      'config': game.gameConfig.toJson(),
    }).execute();
    print(response.error);
    print(response.statusText);
    game.gameCode = response.data[0]['id'];
  }

  @override
  Future<bool> deleteGame() async {
    final response = await gameDB.delete().eq('id', game.gameCode).execute();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> getGameInfo(String gameId) async {
    final response = await gameDB.select().eq('id', gameId).execute();
    final gameInfo = response.data;
    // TODO: More gameinfo stuff
    return GameInfo(
        gameId, gameInfo['players'], '', false, gameInfo['gameType']);
  }

  @override
  Future<List<GameInfo>> getGames() {
    // TODO: implement getGames
    throw UnimplementedError();
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
      print(result.data);
      final newPlayers = (result.data[0]['players'] as List)
          .map((p) => Player.fromJson(p))
          .toList()
            ..add(
              Player(playerID, name: read.gameFor(playerID).playerName),
            );
      final gameConfig = GameConfig.fromJson(result.data[0]['config']);
      if (newPlayers.length == gameConfig.maxPlayers) {
        print('Max Limit');
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
        print('More players please');
        result = await gameDB
            .update({'players': newPlayers})
            .eq('id', gameCode)
            .execute();
      }

      // TODO: Subscribe to the game state
    } else {
      print(result.statusText);
      print(result.error.message);
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
