import 'package:riverpod/riverpod.dart';
import 'package:collection/collection.dart';
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

/// Provides an encapsulation of many providers related to a Game without having
/// to have each of them be a `family` provider.
final ProviderFamily<GameProvider, String>? playerGameProvider =
    Provider.family<GameProvider, String>((ref, id) {
  final gp = GameProvider(ref.read, id);

  ref.onDispose(() {
    if (ref.mounted) {
      gp.dispose();
    }
  });
  return gp;
});
final playerIDsProvider =
    StateProvider<List<String>>((ref) => List.unmodifiable(<String>[]));

/// Provides an encapsulation of many providers without having to have each of
/// them be a `family` provider.
class GameProvider {
  // TODO: Replace most of these providers with using final late after switching
  // to Dart 2.12
  GameProvider(this.read, this.playerID) {
    Future.delayed(
      10.milliseconds,
      () => read(playerIDsProvider).state =
          [...read(playerIDsProvider).state, playerID].toUnmodifiable(),
    );
    _gameCodeProvider = StateProvider((ref) => '');
    _gameInfoProvider = StateProvider((ref) => null);
    _gameLobbyProvider = StateProvider((ref) => null);
    _serverClientProvider = Provider(_serverClientImpl);
    _gameClientProvider = Provider(_gameClientImpl);
    _gameServerClientProvider = Provider(_gameServerClientImpl);
    _gamesProvider = FutureProvider(
      (ref) => ref.read(_gameServerClientProvider).getGames(),
    );
    _gameStateProvider = StateProvider<Game?>((ref) => null);
    _gameErrorProvider = StateProvider<GameError?>((ref) => null);
    _gameStatusProvider = StateProvider<GameStatus>(
      (ref) => GameStatus.NotConnected,
    );
    _gameTurnProvider = Provider<bool>(
      (ref) {
        final currentPlayer =
            ref.watch(_gameStateProvider).state!.currentPlayer?.id;
        // Null indicates that all players can go simulataneously
        return currentPlayer == null || currentPlayer == playerID;
      },
    );
    _gameConfigProvider = StateProvider<GameConfig>(
        (ref) => ref.watch(singleConfigProvider).state);
    _gameNameProvider = Provider<String>(
      (ref) => ref.watch(_gameStateProvider).state?.type.name ?? '',
    );
    _playerNameProvider = StateProvider<String?>(
      (ref) => ref
          .watch(_gameStateProvider)
          .state
          ?.players
          .firstWhereOrNull((p) => p.id == playerID)
          ?.name,
    );
  }

  /// The playerID associated with the providers in this GameProvider
  final String playerID;
  final Reader read;

  /// Provides the game code for each client id
  late StateProvider<String> _gameCodeProvider;

  /// Provides the game code for each client id
  StateProvider<String> get gameCodeProvider => _gameCodeProvider;

  /// Provides the [ServerClient] for each client id
  late Provider<ServerClient> _serverClientProvider;

  /// Provides a [GameClient] for the client with the specified id
  late Provider<GameClient> _gameClientProvider;

  /// Provides a [GameServerClient] that communicates with the game server and handles game events
  late Provider<GameServerClient> _gameServerClientProvider;

  /// Provides a [GameServerClient] that communicates with the game server and handles game events
  Provider<GameServerClient> get gameServerClientProvider =>
      _gameServerClientProvider;

  /// Provides game info for the currently selected game
  late StateProvider<GameInfo?> _gameInfoProvider;

  /// Provides game info for the currently selected game
  StateProvider<GameInfo?> get gameInfoProvider => _gameInfoProvider;

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  late StateProvider<GameInfo?> _gameLobbyProvider;

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  StateProvider<GameInfo?> get gameLobbyProvider => _gameLobbyProvider;

  /// Provides the game info of all games that the client with the specified id
  /// is a part of
  late FutureProvider<List<GameInfo>> _gamesProvider;

  /// Provides the game info of all games that the client with the specified id
  /// is a part of
  FutureProvider<List<GameInfo>> get gamesProvider => _gamesProvider;

  /// Provides the game state for the current game of the client with specified id
  late StateProvider<Game?> _gameStateProvider;

  /// Provides the game state for the current game of the client with specified id
  StateProvider<Game?> get gameStateProvider => _gameStateProvider;

  /// Provides the game error for the current game of the client with specified id
  late StateProvider<GameError?> _gameErrorProvider;

  /// Provides the game error for the current game of the client with specified id
  StateProvider<GameError?> get gameErrorProvider => _gameErrorProvider;

  /// Provides the game status for the current game of the client with specified id
  late StateProvider<GameStatus> _gameStatusProvider;

  /// Provides the game status for the current game of the client with specified id
  StateProvider<GameStatus> get gameStatusProvider => _gameStatusProvider;

