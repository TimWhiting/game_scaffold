// ignore_for_file: avoid_classes_with_only_static_members

import 'package:riverpod/riverpod.dart';
import '../core.dart';
import 'clients.dart';

/// The default port
const defaultGamePort = 45912;

/// The default address to determine if the address has been set
final defaultAddress = Uri.parse('http://localhost:0');

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
final playerIDProvider = Provider<PlayerID>(
  (ref) => '',
  name: 'PlayerID',
);

/// Allows one config to write all players' configs
final singleConfig = StateProvider<GameConfig>(
  (ref) => const GameConfig(gameType: ''),
  name: 'SingleGameConfig',
);

/// The provider that controls which game server address to connect to
final remoteUriProvider = StateProvider<GameAddress>((ref) => defaultAddress);

/// The provider that controls the [RoundService] and [GameService]
/// implementation to use
final serviceType = StateProvider<ServiceType>(
  (ref) => IOService,
  name: 'ClientType',
);

final allServiceTypes = StateProvider<List<ServiceType>>(
  (ref) => [IOService, OnDeviceService],
  name: 'AllServiceTypes',
);

/// Provides the [GameService] for each service id
final gameServiceFamily = Provider.autoDispose.family<GameService, ServiceType>(
  (ref, serviceType) {
    switch (serviceType) {
      case IOService:
        return ref.watch(socketIOGameService);
      case OnDeviceService:
        return ref.watch(onDeviceGameService);
      default:
        throw UnsupportedError('Unsupported service type');
    }
  },
  name: 'GameClientFamily',
  dependencies: [socketIOGameService, onDeviceGameService, playerIDProvider],
);

final gameService = Provider.autoDispose<GameService>(
  (ref) => ref.watch(gameServiceFamily(ref.watch(serviceType))),
  name: 'GameClient',
  dependencies: [serviceType, gameServiceFamily],
);

/// Provides a [RoundService] for the service with the specified id
final roundServiceFamily =
    Provider.family.autoDispose<RoundService, ServiceType>(
  (ref, serviceType) {
    switch (serviceType) {
      case IOService:
        return ref.watch(socketIORoundService);
      case OnDeviceService:
        return ref.watch(onDeviceRoundService);
      default:
        throw UnsupportedError('Unsupported service type');
    }
  },
  name: 'GameClientFamily',
  dependencies: [socketIORoundService, onDeviceRoundService, playerIDProvider],
);

final roundClient = Provider.autoDispose<RoundService>(
  (ref) => ref.watch(roundServiceFamily(ref.watch(serviceType))),
  name: 'GameClient',
  dependencies: [serviceType, roundServiceFamily],
);

class GameProviders {
  GameProviders._();

  /// Provides the player's name
  static final playerName = Provider.autoDispose(
    (ref) => ref.watch(gameClientProvider(ref.watch(playerIDProvider))
        .select((c) => c.playerName ?? '')),
    dependencies: [playerIDProvider, gameClientProvider],
  );

  /// Provides the game code for each client id
  static final code = Provider.autoDispose(
    (ref) => ref.watch(gameClientProvider(ref.watch(playerIDProvider))
        .select((c) => c.code ?? '')),
    dependencies: [playerIDProvider, gameClientProvider],
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
    dependencies: [playerIDProvider, lobby, game],
  );

  /// Provides whether it is the players turn for the current game of the client with the specified id
  // static final turn = Provider.autoDispose<bool>((ref) {
  //   final pID = ref.watch(playerIDProvider);
  //   final _ = ref.watch(code); // Invalidate on change of gameCode
  //   final currentPlayer = ref.watch(game).asData?.value.currentPlayer?.id;
  //   // Null indicates that all players can go simultaneously
  //   return currentPlayer == null || currentPlayer == pID;
  // }, name: 'GameTurn', dependencies: [playerIDProvider, code, game]);

  /// Provides the way to configure the game for starting
  static final config = Provider.autoDispose(
    (ref) => ref.watch(gameClientProvider(ref.watch(playerIDProvider))
        .select((c) => c.config ?? const GameConfig(gameType: ''))),
    dependencies: [
      playerIDProvider,
      gameClientProvider,
    ],
  );

  /// Provides the game type's name for the game specified by [config]
  static final gameType = Provider.autoDispose<String>(
    (ref) {
      final type = ref.watch(game).asData?.value;
      if (type == null) {
        return '';
      }
      return Game.typeName<Object>(type);
    },
    name: 'GameType',
    dependencies: [game, playerIDProvider],
  );

  static final exitGame = FutureProvider.autoDispose<bool>(
    (ref) => ref
        .read(roundClient)
        .exitGame(ref.read(playerIDProvider), ref.read(code)),
    name: 'ExitGame',
    dependencies: [roundClient, playerIDProvider, gameClientProvider],
  );

  static final undo = FutureProvider.autoDispose<bool>(
    (ref) =>
        ref.read(roundClient).undo(ref.read(playerIDProvider), ref.read(code)),
    name: 'Undo',
    dependencies: [roundClient, playerIDProvider, gameClientProvider],
  );

  static final newRound = FutureProvider.autoDispose<bool>(
    (ref) => ref
        .read(roundClient)
        .newRound(ref.read(playerIDProvider), ref.read(code)),
    name: 'NewRound',
    dependencies: [roundClient, playerIDProvider, gameClientProvider],
  );

  static final chatMessage = StateProvider<String>(
    (ref) => '',
    name: 'Message',
  );

  static final sendMessage = FutureProvider.autoDispose<bool>(
    (ref) => ref.read(roundClient).sendMessage(
        ref.read(playerIDProvider), ref.read(code), ref.read(chatMessage)),
    name: 'NewRound',
    dependencies: [
      roundClient,
      playerIDProvider,
      gameClientProvider,
      chatMessage
    ],
  );

  static final sendEvent = FutureProvider.autoDispose.family<bool, Object>(
    (ref, event) => ref
        .read(roundClient)
        .sendEvent(ref.read(playerIDProvider), ref.read(code), event),
    name: 'SendEvent',
    dependencies: [roundClient, playerIDProvider, gameClientProvider],
  );

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  static final lobby = StreamProvider.autoDispose<GameInfo>(
    (ref) async* {
      final c = ref.read(gameService);
      final cde = ref.watch(code);
      if (cde.isEmpty) {
        return;
      }
      yield* c.gameLobby(ref.watch(playerIDProvider), cde);
    },
    name: 'Lobby',
    dependencies: [gameService, code, playerIDProvider],
  );

  /// Provides the game state for the current game of the client with specified id
  static final game = StreamProvider.autoDispose<GameState<Object>>(
    (ref) {
      final c = ref.read(roundClient);
      return c.gameStream(ref.watch(playerIDProvider), ref.watch(code));
    },
    name: 'GameStateStream',
    dependencies: [playerIDProvider],
  );

  /// Provides the game error for the current game of the client with specified id
  static final error = StreamProvider.autoDispose<GameError>(
    (ref) {
      final c = ref.read(roundClient);
      return c.errorStream(ref.watch(playerIDProvider), ref.watch(code));
    },
    name: 'GameError',
    dependencies: [playerIDProvider],
  );
}
