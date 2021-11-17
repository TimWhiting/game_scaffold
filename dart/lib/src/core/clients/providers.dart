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
    name: 'PlayerName',
    dependencies: [playerID],
  );

  /// Provides the game code for each client id
  static final code = StateProvider<GameCode>(
    (ref) => '',
    name: 'GameCode',
    dependencies: [playerID],
  );

  /// Provides the game status for the current game of the client with specified id
  static final status = StateProvider<GameStatus?>(
    (ref) {
      final status = ref.watch(lobby).asData?.value.status;
      if (status == null) {
        return null;
      } else if (status == GameStatus.Started) {
        return ref.watch(game).asData?.value.status ?? GameStatus.Lobby;
      } else {
        return status;
      }
    },
    name: 'GameStatus',
    dependencies: [playerID],
  );

  /// Provides whether it is the players turn for the current game of the client with the specified id
  static final turn = Provider<bool>((ref) {
    final pID = ref.watch(playerID);
    final _ = ref.watch(code); // Invalidate on change of gameCode
    final currentPlayer = ref.watch(game).asData?.value.currentPlayer?.id;
    // Null indicates that all players can go simulataneously
    return currentPlayer == null || currentPlayer == pID;
  }, name: 'GameTurn', dependencies: [playerID, code, game]);

  /// Provides the way to configure the game for starting
  static final StateProvider<GameConfig> config = StateProvider<GameConfig>(
    (ref) => ref.watch(singleConfig),
    name: 'GameConfig',
    dependencies: [singleConfig, playerID],
  );

  /// Provides the game type's name for the game specified by [config]
  static final gameType = Provider<String>(
    (ref) => ref.watch(game).asData?.value.type.name ?? '',
    name: 'GameType',
    dependencies: [game],
  );

  /// Provides the [ServerClient] for each client id
  static final serverClientFamily = Provider.family<ServerClient, ClientType>(
    (ref, clientType) {
      switch (clientType) {
        case IOClient:
          return ref.watch(socketIOGameServerClient);
        case OnDeviceClient:
          return ref.watch(onDeviceGameServerClient);
        default:
          throw UnsupportedError('Unsupported client type');
      }
    },
    name: 'ServerClientFamily',
    dependencies: [socketIOGameServerClient, onDeviceGameServerClient],
  );

  static final serverClient = Provider<ServerClient>(
    (ref) => ref.watch(serverClientFamily(ref.watch(clientType))),
    name: 'ServerClient',
    dependencies: [clientType, serverClientFamily],
  );

  static final serverConnect = FutureProvider<void>(
    (ref) => ref.watch(serverClient).connect(),
    name: 'ServerConnect',
    dependencies: [serverClient],
  );

  static final serverDisconnect = FutureProvider<void>(
    (ref) => ref.watch(serverClient).disconnect(),
    name: 'ServerDisconnect',
    dependencies: [serverClient],
  );

  static final createGame = FutureProvider<String>(
    (ref) async {
      final c = await ref.watch(serverClient).createGame(
            ref.watch(playerID),
            ref.watch(config),
          );
      ref.read(code.notifier).state = c;
      return c;
    },
    name: 'CreateGame',
    dependencies: [
      serverClient,
      playerID,
      config,
      code.notifier,
    ],
  );
  static final connected = StateProvider<bool>((ref) => false);

  static final allGames = FutureProvider<IList<GameInfo>>(
    (ref) => ref.watch(serverClient).getGames(ref.watch(playerID)),
    name: 'AllGames',
    dependencies: [serverClient, playerID],
  );

  static final deleteGame = FutureProvider<bool>(
    (ref) => ref
        .watch(serverClient)
        .deleteGame(ref.watch(playerID), ref.watch(code)),
    name: 'DeleteGame',
    dependencies: [serverClient, playerID, code],
  );

  /// Provides a [GameClient] for the client with the specified id
  static final gameClientFamily = Provider.family<GameClient, ClientType>(
    (ref, clientType) {
      switch (clientType) {
        case IOClient:
          return ref.watch(socketIOGameClient);
        case OnDeviceClient:
          return ref.watch(onDeviceGameClient);
        default:
          throw UnsupportedError('Unsupported client type');
      }
    },
    name: 'GameClientFamily',
    dependencies: [socketIOGameClient, onDeviceGameClient],
  );

  static final gameClient = Provider<GameClient>(
    (ref) => ref.watch(gameClientFamily(ref.watch(clientType))),
    name: 'GameClient',
    dependencies: [clientType, gameClientFamily],
  );

  static final joinGame = FutureProvider<String?>(
    (ref) async {
      print('joining');
      final name = await ref
          .watch(gameClient)
          .joinGame(ref.watch(playerID), ref.watch(code), ref.read(playerName));
      if (name != null) {
        ref.read(playerName.notifier).state = name;
      }
      return name;
    },
    name: 'JoinGame',
    dependencies: [
      gameClient,
      playerID,
      code,
      playerName,
      playerName.notifier,
    ],
  );

  static final startGame = FutureProvider<bool>(
    (ref) =>
        ref.watch(gameClient).startGame(ref.watch(playerID), ref.watch(code)),
    name: 'StartGame',
    dependencies: [gameClient, playerID, code],
  );

  static final exitGame = FutureProvider<bool>(
    (ref) =>
        ref.watch(gameClient).exitGame(ref.watch(playerID), ref.watch(code)),
    name: 'ExitGame',
    dependencies: [gameClient, playerID, code],
  );

  static final undo = FutureProvider<bool>(
    (ref) => ref.watch(gameClient).undo(ref.watch(playerID), ref.watch(code)),
    name: 'Undo',
    dependencies: [gameClient, playerID, code],
  );

  static final newRound = FutureProvider<bool>(
    (ref) =>
        ref.watch(gameClient).newRound(ref.watch(playerID), ref.watch(code)),
    name: 'NewRound',
    dependencies: [gameClient, playerID, code],
  );

  static final chatMessage = StateProvider<String>(
    (ref) => '',
    name: 'Message',
  );

  static final sendMessage = FutureProvider<bool>(
    (ref) => ref.watch(gameClient).sendMessage(
        ref.watch(playerID), ref.watch(code), ref.watch(chatMessage)),
    name: 'NewRound',
    dependencies: [gameClient, playerID, code, chatMessage],
  );

  static final sendEvent = FutureProvider.autoDispose.family<bool, GameEvent>(
    (ref, event) => ref
        .watch(gameClient)
        .sendEvent(ref.watch(playerID), ref.watch(code), event),
    name: 'SendEvent',
    dependencies: [gameClient, playerID, code],
  );

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  static final lobby = StreamProvider<GameInfo>(
    (ref) {
      final c = ref.watch(gameClient);
      return c.gameLobby(ref.watch(playerID), ref.watch(code));
    },
    name: 'Lobby',
    dependencies: [gameClient, playerID, code],
  );

  /// Provides the game or error state for the current game of the client with specified id
  static final gameOrError = StreamProvider<GameOrError>(
    (ref) {
      final c = ref.watch(gameClient);
      return c.gameStream(ref.watch(playerID), ref.watch(code));
    },
    name: 'GameOrErrorStream',
    dependencies: [gameClient, playerID, code],
  );

  /// Provides the game state for the current game of the client with specified id
  static final game = StreamProvider<Game>(
    (ref) async* {
      await for (final g in ref.watch(gameOrError.stream)) {
        if (g.isGame) {
          yield g.value!;
        }
      }
    },
    name: 'GameStateStream',
    dependencies: [gameOrError.stream],
  );

  /// Provides the game error for the current game of the client with specified id
  static final error = StreamProvider<GameError>(
    (ref) async* {
      await for (final g in ref.watch(gameOrError.stream)) {
        if (g.isError) {
          yield g.error!;
        }
      }
    },
    name: 'GameError',
    dependencies: [gameOrError.stream],
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
