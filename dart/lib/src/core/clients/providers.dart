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
  (ref) => OnDeviceService,
  name: 'ClientType',
);

final allServiceTypes = StateProvider<List<ServiceType>>(
  (ref) => [OnDeviceService],
  name: 'AllServiceTypes',
);

/// Provides the [GameService] for each service id
final gameServiceFamily = Provider.family<GameService, ServiceType>(
  (ref, serviceType) {
    switch (serviceType) {
      case OnDeviceService:
        return ref.watch(onDeviceGameService);
      default:
        throw UnsupportedError('Unsupported service type');
    }
  },
  name: 'GameServiceFamily',
  dependencies: [onDeviceGameService, playerIDProvider],
);

final gameService = Provider<GameService>(
  (ref) => ref.watch(gameServiceFamily(ref.watch(serviceType))),
  name: 'GameService',
  dependencies: [serviceType, gameServiceFamily],
);

/// Provides a [RoundService] for the service with the specified id
final roundServiceFamily = Provider.family<RoundService, ServiceType>(
  (ref, serviceType) {
    switch (serviceType) {
      case OnDeviceService:
        return ref.watch(onDeviceRoundService);
      default:
        throw UnsupportedError('Unsupported service type');
    }
  },
  name: 'RoundServiceFamily',
  dependencies: [onDeviceRoundService, playerIDProvider],
);

final roundService = Provider<RoundService>(
  (ref) => ref.watch(roundServiceFamily(ref.watch(serviceType))),
  name: 'RoundService',
  dependencies: [serviceType, roundServiceFamily],
);

class GameProviders {
  GameProviders._();

  /// Provides the player's name
  static final playerName = Provider(
    (ref) => ref.watch(gameInfoProvider.select((c) => c.playerName ?? '')),
    dependencies: [gameInfoProvider],
  );

  /// Provides the game code for each client id
  static final code = Provider(
    (ref) => ref.watch(gameInfoProvider.select((c) => c.code ?? '')),
    dependencies: [gameInfoProvider],
  );

  /// Provides the game status for the current game of the client with specified id
  static final status = StateProvider<GameStatus?>(
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
  static final config = Provider(
    (ref) => ref.watch(gameInfoProvider
        .select((c) => c.config ?? const GameConfig(gameType: ''))),
    dependencies: [
      gameInfoProvider,
    ],
  );

  /// Provides the game type's name for the game specified by [config]
  static final gameType = Provider<String>(
    (ref) {
      final type = ref.watch(game).asData?.value;
      if (type == null) {
        return '';
      }
      return GameRegistry.typeName(type);
    },
    name: 'GameType',
    dependencies: [game, playerIDProvider],
  );

  static final exitGame = FutureProvider<bool>(
    (ref) => ref
        .read(roundService)
        .exitGame(ref.read(playerIDProvider), ref.read(code)),
    name: 'ExitGame',
    dependencies: [roundService, playerIDProvider, gameClientProvider],
  );

  static final undo = FutureProvider<bool>(
    (ref) =>
        ref.read(roundService).undo(ref.read(playerIDProvider), ref.read(code)),
    name: 'Undo',
    dependencies: [roundService, playerIDProvider, gameClientProvider],
  );

  static final newRound = FutureProvider<bool>(
    (ref) => ref
        .read(roundService)
        .newRound(ref.read(playerIDProvider), ref.read(code)),
    name: 'NewRound',
    dependencies: [roundService, playerIDProvider, gameClientProvider],
  );

  static final chatMessage = StateProvider<String>(
    (ref) => '',
    name: 'Message',
  );

  static final sendMessage = FutureProvider<bool>(
    (ref) => ref.read(roundService).sendMessage(
        ref.read(playerIDProvider), ref.read(code), ref.read(chatMessage)),
    name: 'NewRound',
    dependencies: [
      roundService,
      playerIDProvider,
      gameClientProvider,
      chatMessage
    ],
  );

  static final sendEvent = FutureProvider.family<bool, Event>(
    (ref, event) => ref
        .read(roundService)
        .sendEvent(ref.read(playerIDProvider), ref.read(code), event),
    name: 'SendEvent',
    dependencies: [roundService, playerIDProvider, gameClientProvider],
  );

  /// Provides game lobby info in the form of [GameInfo] for the lobby
  static final lobby = StreamProvider<GameInfo>(
    (ref) async* {
      final c = ref.read(roundService);
      final cde = ref.watch(code);
      if (cde.isEmpty) {
        return;
      }
      yield* c.gameLobby(ref.watch(playerIDProvider), cde);
    },
    name: 'Lobby',
    dependencies: [roundService, code, playerIDProvider],
  );

  /// Provides the game state for the current game of the client with specified id
  static final game = StreamProvider<GameState>(
    (ref) {
      final c = ref.read(roundService);
      return c.gameStream(ref.watch(playerIDProvider), ref.watch(code));
    },
    name: 'GameStateStream',
    dependencies: [playerIDProvider],
  );

  /// Provides the game error for the current game of the client with specified id
  static final error = StreamProvider<GameError>(
    (ref) {
      final c = ref.read(roundService);
      return c.errorStream(ref.watch(playerIDProvider), ref.watch(code));
    },
    name: 'GameError',
    dependencies: [playerIDProvider],
  );
}
