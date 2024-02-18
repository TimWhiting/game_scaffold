// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Provides the [GameService] for each service id
typedef GameServiceFamilyRef = Ref<GameService>;

/// Provides the [GameService] for each service id
@ProviderFor(gameServiceFamily)
const gameServiceFamilyProvider = GameServiceFamilyFamily._();

/// Provides the [GameService] for each service id
final class GameServiceFamilyProvider
    extends $FunctionalProvider<GameService, GameService, GameServiceFamilyRef>
    with $Provider<GameService, GameServiceFamilyRef> {
  /// Provides the [GameService] for each service id
  const GameServiceFamilyProvider._(
      {required GameServiceFamilyFamily super.from,
      required ServiceType super.argument,
      GameService Function(
        GameServiceFamilyRef ref,
        ServiceType serviceType,
      )? create})
      : _createCb = create,
        super(
          name: r'gameServiceFamilyProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = onDeviceGameServiceProvider;
  static const $allTransitiveDependencies1 = currentPlayerIDProvider;

  final GameService Function(
    GameServiceFamilyRef ref,
    ServiceType serviceType,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$gameServiceFamilyHash();

  @override
  String toString() {
    return r'gameServiceFamilyProvider'
        ''
        '($argument)';
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameService>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<GameService> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  GameServiceFamilyProvider $copyWithCreate(
    GameService Function(
      GameServiceFamilyRef ref,
    ) create,
  ) {
    return GameServiceFamilyProvider._(
        argument: argument as ServiceType,
        from: from! as GameServiceFamilyFamily,
        create: (
          ref,
          ServiceType serviceType,
        ) =>
            create(ref));
  }

  @override
  GameService create(GameServiceFamilyRef ref) {
    final _$cb = _createCb ?? gameServiceFamily;
    final argument = this.argument as ServiceType;
    return _$cb(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GameServiceFamilyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameServiceFamilyHash() => r'138d8093499caf616694865ee5ec9a4e192b716b';

/// Provides the [GameService] for each service id
final class GameServiceFamilyFamily extends Family {
  const GameServiceFamilyFamily._()
      : super(
          name: r'gameServiceFamilyProvider',
          dependencies: const <ProviderOrFamily>[
            onDeviceGameServiceProvider,
            currentPlayerIDProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>[
            GameServiceFamilyProvider.$allTransitiveDependencies0,
            GameServiceFamilyProvider.$allTransitiveDependencies1,
          ],
          isAutoDispose: true,
        );

  /// Provides the [GameService] for each service id
  GameServiceFamilyProvider call(
    ServiceType serviceType,
  ) =>
      GameServiceFamilyProvider._(argument: serviceType, from: this);

  @override
  String debugGetCreateSourceHash() => _$gameServiceFamilyHash();

  @override
  String toString() => r'gameServiceFamilyProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    GameService Function(
      GameServiceFamilyRef ref,
      ServiceType args,
    ) create,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (container, provider) {
        provider as GameServiceFamilyProvider;

        final argument = provider.argument as ServiceType;

        return provider
            .$copyWithCreate((ref) => create(ref, argument))
            .$createElement(container);
      },
    );
  }
}

typedef GameServiceRef = Ref<GameService>;

@ProviderFor(gameService)
const gameServiceProvider = GameServiceProvider._();

final class GameServiceProvider
    extends $FunctionalProvider<GameService, GameService, GameServiceRef>
    with $Provider<GameService, GameServiceRef> {
  const GameServiceProvider._(
      {GameService Function(
        GameServiceRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'gameServiceProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            serviceTypeNotifierProvider,
            gameServiceFamilyProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>{
            GameServiceProvider.$allTransitiveDependencies0,
            GameServiceProvider.$allTransitiveDependencies1,
            GameServiceProvider.$allTransitiveDependencies2,
            GameServiceProvider.$allTransitiveDependencies3,
          },
        );

  static const $allTransitiveDependencies0 = serviceTypeNotifierProvider;
  static const $allTransitiveDependencies1 = gameServiceFamilyProvider;
  static const $allTransitiveDependencies2 =
      GameServiceFamilyProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies3 =
      GameServiceFamilyProvider.$allTransitiveDependencies1;

  final GameService Function(
    GameServiceRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$gameServiceHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameService>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<GameService> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  GameServiceProvider $copyWithCreate(
    GameService Function(
      GameServiceRef ref,
    ) create,
  ) {
    return GameServiceProvider._(create: create);
  }

  @override
  GameService create(GameServiceRef ref) {
    final _$cb = _createCb ?? gameService;
    return _$cb(ref);
  }
}

String _$gameServiceHash() => r'f2a9f90828ebe1f97dc62d8c013263745e42010a';

/// Provides a [RoundService] for the service with the specified id
typedef RoundServiceFamilyRef = Ref<RoundService>;

/// Provides a [RoundService] for the service with the specified id
@ProviderFor(roundServiceFamily)
const roundServiceFamilyProvider = RoundServiceFamilyFamily._();

/// Provides a [RoundService] for the service with the specified id
final class RoundServiceFamilyProvider extends $FunctionalProvider<
    RoundService,
    RoundService,
    RoundServiceFamilyRef> with $Provider<RoundService, RoundServiceFamilyRef> {
  /// Provides a [RoundService] for the service with the specified id
  const RoundServiceFamilyProvider._(
      {required RoundServiceFamilyFamily super.from,
      required ServiceType super.argument,
      RoundService Function(
        RoundServiceFamilyRef ref,
        ServiceType serviceType,
      )? create})
      : _createCb = create,
        super(
          name: r'roundServiceFamilyProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = onDeviceRoundServiceProvider;
  static const $allTransitiveDependencies1 =
      OnDeviceRoundServiceProvider.$allTransitiveDependencies0;

  final RoundService Function(
    RoundServiceFamilyRef ref,
    ServiceType serviceType,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$roundServiceFamilyHash();

  @override
  String toString() {
    return r'roundServiceFamilyProvider'
        ''
        '($argument)';
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoundService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<RoundService>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<RoundService> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  RoundServiceFamilyProvider $copyWithCreate(
    RoundService Function(
      RoundServiceFamilyRef ref,
    ) create,
  ) {
    return RoundServiceFamilyProvider._(
        argument: argument as ServiceType,
        from: from! as RoundServiceFamilyFamily,
        create: (
          ref,
          ServiceType serviceType,
        ) =>
            create(ref));
  }

  @override
  RoundService create(RoundServiceFamilyRef ref) {
    final _$cb = _createCb ?? roundServiceFamily;
    final argument = this.argument as ServiceType;
    return _$cb(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RoundServiceFamilyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$roundServiceFamilyHash() =>
    r'df631b9b79bd416e2613d3f1758c5ff0c6985c3c';

/// Provides a [RoundService] for the service with the specified id
final class RoundServiceFamilyFamily extends Family {
  const RoundServiceFamilyFamily._()
      : super(
          name: r'roundServiceFamilyProvider',
          dependencies: const <ProviderOrFamily>[
            onDeviceRoundServiceProvider,
            currentPlayerIDProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>[
            RoundServiceFamilyProvider.$allTransitiveDependencies0,
            RoundServiceFamilyProvider.$allTransitiveDependencies1,
          ],
          isAutoDispose: true,
        );

  /// Provides a [RoundService] for the service with the specified id
  RoundServiceFamilyProvider call(
    ServiceType serviceType,
  ) =>
      RoundServiceFamilyProvider._(argument: serviceType, from: this);

  @override
  String debugGetCreateSourceHash() => _$roundServiceFamilyHash();

  @override
  String toString() => r'roundServiceFamilyProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    RoundService Function(
      RoundServiceFamilyRef ref,
      ServiceType args,
    ) create,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (container, provider) {
        provider as RoundServiceFamilyProvider;

        final argument = provider.argument as ServiceType;

        return provider
            .$copyWithCreate((ref) => create(ref, argument))
            .$createElement(container);
      },
    );
  }
}

typedef RoundServiceRef = Ref<RoundService>;

@ProviderFor(roundService)
const roundServiceProvider = RoundServiceProvider._();

final class RoundServiceProvider
    extends $FunctionalProvider<RoundService, RoundService, RoundServiceRef>
    with $Provider<RoundService, RoundServiceRef> {
  const RoundServiceProvider._(
      {RoundService Function(
        RoundServiceRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'roundServiceProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            serviceTypeNotifierProvider,
            roundServiceFamilyProvider,
            currentPlayerIDProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>{
            RoundServiceProvider.$allTransitiveDependencies0,
            RoundServiceProvider.$allTransitiveDependencies1,
            RoundServiceProvider.$allTransitiveDependencies2,
            RoundServiceProvider.$allTransitiveDependencies3,
          },
        );

  static const $allTransitiveDependencies0 = serviceTypeNotifierProvider;
  static const $allTransitiveDependencies1 = roundServiceFamilyProvider;
  static const $allTransitiveDependencies2 =
      RoundServiceFamilyProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies3 =
      RoundServiceFamilyProvider.$allTransitiveDependencies1;

  final RoundService Function(
    RoundServiceRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$roundServiceHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoundService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<RoundService>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<RoundService> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  RoundServiceProvider $copyWithCreate(
    RoundService Function(
      RoundServiceRef ref,
    ) create,
  ) {
    return RoundServiceProvider._(create: create);
  }

  @override
  RoundService create(RoundServiceRef ref) {
    final _$cb = _createCb ?? roundService;
    return _$cb(ref);
  }
}

String _$roundServiceHash() => r'85e14cd0f0eeb7f5f1b16e73325c50c84b6c97d9';

/// Provides the player's name
typedef PlayerNameRef = Ref<PlayerName>;

/// Provides the player's name
@ProviderFor(playerName)
const playerNameProvider = PlayerNameProvider._();

/// Provides the player's name
final class PlayerNameProvider
    extends $FunctionalProvider<PlayerName, PlayerName, PlayerNameRef>
    with $Provider<PlayerName, PlayerNameRef> {
  /// Provides the player's name
  const PlayerNameProvider._(
      {PlayerName Function(
        PlayerNameRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'playerNameProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[gameInfoProvider],
          allTransitiveDependencies: const <ProviderOrFamily>{
            PlayerNameProvider.$allTransitiveDependencies0,
            PlayerNameProvider.$allTransitiveDependencies1,
            PlayerNameProvider.$allTransitiveDependencies2,
            PlayerNameProvider.$allTransitiveDependencies3,
            PlayerNameProvider.$allTransitiveDependencies4,
            PlayerNameProvider.$allTransitiveDependencies5,
            PlayerNameProvider.$allTransitiveDependencies6,
            PlayerNameProvider.$allTransitiveDependencies7,
          },
        );

  static const $allTransitiveDependencies0 = gameInfoProvider;
  static const $allTransitiveDependencies1 =
      GameInfoProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      GameInfoProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies3 =
      GameInfoProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies4 =
      GameInfoProvider.$allTransitiveDependencies3;
  static const $allTransitiveDependencies5 =
      GameInfoProvider.$allTransitiveDependencies4;
  static const $allTransitiveDependencies6 =
      GameInfoProvider.$allTransitiveDependencies5;
  static const $allTransitiveDependencies7 =
      GameInfoProvider.$allTransitiveDependencies6;

  final PlayerName Function(
    PlayerNameRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$playerNameHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerName value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<PlayerName>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<PlayerName> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  PlayerNameProvider $copyWithCreate(
    PlayerName Function(
      PlayerNameRef ref,
    ) create,
  ) {
    return PlayerNameProvider._(create: create);
  }

  @override
  PlayerName create(PlayerNameRef ref) {
    final _$cb = _createCb ?? playerName;
    return _$cb(ref);
  }
}

String _$playerNameHash() => r'ba787d3b4995638c410c07837913bfafe1d3af13';

/// Provides the game code for each client id
typedef CodeRef = Ref<GameCode>;

/// Provides the game code for each client id
@ProviderFor(code)
const codeProvider = CodeProvider._();

/// Provides the game code for each client id
final class CodeProvider
    extends $FunctionalProvider<GameCode, GameCode, CodeRef>
    with $Provider<GameCode, CodeRef> {
  /// Provides the game code for each client id
  const CodeProvider._(
      {GameCode Function(
        CodeRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'codeProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[gameInfoProvider],
          allTransitiveDependencies: const <ProviderOrFamily>{
            CodeProvider.$allTransitiveDependencies0,
            CodeProvider.$allTransitiveDependencies1,
            CodeProvider.$allTransitiveDependencies2,
            CodeProvider.$allTransitiveDependencies3,
            CodeProvider.$allTransitiveDependencies4,
            CodeProvider.$allTransitiveDependencies5,
            CodeProvider.$allTransitiveDependencies6,
            CodeProvider.$allTransitiveDependencies7,
          },
        );

  static const $allTransitiveDependencies0 = gameInfoProvider;
  static const $allTransitiveDependencies1 =
      GameInfoProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      GameInfoProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies3 =
      GameInfoProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies4 =
      GameInfoProvider.$allTransitiveDependencies3;
  static const $allTransitiveDependencies5 =
      GameInfoProvider.$allTransitiveDependencies4;
  static const $allTransitiveDependencies6 =
      GameInfoProvider.$allTransitiveDependencies5;
  static const $allTransitiveDependencies7 =
      GameInfoProvider.$allTransitiveDependencies6;

  final GameCode Function(
    CodeRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$codeHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameCode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameCode>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<GameCode> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  CodeProvider $copyWithCreate(
    GameCode Function(
      CodeRef ref,
    ) create,
  ) {
    return CodeProvider._(create: create);
  }

  @override
  GameCode create(CodeRef ref) {
    final _$cb = _createCb ?? code;
    return _$cb(ref);
  }
}

String _$codeHash() => r'7271943142674f8a8fb982bae077c0e14d2ac7a7';

/// Provides the way to configure the game for starting
//  dependencies: [gameInfoProvider],
typedef ConfigRef = Ref<GameConfig>;

/// Provides the way to configure the game for starting
//  dependencies: [gameInfoProvider],
@ProviderFor(config)
const configProvider = ConfigProvider._();

/// Provides the way to configure the game for starting
//  dependencies: [gameInfoProvider],
final class ConfigProvider
    extends $FunctionalProvider<GameConfig, GameConfig, ConfigRef>
    with $Provider<GameConfig, ConfigRef> {
  /// Provides the way to configure the game for starting
//  dependencies: [gameInfoProvider],
  const ConfigProvider._(
      {GameConfig Function(
        ConfigRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'configProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[gameInfoProvider],
          allTransitiveDependencies: const <ProviderOrFamily>{
            ConfigProvider.$allTransitiveDependencies0,
            ConfigProvider.$allTransitiveDependencies1,
            ConfigProvider.$allTransitiveDependencies2,
            ConfigProvider.$allTransitiveDependencies3,
            ConfigProvider.$allTransitiveDependencies4,
            ConfigProvider.$allTransitiveDependencies5,
            ConfigProvider.$allTransitiveDependencies6,
            ConfigProvider.$allTransitiveDependencies7,
          },
        );

  static const $allTransitiveDependencies0 = gameInfoProvider;
  static const $allTransitiveDependencies1 =
      GameInfoProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      GameInfoProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies3 =
      GameInfoProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies4 =
      GameInfoProvider.$allTransitiveDependencies3;
  static const $allTransitiveDependencies5 =
      GameInfoProvider.$allTransitiveDependencies4;
  static const $allTransitiveDependencies6 =
      GameInfoProvider.$allTransitiveDependencies5;
  static const $allTransitiveDependencies7 =
      GameInfoProvider.$allTransitiveDependencies6;

  final GameConfig Function(
    ConfigRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$configHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameConfig>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<GameConfig> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  ConfigProvider $copyWithCreate(
    GameConfig Function(
      ConfigRef ref,
    ) create,
  ) {
    return ConfigProvider._(create: create);
  }

  @override
  GameConfig create(ConfigRef ref) {
    final _$cb = _createCb ?? config;
    return _$cb(ref);
  }
}

String _$configHash() => r'f39a9896a974b0076dddb457df6d8c34fb4092bd';

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
@ProviderFor(CurrentPlayerID)
const currentPlayerIDProvider = CurrentPlayerIDProvider._();

/// Provides the player id for a particular section of the widget tree
///
/// This is so that a multiplayer game within the same app can be played
final class CurrentPlayerIDProvider
    extends $NotifierProvider<CurrentPlayerID, PlayerID> {
  /// Provides the player id for a particular section of the widget tree
  ///
  /// This is so that a multiplayer game within the same app can be played
  const CurrentPlayerIDProvider._(
      {super.runNotifierBuildOverride, CurrentPlayerID Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'currentPlayerIDProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final CurrentPlayerID Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$currentPlayerIDHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerID value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<PlayerID>(value),
    );
  }

  @$internal
  @override
  CurrentPlayerID create() => _createCb?.call() ?? CurrentPlayerID();

  @$internal
  @override
  CurrentPlayerIDProvider $copyWithCreate(
    CurrentPlayerID Function() create,
  ) {
    return CurrentPlayerIDProvider._(create: create);
  }

  @$internal
  @override
  CurrentPlayerIDProvider $copyWithBuild(
    PlayerID Function(
      Ref<PlayerID>,
      CurrentPlayerID,
    ) build,
  ) {
    return CurrentPlayerIDProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<CurrentPlayerID, PlayerID> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$currentPlayerIDHash() => r'0c0efd20aaf1e07426deb5a4a8f7ff25b86dddc0';

abstract class _$CurrentPlayerID extends $Notifier<PlayerID> {
  PlayerID build();
  @$internal
  @override
  PlayerID runBuild() => build();
}

/// Allows one config to write all players' configs
@ProviderFor(SingleConfig)
const singleConfigProvider = SingleConfigProvider._();

/// Allows one config to write all players' configs
final class SingleConfigProvider
    extends $NotifierProvider<SingleConfig, GameConfig> {
  /// Allows one config to write all players' configs
  const SingleConfigProvider._(
      {super.runNotifierBuildOverride, SingleConfig Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'singleConfigProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final SingleConfig Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$singleConfigHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameConfig>(value),
    );
  }

  @$internal
  @override
  SingleConfig create() => _createCb?.call() ?? SingleConfig();

  @$internal
  @override
  SingleConfigProvider $copyWithCreate(
    SingleConfig Function() create,
  ) {
    return SingleConfigProvider._(create: create);
  }

  @$internal
  @override
  SingleConfigProvider $copyWithBuild(
    GameConfig Function(
      Ref<GameConfig>,
      SingleConfig,
    ) build,
  ) {
    return SingleConfigProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<SingleConfig, GameConfig> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$singleConfigHash() => r'fffebbee33fbe905bb94346006f0b985b60938f3';

abstract class _$SingleConfig extends $Notifier<GameConfig> {
  GameConfig build();
  @$internal
  @override
  GameConfig runBuild() => build();
}

/// The provider that controls which game server address to connect to
@ProviderFor(RemoteUri)
const remoteUriProvider = RemoteUriProvider._();

/// The provider that controls which game server address to connect to
final class RemoteUriProvider extends $NotifierProvider<RemoteUri, Uri> {
  /// The provider that controls which game server address to connect to
  const RemoteUriProvider._(
      {super.runNotifierBuildOverride, RemoteUri Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'remoteUriProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final RemoteUri Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$remoteUriHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Uri value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Uri>(value),
    );
  }

  @$internal
  @override
  RemoteUri create() => _createCb?.call() ?? RemoteUri();

  @$internal
  @override
  RemoteUriProvider $copyWithCreate(
    RemoteUri Function() create,
  ) {
    return RemoteUriProvider._(create: create);
  }

  @$internal
  @override
  RemoteUriProvider $copyWithBuild(
    Uri Function(
      Ref<Uri>,
      RemoteUri,
    ) build,
  ) {
    return RemoteUriProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<RemoteUri, Uri> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$remoteUriHash() => r'951e5d8f0aaefcc3517e18fbf6f765b7edd41cef';

abstract class _$RemoteUri extends $Notifier<Uri> {
  Uri build();
  @$internal
  @override
  Uri runBuild() => build();
}

/// The provider that controls the [RoundService] and [GameService]
/// implementation to use
@ProviderFor(ServiceTypeNotifier)
const serviceTypeNotifierProvider = ServiceTypeNotifierProvider._();

/// The provider that controls the [RoundService] and [GameService]
/// implementation to use
final class ServiceTypeNotifierProvider
    extends $NotifierProvider<ServiceTypeNotifier, ServiceType> {
  /// The provider that controls the [RoundService] and [GameService]
  /// implementation to use
  const ServiceTypeNotifierProvider._(
      {super.runNotifierBuildOverride, ServiceTypeNotifier Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'serviceTypeNotifierProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final ServiceTypeNotifier Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$serviceTypeNotifierHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServiceType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<ServiceType>(value),
    );
  }

  @$internal
  @override
  ServiceTypeNotifier create() => _createCb?.call() ?? ServiceTypeNotifier();

  @$internal
  @override
  ServiceTypeNotifierProvider $copyWithCreate(
    ServiceTypeNotifier Function() create,
  ) {
    return ServiceTypeNotifierProvider._(create: create);
  }

  @$internal
  @override
  ServiceTypeNotifierProvider $copyWithBuild(
    ServiceType Function(
      Ref<ServiceType>,
      ServiceTypeNotifier,
    ) build,
  ) {
    return ServiceTypeNotifierProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<ServiceTypeNotifier, ServiceType> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$serviceTypeNotifierHash() =>
    r'619c868c0e433c23476f107ea0f83d0d35073185';

abstract class _$ServiceTypeNotifier extends $Notifier<ServiceType> {
  ServiceType build();
  @$internal
  @override
  ServiceType runBuild() => build();
}

@ProviderFor(AllServiceTypes)
const allServiceTypesProvider = AllServiceTypesProvider._();

final class AllServiceTypesProvider
    extends $NotifierProvider<AllServiceTypes, List<ServiceType>> {
  const AllServiceTypesProvider._(
      {super.runNotifierBuildOverride, AllServiceTypes Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'allServiceTypesProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final AllServiceTypes Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$allServiceTypesHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ServiceType> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<List<ServiceType>>(value),
    );
  }

  @$internal
  @override
  AllServiceTypes create() => _createCb?.call() ?? AllServiceTypes();

  @$internal
  @override
  AllServiceTypesProvider $copyWithCreate(
    AllServiceTypes Function() create,
  ) {
    return AllServiceTypesProvider._(create: create);
  }

  @$internal
  @override
  AllServiceTypesProvider $copyWithBuild(
    List<ServiceType> Function(
      Ref<List<ServiceType>>,
      AllServiceTypes,
    ) build,
  ) {
    return AllServiceTypesProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<AllServiceTypes, List<ServiceType>> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$allServiceTypesHash() => r'4e7a7b21630bac79b119444d2047e492dfe96854';

abstract class _$AllServiceTypes extends $Notifier<List<ServiceType>> {
  List<ServiceType> build();
  @$internal
  @override
  List<ServiceType> runBuild() => build();
}

const $kDebugMode = bool.fromEnvironment('dart.vm.product');
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use_from_same_package, unreachable_from_main
