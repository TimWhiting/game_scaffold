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

/// The provider that controls the [GameClient] and [ServerClient]
/// implementation to use
final gameLocationProvider =
    StateProvider<ServerLocation>((ref) => IOServerLocation);

/// Provides an encapsulation of many providers related to a Game without having
/// to have each of them be a `family` provider.
final ProviderFamily<GameProvider, PlayerID> playerGameProvider =
    Provider.family<GameProvider, PlayerID>(
        (ref, id) => GameProvider(ref.read, id));
final playerIDsProvider =
    StateProvider<IList<PlayerID>>((ref) => <PlayerID>[].lock);

/// Provides an encapsulation of many providers without having to have each of
/// them be a `family` provider.
class GameProvider {
  GameProvider(this.read, this.playerID);

  /// The playerID associated with the providers in this GameProvider
  final PlayerID playerID;
  final Reader read;

  /// Provides the game code for each client id
  late final StateProvider<GameCode> gameCodeProvider =
      StateProvider((ref) => '');

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  late final StreamProvider<GameInfo> gameLobbyProvider = StreamProvider((ref) {
    final _ = ref
        .watch(gameCodeProvider); // Invalidate gameLobby on change of gameCode
    final client = ref.watch(gameServerClientProvider);
    return client.gameLobby();
  });

  /// Provides the game info of all games that the client with the specified id
  /// is a part of
  late final gamesProvider = StateNotifierProvider<
      LastOrLoadingStateNotifier<IList<GameInfo>>,
      LoadingFuture<IList<GameInfo>>>(
    (ref) {
      final client = ref.watch(gameServerClientProvider);
      return LastOrLoadingStateNotifier(client.getGames);
    },
  );

  /// Provides the game state for the current game of the client with specified id
  late final StreamProvider<Game> gameStateProvider =
      StreamProvider<Game>((ref) {
    final _ = ref.watch(gameCodeProvider); // Invalidate on change of gameCode
    final client = ref.watch(gameServerClientProvider);
    return client.gameStream();
  });

  /// Provides the game error for the current game of the client with specified id
  late final gameErrorProvider =
      StateNotifierProvider<GameErrorNotifier, GameError?>(
          (ref) => GameErrorNotifier());

  /// Provides the game status for the current game of the client with specified id
  late final StateProvider<GameStatus> gameStatusProvider =
      StateProvider<GameStatus>(
    (ref) {
      final _ = ref.watch(gameCodeProvider); // Invalidate on change of gameCode
      return GameStatus.NotConnected;
    },
  );

  /// Provides whether it is the players turn for the current game of the client with the specified id
  late final Provider<bool> gameTurnProvider = Provider<bool>(
    (ref) {
      final _ = ref.watch(gameCodeProvider); // Invalidate on change of gameCode
      final currentPlayer =
          ref.watch(gameStateProvider).data?.value.currentPlayer?.id;
      // Null indicates that all players can go simulataneously
      return currentPlayer == null || currentPlayer == playerID;
    },
  );

  /// Provides the way to configure the game for starting
  late final StateProvider<GameConfig> gameConfigProvider =
      StateProvider<GameConfig>((ref) => ref.watch(singleConfigProvider).state);

  /// Provides the game type's name for the game specified by [gameConfigProvider]
  late final Provider<String> gameNameProvider = Provider<String>(
    (ref) => ref.watch(gameStateProvider).data?.value.type.name ?? '',
  );

  /// Provides the [ServerClient] for each client id
  late final Provider<ServerClient> serverClientProvider =
      Provider(_serverClientImpl);

  ServerClient _serverClientImpl(ProviderRef<ServerClient> ref) {
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
  }

  /// Provides a [GameServerClient] that communicates with the game server and handles game events
  late final Provider<GameServerClient> gameServerClientProvider =
      Provider(_gameServerClientImpl);

  GameServerClient _gameServerClientImpl(ProviderRef ref) {
    final client = GameServerClient(
      ref,
      ref.watch(gameClientProvider),
      ref.watch(serverClientProvider),
    );
    return client;
  }

  /// Provides a [GameClient] for the client with the specified id
  late final Provider<GameClient> gameClientProvider =
      Provider(_gameClientImpl);

  GameClient _gameClientImpl(ProviderRef<GameClient> ref) {
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
  }

  /// Provides the player's name
  late final playerNameProvider = StateProvider<String>((ref) => '');
}

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
final playerIDProvider = Provider<PlayerID>((ref) => '');

extension ReaderGameX on Reader {
  GameReader get game =>
      GameReader(this, this(playerGameProvider(this(playerIDProvider))));
}

class GameReader {
  GameReader(this.read, this.game);
  final Reader read;
  final GameProvider game;
  T call<T>(ProviderBase<T> provider) => read(provider);
}

extension GameReaderX on Reader {
  /// Setup parameters
  set address(GameAddress address) => this(selectedAddress).state = address;
  GameAddress get address => this(selectedAddress).state;

  GameReader gameFor(PlayerID id) =>
      GameReader(this, this(playerGameProvider(id)));

  /// Setup parameters
  set clientImplementation(ServerLocation implementation) =>
      this(gameLocationProvider).state = implementation;
  ServerLocation get clientImplementation => this(gameLocationProvider).state;
  set gameConfig(GameConfig config) =>
      this(singleConfigProvider).state = config;
  GameConfig get gameConfig => this(singleConfigProvider).state;
  IList<PlayerID> get playerIDs => this(playerIDsProvider).state;
}

extension GameReaderGameX on GameReader {
  /// Client for the game
  GameServerClient get gameClient => this(game.gameServerClientProvider);

  /// Typically you should use [gameClient] instead
  ///
  /// Unless you have a specific api on your implementation of [GameClient]
  GameClient get onlyGameClient => this(game.gameClientProvider);

  /// Typically you should use [gameClient] instead
  ///
  /// Unless you have a specific api on your implementation of [ServerClient]
  ServerClient get onlyServerClient => this(game.serverClientProvider);

  /// Server information
  AsyncValue<GameInfo> get lobbyInfo => this(game.gameLobbyProvider);
  LoadingFuture<IList<GameInfo>> get gameInfos => this(game.gamesProvider);
  LastOrLoadingStateNotifier<IList<GameInfo>> get gameInfoNotifier =>
      this(game.gamesProvider.notifier);

  /// Game setup information
  GameConfig get gameConfig => this(game.gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      this(game.gameConfigProvider).state = config;
  GameCode get gameCode => this(game.gameCodeProvider).state;
  set gameCode(GameCode code) => this(game.gameCodeProvider).state = code;

  /// Game information
  AsyncValue<Game> get gameState => this(game.gameStateProvider);
  Game get lastGameState => gameState.data!.value;
  GameError? get gameError => this(game.gameErrorProvider);
  GameErrorNotifier get errorNotifier => this(game.gameErrorProvider.notifier);
  GameStatus get gameStatus => this(game.gameStatusProvider).state;
  set gameStatus(GameStatus status) =>
      this(game.gameStatusProvider).state = status;
  bool get gameTurn => this(game.gameTurnProvider);
  String get gameName => this(game.gameNameProvider);
  String get playerName => this(game.playerNameProvider).state;
  set playerName(String name) => this(game.playerNameProvider).state = name;
  void clearError() => this(game.gameErrorProvider.notifier).clearError();
}

/// Allows one config to write all players' configs
final singleConfigProvider =
    StateProvider<GameConfig>((ref) => const GameConfig(gameType: ''));

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
