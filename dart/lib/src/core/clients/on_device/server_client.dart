import 'package:riverpod/all.dart';

import '../../game.dart';
import '../clients.dart';

class NoServerClient extends ServerClient {
  NoServerClient({Reader read, String id}) : super(read, id);

  @override
  void connect() {}

  @override
  Future<void> createGame() async {}

  @override
  Future<bool> deleteGame() async => true;

  @override
  void disconnect() {}

  @override
  void dispose() {}

  @override
  Future<void> getGameInfo(String gameId) async {}

  @override
  Future<List<GameInfo>> getGames() async => [];

  static void registerImplementation() {
    ServerClient.registerImplementation(
      GameServerLocation.OnDevice,
      (read, address, id) => NoServerClient(read: read, id: id),
    );
  }
}
