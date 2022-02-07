// ignore_for_file: avoid_classes_with_only_static_members

import 'package:riverpod/riverpod.dart';

import '../core.dart';
import 'clients.dart';
import 'firebase_client.dart';

/// The default port
const defaultGamePort = 45912;

/// The default address to determine if the address has been set
final defaultAddress = Uri.parse('http://localhost:0');

extension _HandleBoolError<T> on ApiResponse<T> {
  T? handleError(Ref ref) => when(
        error: (e) {
          ref.read(GameProviders.error.notifier).state = e;
          return;
        },
        success: (r) => r,
      );
}

extension _HandleFutureBoolError<T> on Future<ApiResponse<T>> {
  Future<T?> handleError(Ref ref) async => (await this).when(
        error: (e) {
          ref.read(GameProviders.error.notifier).state = e;
          return;
        },
        success: (r) => r,
      );
}

class GameProviders {
  GameProviders._();

  /// The provider that controls which game server address to connect to
  static final remoteUri = StateProvider<GameAddress>((ref) => defaultAddress);

  /// Provides the player id for a particular section of the widget tree
  ///
  /// This is so that a multiplayer game within the same app can be played
  static final multiplayerID = Provider<int>(
    (ref) => 0,
    name: 'MultiplayerID',
  );

  /// Provides the in-game player id
  static final playerID = StateProvider<PlayerID>(
    (ref) => '',
    name: 'PlayerID',
  );

  /// Provides the auth id for a particular section of the widget tree
  static final authID = Provider<AuthID>(
    (ref) => '',
    name: 'AuthID',
  );

  /// Allows one config to write all players' configs
  static final singleConfig = StateProvider<GameConfig>(
    (ref) => const GameConfig(gameType: ''),
    name: 'SingleGameConfig',
  );

