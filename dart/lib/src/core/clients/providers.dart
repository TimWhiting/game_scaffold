// ignore_for_file: avoid_classes_with_only_static_members

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

class GameProviders {
  GameProviders._();

  /// The provider that controls which game server address to connect to
  static final remoteUri = StateProvider<GameAddress>((ref) => defaultAddress);

  /// Provides the player id for a particular section of the widget tree
  ///
  /// This is so that a multiplayer game within the same app can be played
  static final playerIDProvider = Provider<PlayerID>((ref) => '');

  /// Allows one config to write all players' configs
  static final singleConfig =
      StateProvider<GameConfig>((ref) => const GameConfig(gameType: ''));

  /// The provider that controls the [GameClient] and [ServerClient]
  /// implementation to use
  static final clientType = StateProvider<ClientType>((ref) => IOClient);

  /// Provides the player's name
  static final playerName =
      StateProvider<String>((ref) => '', dependencies: [playerIDProvider]);

  /// Provides the game code for each client id
  static final StateProvider<GameCode> code =
      StateProvider((ref) => '', dependencies: [playerIDProvider]);

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  static final StreamProvider<GameInfo> lobby = StreamProvider(
    (ref) {
      final _ = ref.watch(code); // Invalidate gameLobby on change of gameCode
      final c = ref.watch(client);
      return c.gameLobby();
    },
    dependencies: [playerIDProvider],
  );

  /// Provides the game info of all games that the client with the specified id
  /// is a part of
  static final games = StateNotifierProvider<
      LastOrLoadingStateNotifier<IList<GameInfo>>,
      LoadingFuture<IList<GameInfo>>>(
    (ref) {
      final c = ref.watch(client);
      return LastOrLoadingStateNotifier(c.getGames);
    },
    dependencies: [playerIDProvider],
  );

  /// Provides the game state for the current game of the client with specified id
  static final StreamProvider<Game> state = StreamProvider<Game>(
    (ref) {
      final _ = ref.watch(code); // Invalidate on change of gameCode
      final c = ref.watch(client);
      return c.gameStream();
    },
    dependencies: [playerIDProvider],
  );

  /// Provides the game error for the current game of the client with specified id
  static final error = StateNotifierProvider<GameErrorNotifier, GameError?>(
    (ref) => GameErrorNotifier(),
    dependencies: [playerIDProvider],
  );

  /// Provides the game status for the current game of the client with specified id
  static final StateProvider<GameStatus> status = StateProvider<GameStatus>(
    (ref) {
      final _ = ref.watch(code); // Invalidate on change of gameCode
      return GameStatus.NotConnected;
    },
    dependencies: [playerIDProvider],
  );

  /// Provides whether it is the players turn for the current game of the client with the specified id
  static final Provider<bool> turn = Provider<bool>(
    (ref) {
      final playerID = ref.watch(playerIDProvider);
      final _ = ref.watch(code); // Invalidate on change of gameCode
      final currentPlayer = ref.watch(state).asData?.value.currentPlayer?.id;
      // Null indicates that all players can go simulataneously
      return currentPlayer == null || currentPlayer == playerID;
    },
    dependencies: [playerIDProvider],
  );

  /// Provides the way to configure the game for starting
  static final StateProvider<GameConfig> config = StateProvider<GameConfig>(
    (ref) => ref.watch(singleConfig).state,
    dependencies: [playerIDProvider],
  );

  /// Provides the game type's name for the game specified by [config]
  static final Provider<String> gameType = Provider<String>(
    (ref) => ref.watch(state).asData?.value.type.name ?? '',
    dependencies: [playerIDProvider],
  );

  /// Provides the [ServerClient] for each client id
  static final Provider<ServerClient> serverClient = Provider(
    (ref) {
      final playerID = ref.watch(playerIDProvider);
      final location = ref.watch(clientType).state;
      final address = ref.watch(remoteUri).state;
      if (location == IOClient && address == defaultAddress) {
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
  static final Provider<GameServerClient> client = Provider(
    (ref) {
      final c = GameServerClient(
        ref,
        ref.watch(gameClient),
        ref.watch(serverClient),
      );
      return c;
    },
    dependencies: [playerIDProvider],
  );

  /// Provides a [GameClient] for the client with the specified id
  static final Provider<GameClient> gameClient = Provider(
    (ref) {
      final playerID = ref.watch(playerIDProvider);
      final location = ref.watch(clientType).state;
      final address = ref.watch(remoteUri).state;
      if (location == IOClient && address == defaultAddress) {
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
