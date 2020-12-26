import 'package:riverpod/all.dart';

import '../core.dart';
import 'clients.dart';

/// The default port that is used for Game Clients
const defaultGamePort = 45912;

/// The default address to determine if the address has been set
const defaultAddress = 'your game server ip';

/// The provider that controls which game server address to connect to
final selectedAddress = StateProvider((ref) => defaultAddress);

/// An enum for the location of the game server
// enum GameServerLocation { OnDevice, IOServer, Firebase }
// TODO: Fix this to be a typedef when non-function-type-aliases becomes available

/// The provider that controls the [GameClient] and [ServerClient]
/// implementation to use
final gameLocationProvider = StateProvider<String>((ref) => IOServerLocation);

/// Provides the [ServerClient] for each client id
final gameServerClientProvider =
    Provider.family<ServerClient, String>((ref, id) {
  final location = ref.watch(gameLocationProvider).state;
  final address = ref.watch(selectedAddress).state;
  if (address == defaultAddress) {
    throw UnimplementedError(
        'Please set the address for the remote server before connecting a game server client');
  }
  final client = ServerClient.fromParams(
      location: location, read: ref.read, address: address, playerID: id);

  ref.onDispose(client.dispose);
  return client;
});

/// Provides the game code for each client id
final gameCodeProvider =
    StateProvider.family<String, String>((ref, index) => '');

/// Provides a [GameClient] for the client with the specified id
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

/// Provides game info for the currently selected game
final gameInfoProvider = StateProvider<GameInfo>((ref) => null);

/// Provides the game info of all games that the client with the specified id
/// is a part of
final gamesProvider = FutureProvider.family<List<GameInfo>, String>(
  (ref, id) => ref.read(gameServerClientProvider(id)).getGames(),
);

/// Provides the game state for the current game of the client with specified id
final gameStateProvider = StateProvider.family<Game, String>((ref, id) => null);

/// Provides the game status for the current game of the client with specified id
final gameStatusProvider = StateProvider.family<GameStatus, String>(
  (ref, id) => GameStatus.NotConnected,
);

/// Provides whether it is the players turn for the current game of the client with the specified id
final gameTurnProvider = Provider.family<bool, String>(
  (ref, id) {
    final currentPlayer =
        ref.watch(gameStateProvider(id)).state.currentPlayer.id;
    // Null indicates that all players can go simulataneously
    return currentPlayer == null || currentPlayer == id;
  },
);

/// Provides the way to configure the game for starting
final gameConfigProvider = StateProvider<GameConfig>((ref) => null);

/// Provides the game type's name for the game specified by [gameConfigProvider]
final gameNameProvider = Provider<String>(
  (ref) => ref.watch(gameConfigProvider).state.gameType.name,
);

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
final playerIDProvider = ScopedProvider((ref) => '');

/// Provides the name for the players based on their player id
final playerNameProvider = StateProvider.family<String, String>((ref, _) => '');
