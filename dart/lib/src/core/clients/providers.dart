// ignore_for_file: avoid_classes_with_only_static_members

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
    dependencies: [playerID, lobby, game],
  );

  /// Provides whether it is the players turn for the current game of the client with the specified id
  static final turn = Provider.autoDispose<bool>((ref) {
    final pID = ref.watch(playerID);
    final _ = ref.watch(code); // Invalidate on change of gameCode
    final currentPlayer = ref.watch(game).asData?.value.currentPlayer?.id;
    // Null indicates that all players can go simulataneously
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
  static final gameClientFamily = Provider.autoDispose.family<GameClient, ClientType>(
    (ref, clientType) {
      switch (clientType) {
        case NetworkClient:
          return ref.watch(socketIOGameServerClient);
        case OnDeviceClient:
          return ref.watch(onDeviceGameServerClient);
        default:
          throw UnsupportedError('Unsupported client type');
      }
    },
    name: 'GameClientFamily',
    dependencies: [socketIOGameServerClient, onDeviceGameServerClient, playerID],
  );

  static final gameClient = Provider.autoDispose<GameClient>(
    (ref) => ref.watch(gameClientFamily(ref.watch(clientType))),
    name: 'GameClient',
    dependencies: [clientType, gameClientFamily],
  );

  static final createGame = FutureProvider.autoDispose<ApiResponse<CreateGameResponse>>(
    (ref) async {
      final response =
          await ref.watch(gameClient).createGame(CreateGameRequest(authID: ref.read(authID), config: ref.read(config)));
      response.when(error: (e) {
        ref.read(error.notifier).state = e;
      }, success: (r) {
        ref.read(code.notifier).state = r.code;
      });
      return response;
    },
    name: 'CreateGame',
    dependencies: [
      gameClient,
      playerID,
      config,
      code.notifier,
    ],
  );

  static final allGames = FutureProvider.autoDispose<IList<GameInfo>>(
    (ref) => ref.watch(gameClient).getGames(ref.read(playerID)),
    name: 'AllGames',
    dependencies: [gameClient, playerID],
  );

  static final deleteGame = FutureProvider.autoDispose<bool>(
    (ref) => ref.watch(gameClient).deleteGame(ref.read(playerID), ref.read(code)),
    name: 'DeleteGame',
    dependencies: [gameClient, playerID, code],
  );

  static final joinGame = FutureProvider.autoDispose<String?>(
    (ref) async {
      final name = await ref.watch(gameClient).joinGame(ref.read(playerID), ref.read(code), ref.read(playerName));
      ref.read(playerName.notifier).state = name;
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

  static final startGame = FutureProvider.autoDispose<bool>(
    (ref) => ref.watch(gameClient).startGame(ref.read(playerID), ref.read(code)),
    name: 'StartGame',
    dependencies: [gameClient, playerID, code],
  );

  static final exitGame = FutureProvider.autoDispose<bool>(
    (ref) => ref.watch(gameClient).exitGame(ref.read(playerID), ref.read(code)),
    name: 'ExitGame',
    dependencies: [gameClient, playerID, code],
  );

  static final undo = FutureProvider.autoDispose<bool>(
    (ref) => ref.watch(gameClient).undo(ref.read(playerID), ref.read(code)),
    name: 'Undo',
    dependencies: [gameClient, playerID, code],
  );

  static final newRound = FutureProvider.autoDispose<bool>(
    (ref) => ref.watch(gameClient).newRound(ref.read(playerID), ref.read(code)),
    name: 'NewRound',
    dependencies: [gameClient, playerID, code],
  );

  static final chatMessage = StateProvider<String>(
    (ref) => '',
    name: 'Message',
  );

  static final sendMessage = FutureProvider.autoDispose<bool>(
    (ref) => ref.watch(gameClient).sendMessage(ref.read(playerID), ref.read(code), ref.read(chatMessage)),
    name: 'NewRound',
    dependencies: [gameClient, playerID, code, chatMessage],
  );

  static final sendEvent = FutureProvider.autoDispose.family<bool, GameEvent>(
    (ref, event) => ref.watch(gameClient).sendEvent(ref.read(playerID), ref.read(code), event),
    name: 'SendEvent',
    dependencies: [gameClient, playerID, code],
  );

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  static final lobby = StreamProvider.autoDispose<GameInfo>(
    (ref) async* {
      final c = ref.watch(gameClient);
      yield* c.gameLobby(ref.watch(playerID), ref.watch(code));
    },
    name: 'Lobby',
    dependencies: [gameClient, playerID, code],
  );

  /// Provides the game or error state for the current game of the client with specified id
  static final gameOrError = StreamProvider.autoDispose<GameOrError>(
    (ref) {
      final c = ref.watch(gameClient);
      return c.gameStream(ref.watch(playerID), ref.watch(code));
    },
    name: 'GameOrErrorStream',
    dependencies: [gameClient, playerID, code],
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
  static final error = StateProvider.autoDispose<String>(
    (ref) => '',
    name: 'GameError',
    dependencies: [playerID],
  );
}
