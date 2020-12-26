import 'package:riverpod/all.dart';

import '../../core.dart';
import '../clients.dart';

/// An on device implementation of [ServerClient]
///
/// Warning implementation not complete or tested yet
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
      OnDeviceLocation,
      (read, address, id) => NoServerClient(read: read, id: id),
    );
  }
}
