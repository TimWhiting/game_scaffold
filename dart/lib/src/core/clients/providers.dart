import 'package:riverpod/all.dart';

import '../core.dart';
import 'clients.dart';

/// The default port that is used for Game Clients
const defaultGamePort = 45912;

/// The default address to determine if the address has been set
const defaultAddress = 'your game server ip';

/// The provider that controls which game server address to connect to
final selectedAddress = StateProvider<String>((ref) => defaultAddress);

/// An enum for the location of the game server
// enum GameServerLocation { OnDevice, IOServer, Firebase }
// TODO: Fix this to be a typedef when non-function-type-aliases becomes available

/// The provider that controls the [GameClient] and [ServerClient]
/// implementation to use
final gameLocationProvider = StateProvider<String>((ref) => IOServerLocation);

final playerGameProvider =
    Provider.family<GameProvider, String>((ref, id) => GameProvider(id));

class GameProvider {
  GameProvider(this.id) {
    _gameCodeProvider = StateProvider((ref) => '');
    _gameInfoProvider = StateProvider((ref) => null);
    _gameLobbyProvider = StateProvider((ref) => null);
    _serverClientProvider = Provider(_serverClientImpl);
    _gameClientProvider = Provider(_gameClientImpl);
    _gameServerClientProvider = Provider(_gameServerClientImpl);
    _gamesProvider = FutureProvider(
      (ref) => ref.read(_gameServerClientProvider).getGames(),
    );
    _gameStateProvider = StateProvider<Game>((ref) => null);
    _gameErrorProvider = StateProvider<GameError>((ref) => null);
    _gameStatusProvider = StateProvider<GameStatus>(
      (ref) => GameStatus.NotConnected,
    );
    _gameTurnProvider = Provider<bool>(
      (ref) {
        final currentPlayer =
            ref.watch(_gameStateProvider).state.currentPlayer.id;
        // Null indicates that all players can go simulataneously
        return currentPlayer == null || currentPlayer == id;
      },
    );
    _gameConfigProvider = StateProvider<GameConfig>((ref) => null);
    _gameNameProvider = Provider<String>(
      (ref) => ref.watch(_gameConfigProvider).state.gameType.name,
    );
    _playerNameProvider = StateProvider<String>(
      (ref) =>
          ref
              .watch(_gameStateProvider)
              .state
              ?.players
              ?.first((p) => p.id == id)
              ?.name ??
          '',
    );
  }

  final String id;

  /// Provides the game code for each client id
  StateProvider<String> _gameCodeProvider;

  /// Provides the [ServerClient] for each client id
  Provider<ServerClient> _serverClientProvider;

  /// Provides a [GameServerClient] that communicates with the game server and handles game events
  Provider<GameServerClient> _gameServerClientProvider;

  /// Provides a [GameClient] for the client with the specified id
  Provider<GameClient> _gameClientProvider;

  /// Provides game info for the currently selected game
  StateProvider<GameInfo> _gameInfoProvider;

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  StateProvider<GameInfo> _gameLobbyProvider;

  /// Provides the game info of all games that the client with the specified id
  /// is a part of
  FutureProvider<List<GameInfo>> _gamesProvider;

  /// Provides the game state for the current game of the client with specified id
  StateProvider<Game> _gameStateProvider;

  /// Provides the game error for the current game of the client with specified id
  StateProvider<GameError> _gameErrorProvider;

  /// Provides the game status for the current game of the client with specified id
  StateProvider<GameStatus> _gameStatusProvider;

  /// Provides whether it is the players turn for the current game of the client with the specified id
  Provider<bool> _gameTurnProvider;

  /// Provides the way to configure the game for starting
  StateProvider<GameConfig> _gameConfigProvider;

  /// Provides the game type's name for the game specified by [gameConfigProvider]
  Provider<String> _gameNameProvider;

  /// Provides the name for the players based on their player id
  StateProvider<String> _playerNameProvider;

  ServerClient _serverClientImpl(ProviderReference ref) {
    final location = ref.watch(gameLocationProvider).state;
    final address = ref.watch(selectedAddress).state;
    if (location == IOServerLocation && address == defaultAddress) {
      throw UnimplementedError(
          'Please set the address for the remote server before connecting a game server client');
    }
    final client = ServerClient.fromParams(
        location: location, read: ref.read, address: address, playerID: id);

    ref.onDispose(client.dispose);
    return client;
  }

  GameServerClient _gameServerClientImpl(ProviderReference ref) {
    final client = GameServerClient(
      ref.read,
      ref.watch(_gameClientProvider),
      ref.watch(_serverClientProvider),
    );
    return client;
  }

  GameClient _gameClientImpl(ProviderReference ref) {
    final location = ref.watch(gameLocationProvider).state;
    final gameCode = ref.watch(_gameCodeProvider).state;
    final address = ref.watch(selectedAddress).state;
    if (location == IOServerLocation && address == defaultAddress) {
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
  }
}

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
final playerIDProvider = ScopedProvider((ref) => '');

extension ReaderGameX on ScopedReader {
  GameReader get game =>
      GameReader(this, this(playerGameProvider(this(playerIDProvider))));
}

class GameReader {
  GameReader(this.read, this.game);
  final Reader read;
  final GameProvider game;
  T call<T>(RootProvider<Object, T> provider) => read(provider);
}

extension GameReaderX on Reader {
  /// Setup parameters
  set address(String address) => this(selectedAddress).state = address;
  String get address => this(selectedAddress).state;

  GameReader game(String id) => GameReader(this, this(playerGameProvider(id)));

  /// Setup parameters
  set clientImplementation(String implementation) =>
      this(gameLocationProvider).state = implementation;
  String get clientImplementation => this(gameLocationProvider).state;
}

extension GameReaderGameX on GameReader {
  /// Client
  GameServerClient get gameClient => this(game._gameServerClientProvider);

  /// Server information
  GameInfo get currentGameInfo => this(game._gameInfoProvider).state;
  set currentGameInfo(GameInfo info) =>
      this(game._gameInfoProvider).state = info;
  GameInfo get lobbyInfo => this(game._gameLobbyProvider).state;
  set lobbyInfo(GameInfo info) => this(game._gameLobbyProvider).state = info;
  Future<List<GameInfo>> get gameInfos => this(game._gamesProvider.future);

  /// Game setup information
  GameConfig get gameConfig => this(game._gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      this(game._gameConfigProvider).state = config;
  String get gameCode => this(game._gameCodeProvider).state;
  set gameCode(String code) => this(game._gameCodeProvider).state = code;

  /// Game information
  Game get gameState => this(game._gameStateProvider).state;
  set gameState(Game g) => this(game._gameStateProvider).state = g;
  GameError get gameError => this(game._gameErrorProvider).state;
  set gameError(GameError error) => this(game._gameErrorProvider).state = error;
  GameStatus get gameStatus => this(game._gameStatusProvider).state;
  set gameStatus(GameStatus status) =>
      this(game._gameStatusProvider).state = status;
  bool get gameTurn => this(game._gameTurnProvider);
  String get gameName => this(game._gameNameProvider);
  String get playerName => this(game._playerNameProvider).state;
  set playerName(String name) => this(game._playerNameProvider).state = name;
}
