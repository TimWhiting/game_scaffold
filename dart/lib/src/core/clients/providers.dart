import 'dart:async';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

import '../core.dart';
import 'clients.dart';
part 'providers.freezed.dart';

/// The default port
const defaultGamePort = 45912;

/// The default address to determine if the address has been set
final defaultAddress = Uri.parse('http://localhost:0');

/// The provider that controls which game server address to connect to
final selectedAddress = StateProvider<GameAddress>((ref) => defaultAddress);

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
final playerIDProvider = Provider<PlayerID>((ref) => '');

/// Allows one config to write all players' configs
final singleConfigProvider =
    StateProvider<GameConfig>((ref) => const GameConfig(gameType: ''));

/// The provider that controls the [GameClient] and [ServerClient]
/// implementation to use
final gameLocationProvider =
    StateProvider<ServerLocation>((ref) => IOServerLocation);

/// Provides the player's name
final playerNameProvider =
    StateProvider<String>((ref) => '', dependencies: [playerIDProvider]);

final playerIDsProvider =
    StateProvider<IList<PlayerID>>((ref) => <PlayerID>[].lock);

/// Provides the game code for each client id
final StateProvider<GameCode> gameCodeProvider =
    StateProvider((ref) => '', dependencies: [playerIDProvider]);

/// Provides game lobby info in the form of [GameInfo] for the lobby
final StreamProvider<GameInfo> gameLobbyProvider = StreamProvider(
  (ref) {
    final _ = ref
        .watch(gameCodeProvider); // Invalidate gameLobby on change of gameCode
    final client = ref.watch(gameServerClientProvider);
    return client.gameLobby();
  },
  dependencies: [playerIDProvider],
);

/// Provides the game info of all games that the client with the specified id
/// is a part of
final gamesProvider = StateNotifierProvider<
    LastOrLoadingStateNotifier<IList<GameInfo>>,
    LoadingFuture<IList<GameInfo>>>(
  (ref) {
    final client = ref.watch(gameServerClientProvider);
    return LastOrLoadingStateNotifier(client.getGames);
  },
  dependencies: [playerIDProvider],
);

/// Provides the game state for the current game of the client with specified id
final StreamProvider<Game> gameStateProvider = StreamProvider<Game>(
  (ref) {
    final _ = ref.watch(gameCodeProvider); // Invalidate on change of gameCode
    final client = ref.watch(gameServerClientProvider);
    return client.gameStream();
  },
  dependencies: [playerIDProvider],
);

/// Provides the game error for the current game of the client with specified id
final gameErrorProvider = StateNotifierProvider<GameErrorNotifier, GameError?>(
  (ref) => GameErrorNotifier(),
  dependencies: [playerIDProvider],
);

/// Provides the game status for the current game of the client with specified id
final StateProvider<GameStatus> gameStatusProvider = StateProvider<GameStatus>(
  (ref) {
    final _ = ref.watch(gameCodeProvider); // Invalidate on change of gameCode
    return GameStatus.NotConnected;
  },
  dependencies: [playerIDProvider],
);

/// Provides whether it is the players turn for the current game of the client with the specified id
final Provider<bool> gameTurnProvider = Provider<bool>(
  (ref) {
    final playerID = ref.watch(playerIDProvider);
    final _ = ref.watch(gameCodeProvider); // Invalidate on change of gameCode
    final currentPlayer =
        ref.watch(gameStateProvider).asData?.value.currentPlayer?.id;
    // Null indicates that all players can go simulataneously
    return currentPlayer == null || currentPlayer == playerID;
  },
  dependencies: [playerIDProvider],
);

/// Provides the way to configure the game for starting
final StateProvider<GameConfig> gameConfigProvider = StateProvider<GameConfig>(
  (ref) => ref.watch(singleConfigProvider).state,
  dependencies: [playerIDProvider],
);

/// Provides the game type's name for the game specified by [gameConfigProvider]
final Provider<String> gameNameProvider = Provider<String>(
  (ref) => ref.watch(gameStateProvider).asData?.value.type.name ?? '',
  dependencies: [playerIDProvider],
);

/// Provides the [ServerClient] for each client id
final Provider<ServerClient> serverClientProvider = Provider(
  (ref) {
    final playerID = ref.watch(playerIDProvider);
    final location = ref.watch(gameLocationProvider).state;
    final address = ref.watch(selectedAddress).state;
    if (location == IOServerLocation && address == defaultAddress) {
      throw UnimplementedError(
          'Please set the address for the remote server before connecting a game server client');
    }
    final client = ServerClient.fromParams(
      location: location,
      ref: ref,
      address: address,
      playerID: playerID,
    );

    ref.onDispose(client.dispose);
    return client;
  },
  dependencies: [playerIDProvider],
);

