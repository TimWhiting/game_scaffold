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
  static final playerID = Provider<PlayerID>(
    (ref) => '',
    name: 'PlayerID',
  );

  /// Allows one config to write all players' configs
  static final singleConfig = StateProvider<GameConfig>(
    (ref) => const GameConfig(gameType: ''),
    name: 'SingleGameConfig',
  );

  /// The provider that controls the [GameClient] and [ServerClient]
  /// implementation to use
  static final clientType = StateProvider<ClientType>(
    (ref) => IOClient,
    name: 'ClientType',
  );

  /// Provides the player's name
  static final playerName = StateProvider<String>(
    (ref) => '',
    dependencies: [playerID],
    name: 'PlayerName',
  );

  /// Provides the game code for each client id
  static final StateProvider<GameCode> code = StateProvider(
    (ref) => '',
    dependencies: [playerID],
    name: 'GameCode',
  );

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  static final StreamProvider<GameInfo> lobby = StreamProvider(
    (ref) {
      final _ = ref.watch(code); // Invalidate gameLobby on change of gameCode
      final c = ref.watch(client);
      return c.gameLobby();
    },
    dependencies: [client, code],
    name: 'Lobby',
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
    dependencies: [client],
    name: 'ActiveGames',
  );

  /// Provides the game state for the current game of the client with specified id
  static final StreamProvider<Game> state = StreamProvider<Game>(
    (ref) {
      final _ = ref.watch(code); // Invalidate on change of gameCode
      final c = ref.watch(client);
      return c.gameStream();
    },
    dependencies: [code, client],
    name: 'GameStateStream',
  );

  /// Provides the game error for the current game of the client with specified id
  static final error = StateNotifierProvider<GameErrorNotifier, GameError?>(
    (ref) => GameErrorNotifier(),
    dependencies: [playerID],
    name: 'GameError',
  );

  /// Provides the game status for the current game of the client with specified id
  static final StateProvider<GameStatus> status = StateProvider<GameStatus>(
    (ref) {
      final _ = ref.watch(code); // Invalidate on change of gameCode
      return GameStatus.NotConnected;
    },
    dependencies: [playerID, code],
    name: 'GameStatus',
  );

  /// Provides whether it is the players turn for the current game of the client with the specified id
  static final Provider<bool> turn = Provider<bool>(
    (ref) {
      final pID = ref.watch(playerID);
      final _ = ref.watch(code); // Invalidate on change of gameCode
      final currentPlayer = ref.watch(state).asData?.value.currentPlayer?.id;
      // Null indicates that all players can go simulataneously
      return currentPlayer == null || currentPlayer == pID;
    },
    dependencies: [playerID, state, code],
    name: 'GameTurn',
  );

  /// Provides the way to configure the game for starting
  static final StateProvider<GameConfig> config = StateProvider<GameConfig>(
    (ref) => ref.watch(singleConfig),
    dependencies: [singleConfig],
    name: 'GameConfig',
  );

  /// Provides the game type's name for the game specified by [config]
  static final Provider<String> gameType = Provider<String>(
    (ref) => ref.watch(state).asData?.value.type.name ?? '',
    dependencies: [state],
    name: 'GameType',
  );

  /// Provides the [ServerClient] for each client id
  static final Provider<ServerClient> serverClient = Provider(
    (ref) {
      final pID = ref.watch(playerID);
      final location = ref.watch(clientType);
      final address = ref.watch(remoteUri);
      if (location == IOClient && address == defaultAddress) {
        throw UnimplementedError(
            'Please set the address for the remote server before connecting a game server client');
      }

      ref.onDispose(client.dispose);
      return client;
    },
    dependencies: [
      playerID,
      clientType,
      remoteUri,
      config,
      config.notifier,
      code
    ],
    name: 'ServerClient',
  );

  /// Provides a [GameClient] for the client with the specified id
  static final Provider<GameClient> gameClient = Provider(
    (ref) {
      final pID = ref.watch(playerID);
      final location = ref.watch(clientType);
      final address = ref.watch(remoteUri);
      if (location == IOClient && address == defaultAddress) {
        throw UnimplementedError(
            'Please set the address for the remote server before connecting a game server client');
      }
      final client = GameClient.fromParams(
        location: location,
        ref: ref,
        address: address,
        playerID: pID,
      );
      ref.onDispose(client.dispose);
      return client;
    },
    dependencies: [playerID, clientType, remoteUri],
    name: 'GameClient',
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