  /// Provides whether it is the players turn for the current game of the client with the specified id
  late Provider<bool> _gameTurnProvider;

  /// Provides whether it is the players turn for the current game of the client with the specified id
  Provider<bool> get gameTurnProvider => _gameTurnProvider;

  /// Provides the way to configure the game for starting
  late StateProvider<GameConfig> _gameConfigProvider;

  /// Provides the way to configure the game for starting
  StateProvider<GameConfig> get gameConfigProvider => _gameConfigProvider;

  /// Provides the game type's name for the game specified by [gameConfigProvider]
  late Provider<String> _gameNameProvider;

  /// Provides the game type's name for the game specified by [gameConfigProvider]
  Provider<String> get gameNameProvider => _gameNameProvider;

  /// Provides the name for the players based on their player id
  late StateProvider<String?> _playerNameProvider;

  /// Provides the name for the players based on their player id
  StateProvider<String?> get playerNameProvider => _playerNameProvider;

  ServerClient _serverClientImpl(ProviderReference ref) {
    final location = ref.watch(gameLocationProvider).state;
    final address = ref.watch(selectedAddress).state;
    if (location == IOServerLocation && address == defaultAddress) {
      throw UnimplementedError(
          'Please set the address for the remote server before connecting a game server client');
    }
    final client = ServerClient.fromParams(
        location: location,
        read: ref.read,
        address: address,
        playerID: playerID);

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
    final address = ref.watch(selectedAddress).state;
    if (location == IOServerLocation && address == defaultAddress) {
      throw UnimplementedError(
          'Please set the address for the remote server before connecting a game server client');
    }
    final client = GameClient.fromParams(
      location: location,
      read: ref.read,
      address: address,
      playerID: playerID,
    );
    ref.onDispose(client.dispose);
    return client;
  }

  void dispose() {
    read(playerIDsProvider).state = IterableX(read(playerIDsProvider).state)
        .whereNot((id) => id == playerID)
        .toUnmodifiable();
  }
}

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
final playerIDProvider = ScopedProvider((ref) => '');

extension ReaderGameX on ScopedReader {
  GameReader get game =>
      GameReader(this, this(playerGameProvider!(this(playerIDProvider))));
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

  GameReader gameFor(String id) =>
      GameReader(this, this(playerGameProvider!(id)));

  /// Setup parameters
  set clientImplementation(String implementation) =>
      this(gameLocationProvider).state = implementation;
  String get clientImplementation => this(gameLocationProvider).state;
  set gameConfig(GameConfig config) =>
      this(singleConfigProvider).state = config;
  GameConfig get gameConfig => this(singleConfigProvider).state;
  List<String> get playerIDs => this(playerIDsProvider).state;
}

extension GameReaderGameX on GameReader {
  /// Client for the game
  GameServerClient get gameClient => this(game._gameServerClientProvider);

  /// Typically you should use [gameClient] instead
  ///
  /// Unless you have a specific api on your implementation of [GameClient]
  GameClient get onlyGameClient => this(game._gameClientProvider);

  /// Typically you should use [gameClient] instead
  ///
  /// Unless you have a specific api on your implementation of [ServerClient]
  ServerClient get onlyServerClient => this(game._serverClientProvider);

  /// Server information
  GameInfo? get currentGameInfo => this(game._gameInfoProvider).state;
  set currentGameInfo(GameInfo? info) =>
      this(game._gameInfoProvider).state = info;
  GameInfo? get lobbyInfo => this(game._gameLobbyProvider).state;
  set lobbyInfo(GameInfo? info) => this(game._gameLobbyProvider).state = info;
  Future<List<GameInfo>>? get gameInfos => this(game._gamesProvider.future);

  /// Game setup information
  GameConfig get gameConfig => this(game._gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      this(game._gameConfigProvider).state = config;
  String get gameCode => this(game._gameCodeProvider).state;
  set gameCode(String code) => this(game._gameCodeProvider).state = code;

  /// Game information
  Game? get gameState => this(game._gameStateProvider).state;
  set gameState(Game? g) => this(game._gameStateProvider).state = g;
  StateController<Game?> get gameStateController =>
      this(game._gameStateProvider);
  GameError? get gameError => this(game._gameErrorProvider).state;
  set gameError(GameError? error) =>
      this(game._gameErrorProvider).state = error;
  GameStatus get gameStatus => this(game._gameStatusProvider).state;
  set gameStatus(GameStatus status) =>
      this(game._gameStatusProvider).state = status;
  bool? get gameTurn => this(game._gameTurnProvider);
  String? get gameName => this(game._gameNameProvider);
  String? get playerName => this(game._playerNameProvider).state;
  set playerName(String? name) => this(game._playerNameProvider).state = name;
}

/// Allows one config to write all players' configs
final singleConfigProvider = StateProvider<GameConfig>((ref) => GameConfig());
