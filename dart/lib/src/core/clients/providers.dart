import 'package:riverpod/all.dart';

import '../game.dart';
import 'clients.dart';

const defaultGamePort = 45912;
const defaultAddress = 'your game server ip';
final selectedAddress = StateProvider((ref) => defaultAddress);

enum GameLocation { Local, IOServer, Firebase }

final gameLocationProvider =
    StateProvider<GameLocation>((ref) => GameLocation.IOServer);
final gameServerClientProvider =
    Provider.family<ServerClient, String>((ref, id) {
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

// Game code
final gameCodeProvider =
    StateProvider.family<String, String>((ref, index) => '');
// Game client
final gameClientProvider = Provider.family<GameClient, String>((ref, id) {
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
final gamesProvider = FutureProvider.family<List<GameInfo>, String>(
    (ref, id) => ref.read(gameServerClientProvider(id)).getGames());

// Game states
final gameStateProvider = StateProvider.family<Game, String>((ref, id) => null);
final gameStatusProvider = StateProvider.family<GameStatus, String>(
    (ref, id) => GameStatus.NotConnected);
final gameTurnProvider = Provider.family<bool, String>(
  (ref, id) => ref.watch(gameStateProvider(id)).state.currentPlayer.id == id,
);

// Game config and info
final gameConfigProvider = StateProvider<GameConfig>((ref) => null);
final gameNameProvider = Provider<String>(
    (ref) => ref.watch(gameConfigProvider).state.gameType.name);

// Player info
final playerIDProvider = ScopedProvider((ref) => '');
final playerNameProvider = StateProvider.family<String, String>((ref, _) => '');
