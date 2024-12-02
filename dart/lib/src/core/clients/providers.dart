// ignore_for_file: avoid_classes_with_only_static_members

import 'package:riverpod/legacy.dart';
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
  dependencies: const [],
);

/// Allows one config to write all players' configs
final singleConfig = StateProvider<GameConfig>(
  (ref) => const GameConfig(gameType: ''),
  name: 'SingleGameConfig',
  dependencies: const [],
);

/// The provider that controls which game server address to connect to
final remoteUriProvider = StateProvider<GameAddress>((ref) => defaultAddress, 
  dependencies: const [],);

/// The provider that controls the [RoundService] and [GameService]
/// implementation to use
final serviceType = StateProvider<ServiceType>(
  (ref) => OnDeviceService,
  name: 'ClientType',
  dependencies: const [],
);

final allServiceTypes = StateProvider<List<ServiceType>>(
  (ref) => [OnDeviceService],
  name: 'AllServiceTypes',
  dependencies: const [],
);

/// Provides the [GameService] for each service id
final gameServiceFamily = Provider.autoDispose.family<GameService, ServiceType>(
  (ref, serviceType) => switch (serviceType) {
    OnDeviceService => ref.watch(onDeviceGameService),
    _ => throw UnsupportedError('Unsupported service type')
  },
  name: 'GameServiceFamily',
  dependencies: [onDeviceGameService, playerIDProvider],
);

final gameService = Provider.autoDispose<GameService>(
  (ref) => ref.watch(gameServiceFamily(ref.watch(serviceType))),
  name: 'GameService',
  dependencies: [serviceType, gameServiceFamily],
);

/// Provides a [RoundService] for the service with the specified id
final roundServiceFamily = Provider.autoDispose.family<RoundService, ServiceType>(
  (ref, serviceType) => switch (serviceType) {
    OnDeviceService => ref.watch(onDeviceRoundService),
    _ => throw UnsupportedError('Unsupported service type')
  },
  name: 'RoundServiceFamily',
  dependencies: [onDeviceRoundService, playerIDProvider],
);

final roundService = Provider.autoDispose<RoundService>(
  (ref) => ref.watch(roundServiceFamily(ref.watch(serviceType))),
  name: 'RoundService',
  dependencies: [serviceType, roundServiceFamily, playerIDProvider],
);

class GameProviders {
  GameProviders._();

  /// Provides the player's name
  static final playerName = Provider.autoDispose(
    (ref) => ref.watch(gameInfoProvider.select((c) => c.playerName ?? '')),
    dependencies: [gameInfoProvider],
  );

  /// Provides the game code for each client id
  static final code = Provider.autoDispose(
    (ref) => ref.watch(gameInfoProvider.select((c) => c.code ?? '')),
    dependencies: [gameInfoProvider],
  );

  /// Provides the way to configure the game for starting
  static final config = Provider.autoDispose(
    (ref) => ref.watch(gameInfoProvider
        .select((c) => c.config ?? const GameConfig(gameType: ''))),
    dependencies: [gameInfoProvider],
  );
}
