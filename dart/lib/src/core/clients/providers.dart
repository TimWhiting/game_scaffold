// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:async';

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

  /// The provider that controls the [RoundClient] and [GameClient]
  /// implementation to use
  static final clientType = StateProvider<ClientType>(
    (ref) => IOClient,
    name: 'ClientType',
  );

  static final allClientTypes = StateProvider<List<ClientType>>(
    (ref) => [IOClient, OnDeviceClient],
    name: 'AllClientTypes',
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
  static final status = StateProvider.autoDispose<GameStatus?>(
    (ref) {
      final status = ref.watch(lobby).asData?.value.status;
      if (status == null) {
        return null;
      } else if (status == GameStatus.started) {
        return ref.watch(game).asData?.value.status ?? GameStatus.lobby;
      } else {
        return status;
      }
    },
    name: 'GameStatus',
    dependencies: [playerID, lobby, game],
  );

  /// Provides whether it is the players turn for the current game of the client with the specified id
  static final turn = Provider.autoDispose<bool>((ref) {
    final pID = ref.watch(playerID);
    final _ = ref.watch(code); // Invalidate on change of gameCode
    final currentPlayer = ref.watch(game).asData?.value.currentPlayer?.id;
    // Null indicates that all players can go simultaneously
    return currentPlayer == null || currentPlayer == pID;
  }, name: 'GameTurn', dependencies: [playerID, code, game]);

  /// Provides the way to configure the game for starting
  static final config = StateProvider<GameConfig>(
    (ref) => ref.watch(singleConfig),
    name: 'GameConfig',
    dependencies: [singleConfig, playerID],
  );

  /// Provides the game type's name for the game specified by [config]
  static final gameType = Provider.autoDispose<String>(
    (ref) => ref.watch(game).asData?.value.type.name ?? '',
    name: 'GameType',
    dependencies: [game, playerID],
  );

  /// Provides the [GameClient] for each client id
  static final gameClientFamily =
      Provider.autoDispose.family<GameClient, ClientType>(
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
    name: 'GameClientFamily',
    dependencies: [
      socketIOGameServerClient,
      onDeviceGameServerClient,
      playerID
    ],
  );

  static final gameClient = Provider.autoDispose<GameClient>(
    (ref) => ref.watch(gameClientFamily(ref.watch(clientType))),
    name: 'GameClient',
    dependencies: [clientType, gameClientFamily],
  );

  static final gameConnect = FutureProvider.autoDispose<void>(
    (ref) => ref.watch(gameClient).connect(),
    name: 'GameConnect',
    dependencies: [gameClient],
  );

  static final gameDisconnect = FutureProvider.autoDispose<void>(
    (ref) => ref.watch(gameClient).disconnect(),
    name: 'GameDisconnect',
    dependencies: [gameClient],
  );

  static final createGame = FutureProvider.autoDispose<String>(
    (ref) async {
      final c = await ref.watch(gameClient).createGame(
            ref.read(playerID),
            ref.read(config),
          );
      ref.read(code.notifier).state = c;
      return c;
    },
    name: 'CreateGame',
    dependencies: [
      gameClient,
      playerID,
      config,
      code.notifier,
    ],
  );
  static final connected = StateProvider<bool>((ref) => false);

  static final allGames = FutureProvider.autoDispose<IList<GameInfo>>(
    (ref) => ref.watch(gameClient).getGames(ref.read(playerID)),
    name: 'AllGames',
    dependencies: [gameClient, playerID],
  );

  static final deleteGame = FutureProvider.autoDispose<bool>(
    (ref) =>
        ref.watch(gameClient).deleteGame(ref.read(playerID), ref.read(code)),
    name: 'DeleteGame',
    dependencies: [gameClient, playerID, code],
  );

  /// Provides a [RoundClient] for the client with the specified id
  static final roundClientFamily =
      Provider.family.autoDispose<RoundClient, ClientType>(
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
    dependencies: [socketIOGameClient, onDeviceGameClient, playerID],
  );

  static final roundClient = Provider.autoDispose<RoundClient>(
    (ref) => ref.watch(roundClientFamily(ref.watch(clientType))),
    name: 'GameClient',
    dependencies: [clientType, roundClientFamily],
  );

  static final joinGame = FutureProvider.autoDispose<String?>(
    (ref) async {
      final name = await ref
          .watch(roundClient)
          .joinGame(ref.read(playerID), ref.read(code), ref.read(playerName));
      if (name != null) {
        ref.read(playerName.notifier).state = name;
      }
      return name;
    },
    name: 'JoinGame',
    dependencies: [
      roundClient,
      playerID,
      code,
      playerName,
      playerName.notifier,
    ],
  );

  static final startGame = FutureProvider.autoDispose<bool>(
    (ref) =>
        ref.watch(roundClient).startGame(ref.read(playerID), ref.read(code)),
    name: 'StartGame',
    dependencies: [roundClient, playerID, code],
  );

  static final exitGame = FutureProvider.autoDispose<bool>(
    (ref) =>
        ref.watch(roundClient).exitGame(ref.read(playerID), ref.read(code)),
    name: 'ExitGame',
    dependencies: [roundClient, playerID, code],
  );

  static final undo = FutureProvider.autoDispose<bool>(
    (ref) => ref.watch(roundClient).undo(ref.read(playerID), ref.read(code)),
    name: 'Undo',
    dependencies: [roundClient, playerID, code],
  );

  static final newRound = FutureProvider.autoDispose<bool>(
    (ref) =>
        ref.watch(roundClient).newRound(ref.read(playerID), ref.read(code)),
    name: 'NewRound',
    dependencies: [roundClient, playerID, code],
  );

  static final chatMessage = StateProvider<String>(
    (ref) => '',
    name: 'Message',
  );

  static final sendMessage = FutureProvider.autoDispose<bool>(
    (ref) => ref
        .watch(roundClient)
        .sendMessage(ref.read(playerID), ref.read(code), ref.read(chatMessage)),
    name: 'NewRound',
    dependencies: [roundClient, playerID, code, chatMessage],
  );

  static final sendEvent = FutureProvider.autoDispose.family<bool, GameEvent>(
    (ref, event) => ref
        .watch(roundClient)
        .sendEvent(ref.read(playerID), ref.read(code), event),
    name: 'SendEvent',
    dependencies: [roundClient, playerID, code],
  );

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  static final lobby = StreamProvider.autoDispose<GameInfo>(
    (ref) async* {
      final c = ref.watch(roundClient);
      yield* c.gameLobby(ref.watch(playerID), ref.watch(code));
    },
    name: 'Lobby',
    dependencies: [roundClient, playerID, code],
  );

  /// Provides the game or error state for the current game of the client with specified id
  static final gameOrError = StreamProvider.autoDispose<GameOrError>(
    (ref) {
      final c = ref.watch(roundClient);
      return c.gameStream(ref.watch(playerID), ref.watch(code));
    },
    name: 'GameOrErrorStream',
    dependencies: [roundClient, playerID, code],
  );

  /// Provides the game state for the current game of the client with specified id
  static final game = StreamProvider.autoDispose<Game>(
    (ref) async* {
      await for (final g in ref.watch(gameOrError.stream)) {
        if (g.isGame) {
          yield g.value!;
        }
      }
    },
    name: 'GameStateStream',
    dependencies: [gameOrError.stream, playerID],
  );

  /// Provides the game error for the current game of the client with specified id
  static final error = StreamProvider.autoDispose<GameError>(
    (ref) async* {
      await for (final g in ref.watch(gameOrError.stream)) {
        if (g.isError) {
          yield g.error!;
        }
      }
    },
    name: 'GameError',
    dependencies: [gameOrError.stream, playerID],
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
