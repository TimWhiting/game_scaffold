// ignore_for_file: avoid_classes_with_only_static_members

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core.dart';
import 'clients.dart';

part 'providers.g.dart';

/// The default port
const defaultGamePort = 45912;

/// The default address to determine if the address has been set
final defaultAddress = Uri.parse('http://localhost:0');

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
@riverpod
class CurrentPlayerID extends Notifier {
  @override
  PlayerID build() => '';
  set currentPlayer(PlayerID id) {
    state = id;
  }

  PlayerID get currentPlayer => state;
}

/// Allows one config to write all players' configs
@riverpod
class SingleConfig extends _$SingleConfig {
  @override
  GameConfig build() => const GameConfig(gameType: '');
}

/// The provider that controls which game server address to connect to
@riverpod
class RemoteUri extends _$RemoteUri {
  @override
  Uri build() => defaultAddress;
}

/// The provider that controls the [RoundService] and [GameService]
/// implementation to use
@riverpod
class ServiceTypeNotifier extends _$ServiceTypeNotifier {
  @override
  ServiceType build() => OnDeviceService;
  set type(ServiceType t) {
    state = t;
  }

  ServiceType get type => state;
}

@riverpod
class AllServiceTypes extends _$AllServiceTypes {
  @override
  List<ServiceType> build() => [OnDeviceService];
}

/// Provides the [GameService] for each service id
@Riverpod(dependencies: [OnDeviceGameService, CurrentPlayerID])
GameService gameServiceFamily(
    GameServiceFamilyRef ref, ServiceType serviceType) {
  switch (serviceType) {
    case OnDeviceService:
      return ref.watch(onDeviceGameServiceProvider.notifier);
    default:
      throw UnsupportedError('Unsupported service type');
  }
}

// @Riverpod(dependencies: [ServiceTypeN, gameServiceFamily])
@Riverpod(dependencies: [ServiceTypeNotifier, gameServiceFamily])
GameService gameService(GameServiceRef ref) => ref
    .watch(gameServiceFamilyProvider(ref.watch(serviceTypeNotifierProvider)));

/// Provides a [RoundService] for the service with the specified id
@Riverpod(dependencies: [OnDeviceRoundService, CurrentPlayerID])
RoundService roundServiceFamily(
    RoundServiceFamilyRef ref, ServiceType serviceType) {
  switch (serviceType) {
    case OnDeviceService:
      return ref.watch(onDeviceRoundServiceProvider.notifier);
    default:
      throw UnsupportedError('Unsupported service type');
  }
}

@Riverpod(
  dependencies: [ServiceTypeNotifier, roundServiceFamily, CurrentPlayerID],
)
RoundService roundService(RoundServiceRef ref) => ref
    .watch(roundServiceFamilyProvider(ref.watch(serviceTypeNotifierProvider)));

/// Provides the player's name
@Riverpod(dependencies: [gameInfo])
PlayerName playerName(PlayerNameRef ref) =>
    ref.watch(gameInfoProvider.select((c) => c.playerName ?? ''));

/// Provides the game code for each client id
@Riverpod(dependencies: [gameInfo])
GameCode code(CodeRef ref) =>
    ref.watch(gameInfoProvider.select((c) => c.code ?? ''));

/// Provides the way to configure the game for starting
//  dependencies: [gameInfoProvider],
@Riverpod(dependencies: [gameInfo])
GameConfig config(ConfigRef ref) => ref.watch(
    gameInfoProvider.select((c) => c.config ?? const GameConfig(gameType: '')));