  /// The provider that controls the [RoundClient] and [GameClient]
  /// implementation to use
  static final clientType = StateProvider<ClientType>(
    (ref) => OnDeviceClient,
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
  static final status = StateProvider.autoDispose<GameStatus?>(
    (ref) {
      final status = ref.watch(lobby).asData?.value?.status;
      if (status == null) {
        return null;
      } else if (status == GameStatus.Started) {
        return ref.watch(game).asData?.value.status ?? GameStatus.Lobby;
      } else {
        return status;
      }
    },
    name: 'GameStatus',
    dependencies: [playerID, lobby, game],
  );

  /// Provides whether it is the players turn for the current game of the client with the specified id
  static final turn = Provider.autoDispose<bool>(
    (ref) {
      final pID = ref.watch(playerID);
      final _ = ref.watch(code); // Invalidate on change of gameCode
      final currentPlayer = ref.watch(game).asData?.value.currentPlayer?.id;
      // Null indicates that all players can go simulataneously
      return currentPlayer == null || currentPlayer == pID;
    },
    name: 'GameTurn',
    dependencies: [playerID, code, game],
  );

  /// Provides the way to configure the game for starting
  static final config = StateProvider<GameConfig>(
    (ref) => ref.watch(singleConfig),
    name: 'GameConfig',
    dependencies: [singleConfig, playerID],
  );

  /// Provides the game type's name for the game specified by [config]
  static final gameType = Provider.autoDispose<String>(
    (ref) => ref.watch(game).asData?.value.gameState.type.name ?? '',
    name: 'GameType',
    dependencies: [game, playerID],
  );

  /// Provides the [GameClient] for each client id
  static final gameClientFamily = Provider.autoDispose.family<GameClient, ClientType>(
    (ref, clientType) {
      switch (clientType) {
        case NetworkClient:
          return ref.watch(networkGameClient);
        case OnDeviceClient:
          return ref.watch(onDeviceGameClient);
        case FirebaseClient:
          return ref.watch(firebaseGameClient);
        default:
          throw UnsupportedError('Unsupported client type');
      }
    },
    name: 'GameClientFamily',
    dependencies: [networkGameClient, onDeviceGameClient, playerID],
  );

  static final gameClient = Provider.autoDispose<GameClient>(
    (ref) => ref.watch(gameClientFamily(ref.watch(clientType))),
    name: 'GameClient',
    dependencies: [clientType, gameClientFamily],
  );

  static final createGame = FutureProvider.autoDispose<CreateGameResponse?>(
    (ref) async {
      final response = await ref
          .read(gameClient)
          .createGame(CreateGameRequest(authID: ref.read(authID), config: ref.read(config)))
          .handleError(ref);
      if (response != null) {
        ref.read(code.notifier).state = response.code;
        ref.read(playerID.notifier).state = response.playerID;
      }
      return response;
    },
    name: 'CreateGame',
    dependencies: [gameClient, authID, error.notifier, config, code.notifier, playerID.notifier],
  );

  static final listGames = FutureProvider.autoDispose<IList<GameInfo>>(
    (ref) async {
      final response =
          await ref.watch(gameClient).listGames(ListGamesRequest(authID: ref.watch(authID))).handleError(ref);
      return response?.games ?? IList();
    },
    name: 'ListGames',
    dependencies: [gameClient, authID, error.notifier],
  );

  static final deleteGame = FutureProvider.autoDispose<DeleteGameResponse?>(
    (ref) => ref
        .read(gameClient)
        .deleteGame(
          DeleteGameRequest(playerID: ref.read(playerID), code: ref.read(code)),
        )
        .handleError(ref),
    name: 'DeleteGame',
    dependencies: [gameClient, playerID, error.notifier, code],
  );

  static final joinGame = FutureProvider.autoDispose<JoinGameResponse?>(
    (ref) =>
        ref.read(gameClient).joinGame(JoinGameRequest(authID: ref.read(authID), code: ref.read(code))).handleError(ref),
    name: 'JoinGame',
    dependencies: [gameClient, authID, code, error.notifier, playerID.notifier],
  );

  static final startGame = FutureProvider.autoDispose<StartGameResponse?>(
    (ref) => ref
        .read(gameClient)
        .startGame(StartGameRequest(playerID: ref.read(playerID), code: ref.read(code)))
        .handleError(ref),
    name: 'StartGame',
    dependencies: [gameClient, playerID, code, error.notifier],
  );

  static final updateConfig = FutureProvider.autoDispose<UpdateConfigResponse?>(
    (ref) => ref
        .read(gameClient)
        .updateConfig(UpdateConfigRequest(playerID: ref.read(playerID), config: ref.read(config)))
        .handleError(ref),
    name: 'UpdateConfig',
    dependencies: [gameClient, config, playerID, error.notifier],
  );

  static final undo = FutureProvider.autoDispose<SendEventResponse?>(
    (ref) => ref.read(gameClient).undo(ref.read(playerID), ref.read(code)).handleError(ref),
    name: 'Undo',
    dependencies: [gameClient, playerID, code, error.notifier],
  );

  static final newRound = FutureProvider.autoDispose<SendEventResponse?>(
    (ref) => ref.read(gameClient).newRound(ref.read(playerID), ref.read(code)).handleError(ref),
    name: 'NewRound',
    dependencies: [gameClient, playerID, code, error.notifier],
  );

  static final chatMessage = StateProvider<String>(
    (ref) => '',
    name: 'Message',
  );

  static final sendMessage = FutureProvider.autoDispose<SendEventResponse?>(
    (ref) =>
        ref.read(gameClient).sendMessage(ref.read(playerID), ref.read(code), ref.read(chatMessage)).handleError(ref),
    name: 'NewRound',
    dependencies: [gameClient, playerID, code, chatMessage, error.notifier],
  );

  static final sendEvent = FutureProvider.autoDispose.family<SendEventResponse?, Event>(
    (ref, event) => ref
        .watch(gameClient)
        .sendEvent(SendEventRequest(playerID: ref.read(playerID), code: ref.read(code), event: event))
        .handleError(ref),
    name: 'SendEvent',
    dependencies: [gameClient, playerID, code, error.notifier],
  );

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  static final lobby = StreamProvider.autoDispose<GameInfo?>(
    (ref) async* {
      final c = ref.watch(gameClient);
      yield* c
          .gameLobby(WatchLobbyRequest(playerID: ref.watch(playerID), code: ref.watch(code)))
          .map((e) => e.handleError(ref)?.gameInfo);
    },
    name: 'Lobby',
    dependencies: [gameClient, playerID, code, error.notifier],
  );

  /// Provides the game or error state for the current game of the client with specified id
  static final _gameOrError = StreamProvider.autoDispose<Game?>(
    (ref) {
      final c = ref.watch(gameClient);
      return c
          .gameStream(WatchGameRequest(playerID: ref.watch(playerID), code: ref.watch(code)))
          .map((e) => e.handleError(ref)?.game);
    },
    name: 'GameOrErrorStream',
    dependencies: [gameClient, playerID, code, error.notifier],
  );

  /// Provides the game state for the current game of the client with specified id
  static final game = StreamProvider.autoDispose<Game>(
    (ref) async* {
      await for (final g in ref.watch(_gameOrError.stream)) {
        if (g != null) {
          yield g;
        }
      }
    },
    name: 'GameStateStream',
    dependencies: [_gameOrError.stream, playerID],
  );

  /// Provides the game error for the current game of the client with specified id
  static final error = StateProvider.autoDispose<String>(
    (ref) => '',
    name: 'GameError',
    dependencies: [playerID],
  );
}
