import 'dart:io';

//ignore: library_prefixes
import 'package:riverpod/all.dart';

import 'game.dart';
import 'game_client.dart';
import 'server_client.dart';

enum GameLocation { Local, IOServer, Firebase }
final socketIOOpts = <String, dynamic>{
  'transports': ['websocket'],
  'forceNew': true,
};
String get homeDir {
  if (Platform.isMacOS) {
    return Platform.environment['HOME'];
  } else if (Platform.isLinux) {
    return Platform.environment['HOME'];
  } else if (Platform.isWindows) {
    return Platform.environment['UserProfile'];
  }
  return Platform.environment['HOME'];
}

const defaultGamePort = 45912;
const defaultAddress = 'your game server ip';
final selectedAddress = StateProvider((ref) => defaultAddress);
// Player info
final playerIdProvider = ScopedProvider((ref) => 0);
final playerNameProvider =
    StateProvider.family<String, PlayerID>((ref, _) => '');

// Game config and info
final gameCodeProvider =
    StateProvider.family<String, PlayerID>((ref, index) => '');
final gameConfigProvider = StateProvider<GameConfig>((ref) => null);
final gameNameProvider = Provider<String>(
    (ref) => ref.watch(gameConfigProvider).state.gameType.name);

final gameLocationProvider =
    StateProvider<GameLocation>((ref) => GameLocation.IOServer);
// Clients
final gameServerClientProvider =
    Provider.family<ServerClient, PlayerID>((ref, id) {
  final location = ref.watch(gameLocationProvider).state;
  final address = ref.watch(selectedAddress).state;
  if (address == defaultAddress) {
    throw UnimplementedError(
        'Please set the address for the remote server before connecting a game server client');
  }
  final client = ServerClient.fromParams(
      location: location, read: ref.read, address: address, id: id);

  ref.onDispose(client.dispose);
  return client;
});
final gameClientProvider = Provider.family<GameClient, PlayerID>((ref, id) {
  final location = ref.watch(gameLocationProvider).state;
  final gameCode = ref.watch(gameCodeProvider(id)).state;
  final address = ref.watch(selectedAddress).state;
  if (address == defaultAddress) {
    throw UnimplementedError(
        'Please set the address for the remote server before connecting a game server client');
  }
  final client = GameClient.fromParams(
      location: location,
      read: ref.read,
      address: address,
      id: id,
      gameCode: gameCode);
  ref.onDispose(client.dispose);
  return client;
});

// Game info
final gameInfoProvider = StateProvider<GameInfo>((ref) => null);
final gamesProvider = FutureProvider.family<List<GameInfo>, PlayerID>(
    (ref, id) => ref.read(gameServerClientProvider(id)).getGames());

// Game states
final gameStateProvider =
    StateProvider.family<Game, PlayerID>((ref, id) => null);
final gameStatusProvider = StateProvider.family<GameStatus, PlayerID>(
    (ref, id) => GameStatus.NotConnected);
final gameTurnProvider = Provider.family<bool, PlayerID>(
  (ref, id) => ref.watch(gameStateProvider(id)).state.currentPlayer.id == id,
);