/// Provides a [GameServerClient] that communicates with the game server and handles game events
final Provider<GameServerClient> gameServerClientProvider = Provider(
  (ref) {
    final client = GameServerClient(
      ref,
      ref.watch(gameClientProvider),
      ref.watch(serverClientProvider),
    );
    return client;
  },
  dependencies: [playerIDProvider],
);

/// Provides a [GameClient] for the client with the specified id
final Provider<GameClient> gameClientProvider = Provider(
  (ref) {
    final playerID = ref.watch(playerIDProvider);
    final location = ref.watch(gameLocationProvider).state;
    final address = ref.watch(selectedAddress).state;
    if (location == IOServerLocation && address == defaultAddress) {
      throw UnimplementedError(
          'Please set the address for the remote server before connecting a game server client');
    }
    final client = GameClient.fromParams(
      location: location,
      ref: ref,
      address: address,
      playerID: playerID,
    );
    ref.onDispose(client.dispose);
    return client;
  },
  dependencies: [playerIDProvider],
);

extension GameReaderX on Reader {
  /// Setup parameters
  set address(GameAddress address) => this(selectedAddress).state = address;
  GameAddress get address => this(selectedAddress).state;

  /// Setup parameters
  set clientImplementation(ServerLocation implementation) =>
      this(gameLocationProvider).state = implementation;
  ServerLocation get clientImplementation => this(gameLocationProvider).state;
  set singleGameConfig(GameConfig config) =>
      this(singleConfigProvider).state = config;
  GameConfig get singleGameConfig => this(singleConfigProvider).state;
  IList<PlayerID> get playerIDs => this(playerIDsProvider).state;
}

extension GameReaderGameX on Reader {
  /// Client for the game
  GameServerClient get gameClient => this(gameServerClientProvider);

  /// Typically you should use [gameClient] instead
  ///
  /// Unless you have a specific api on your implementation of [GameClient]
  GameClient get onlyGameClient => this(gameClientProvider);

  /// Typically you should use [gameClient] instead
  ///
  /// Unless you have a specific api on your implementation of [ServerClient]
  ServerClient get onlyServerClient => this(serverClientProvider);

  /// Server information
  AsyncValue<GameInfo> get lobbyInfo => this(gameLobbyProvider);
  LoadingFuture<IList<GameInfo>> get gameInfos => this(gamesProvider);
  LastOrLoadingStateNotifier<IList<GameInfo>> get gameInfoNotifier =>
      this(gamesProvider.notifier);

  /// Game setup information
  GameConfig get gameConfig => this(gameConfigProvider).state;
  set gameConfig(GameConfig config) => this(gameConfigProvider).state = config;
  GameCode get gameCode => this(gameCodeProvider).state;
  set gameCode(GameCode code) => this(gameCodeProvider).state = code;

  /// Game information
  AsyncValue<Game> get gameState => this(gameStateProvider);
  Stream<Game> get gameStateStream => this(gameStateProvider.stream);
  Game get lastGameState => gameState.asData!.value;
  GameError? get gameError => this(gameErrorProvider);
  GameErrorNotifier get errorNotifier => this(gameErrorProvider.notifier);
  GameStatus get gameStatus => this(gameStatusProvider).state;
  set gameStatus(GameStatus status) => this(gameStatusProvider).state = status;
  bool get gameTurn => this(gameTurnProvider);
  String get gameName => this(gameNameProvider);
  String get playerName => this(playerNameProvider).state;
  set playerName(String name) => this(playerNameProvider).state = name;
  void clearError() => this(gameErrorProvider.notifier).clearError();
}

class LastOrLoadingStateNotifier<T> extends StateNotifier<LoadingFuture<T>> {
  LastOrLoadingStateNotifier(this._creator)
      : super(const LoadingFuture.loading()) {
    scheduleMicrotask(refresh);
  }
  final Future<T> Function() _creator;
  Future<T> refresh() async {
    if (state is FutureLoading) {
      final result = await _creator();
      state = LoadingFuture.value(result);
      return result;
    } else {
      state = LoadingFuture.refreshing(state.value);
      final result = await _creator();
      state = LoadingFuture.value(result);
      return result;
    }
  }
}

@freezed
class LoadingFuture<T> with _$LoadingFuture {
  const LoadingFuture._();
  const factory LoadingFuture.loading() = FutureLoading<T>;
  const factory LoadingFuture.refreshing(T lastValue) = FutureRefreshing<T>;
  const factory LoadingFuture.value(T value) = FutureValue<T>;
  bool get hasData => maybeMap(loading: (_) => false, orElse: () => true);
  T get value => when(
      loading: () => throw Exception('Got value in loading state'),
      refreshing: (v) => v as T,
      value: (v) => v as T);
}
