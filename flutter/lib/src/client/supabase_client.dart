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
  SupabaseQueryBuilder get gameConfig => _supaClient.from('GameConfig');
  @override
  Future<void> createGame() async {
    final response =
        await gameConfig.insert({'config': game.gameConfig.toJson()}).execute();
    game.gameCode = response.data['id'];
  }

  @override
  Future<bool> deleteGame() async {
    final response =
        await gameConfig.delete().eq('id', game.gameCode).execute();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> getGameInfo(String gameId) async {
    final response = await gameConfig.select().eq('id', gameId).execute();
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
  SupabaseGameClient(String id, Reader read) : super(id, read);
  SupabaseClient get _supaClient => read(supabaseProvider);
  SupabaseQueryBuilder get gameConfig => _supaClient.from('GameConfig');
  SupabaseQueryBuilder get gameState => _supaClient.from('GameState');

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void exitGame() {
    // TODO: implement exitGame
  }

  @override
  Future<void> register() {
    // TODO: implement register
    throw UnimplementedError();
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
