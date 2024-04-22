// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef BackendPlayerLobbyRef = Ref<GameInfo?>;

@ProviderFor(backendPlayerLobby)
const backendPlayerLobbyProvider = BackendPlayerLobbyFamily._();

final class BackendPlayerLobbyProvider
    extends $FunctionalProvider<GameInfo?, GameInfo?>
    with $Provider<GameInfo?, BackendPlayerLobbyRef> {
  const BackendPlayerLobbyProvider._(
      {required BackendPlayerLobbyFamily super.from,
      required PlayerID super.argument,
      GameInfo? Function(
        BackendPlayerLobbyRef ref,
        PlayerID player,
      )? create})
      : _createCb = create,
        super(
          name: r'backendPlayerLobbyProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = backendLobbyProvider;

  final GameInfo? Function(
    BackendPlayerLobbyRef ref,
    PlayerID player,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$backendPlayerLobbyHash();

  @override
  String toString() {
    return r'backendPlayerLobbyProvider'
        ''
        '($argument)';
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameInfo? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameInfo?>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<GameInfo?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(this, pointer);

  @override
  BackendPlayerLobbyProvider $copyWithCreate(
    GameInfo? Function(
      BackendPlayerLobbyRef ref,
    ) create,
  ) {
    return BackendPlayerLobbyProvider._(
        argument: argument as PlayerID,
        from: from! as BackendPlayerLobbyFamily,
        create: (
          ref,
          PlayerID player,
        ) =>
            create(ref));
  }

  @override
  GameInfo? create(BackendPlayerLobbyRef ref) {
    final _$cb = _createCb ?? backendPlayerLobby;
    final argument = this.argument as PlayerID;
    return _$cb(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BackendPlayerLobbyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$backendPlayerLobbyHash() =>
    r'c39c7d82b271692b46d56eb55d9ed093d4c75f2f';

final class BackendPlayerLobbyFamily extends Family {
  const BackendPlayerLobbyFamily._()
      : super(
          name: r'backendPlayerLobbyProvider',
          dependencies: const <ProviderOrFamily>[backendLobbyProvider],
          allTransitiveDependencies: const <ProviderOrFamily>[
            BackendPlayerLobbyProvider.$allTransitiveDependencies0,
          ],
          isAutoDispose: true,
        );

  BackendPlayerLobbyProvider call(
    PlayerID player,
  ) =>
      BackendPlayerLobbyProvider._(argument: player, from: this);

  @override
  String debugGetCreateSourceHash() => _$backendPlayerLobbyHash();

  @override
  String toString() => r'backendPlayerLobbyProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    GameInfo? Function(
      BackendPlayerLobbyRef ref,
      PlayerID args,
    ) create,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (pointer) {
        final provider = pointer.origin as BackendPlayerLobbyProvider;

        final argument = provider.argument as PlayerID;

        return provider
            .$copyWithCreate((ref) => create(ref, argument))
            .$createElement(pointer);
      },
    );
  }
}

/// Provides the [GameError] to keep track of errors of a game
@ProviderFor(BackendError)
const backendErrorProvider = BackendErrorProvider._();

/// Provides the [GameError] to keep track of errors of a game
final class BackendErrorProvider
    extends $NotifierProvider<BackendError, GameError?> {
  /// Provides the [GameError] to keep track of errors of a game
  const BackendErrorProvider._(
      {super.runNotifierBuildOverride, BackendError Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'backendErrorProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[backendGameEngineProvider],
          allTransitiveDependencies: const <ProviderOrFamily>[
            BackendErrorProvider.$allTransitiveDependencies0,
            BackendErrorProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = backendGameEngineProvider;
  static const $allTransitiveDependencies1 =
      BackendGameEngineProvider.$allTransitiveDependencies0;

  final BackendError Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$backendErrorHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameError? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameError?>(value),
    );
  }

  @$internal
  @override
  BackendError create() => _createCb?.call() ?? BackendError();

  @$internal
  @override
  BackendErrorProvider $copyWithCreate(
    BackendError Function() create,
  ) {
    return BackendErrorProvider._(create: create);
  }

  @$internal
  @override
  BackendErrorProvider $copyWithBuild(
    GameError? Function(
      Ref<GameError?>,
      BackendError,
    ) build,
  ) {
    return BackendErrorProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<BackendError, GameError?> $createElement(
          $ProviderPointer pointer) =>
      $NotifierProviderElement(this, pointer);
}

String _$backendErrorHash() => r'a800a446db9dee9322478a395d0973498cd2aaaa';

abstract class _$BackendError extends $Notifier<GameError?> {
  GameError? build();
  @$internal
  @override
  GameError? runBuild() => build();
}

/// Provides the [GameState] to keep track of the state of a game
@ProviderFor(BackendGameState)
const backendGameStateProvider = BackendGameStateProvider._();

/// Provides the [GameState] to keep track of the state of a game
final class BackendGameStateProvider
    extends $NotifierProvider<BackendGameState, GameState> {
  /// Provides the [GameState] to keep track of the state of a game
  const BackendGameStateProvider._(
      {super.runNotifierBuildOverride, BackendGameState Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'backendGameStateProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[backendGameEngineProvider],
          allTransitiveDependencies: const <ProviderOrFamily>[
            BackendGameStateProvider.$allTransitiveDependencies0,
            BackendGameStateProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = backendGameEngineProvider;
  static const $allTransitiveDependencies1 =
      BackendGameEngineProvider.$allTransitiveDependencies0;

  final BackendGameState Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$backendGameStateHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameState>(value),
    );
  }

  @$internal
  @override
  BackendGameState create() => _createCb?.call() ?? BackendGameState();

  @$internal
  @override
  BackendGameStateProvider $copyWithCreate(
    BackendGameState Function() create,
  ) {
    return BackendGameStateProvider._(create: create);
  }

  @$internal
  @override
  BackendGameStateProvider $copyWithBuild(
    GameState Function(
      Ref<GameState>,
      BackendGameState,
    ) build,
  ) {
    return BackendGameStateProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<BackendGameState, GameState> $createElement(
          $ProviderPointer pointer) =>
      $NotifierProviderElement(this, pointer);
}

String _$backendGameStateHash() => r'7916ae5e69f8ad6cc8d8b309ee77429d52a045a7';

abstract class _$BackendGameState extends $Notifier<GameState> {
  GameState build();
  @$internal
  @override
  GameState runBuild() => build();
}

@ProviderFor(BackendLobby)
const backendLobbyProvider = BackendLobbyProvider._();

final class BackendLobbyProvider
    extends $NotifierProvider<BackendLobby, Lobby> {
  const BackendLobbyProvider._(
      {super.runNotifierBuildOverride, BackendLobby Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'backendLobbyProvider',
          isAutoDispose: false,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final BackendLobby Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$backendLobbyHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Lobby value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Lobby>(value),
    );
  }

  @$internal
  @override
  BackendLobby create() => _createCb?.call() ?? BackendLobby();

  @$internal
  @override
  BackendLobbyProvider $copyWithCreate(
    BackendLobby Function() create,
  ) {
    return BackendLobbyProvider._(create: create);
  }

  @$internal
  @override
  BackendLobbyProvider $copyWithBuild(
    Lobby Function(
      Ref<Lobby>,
      BackendLobby,
    ) build,
  ) {
    return BackendLobbyProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<BackendLobby, Lobby> $createElement(
          $ProviderPointer pointer) =>
      $NotifierProviderElement(this, pointer);
}

String _$backendLobbyHash() => r'0b5edaa544b662f2f788167a74d678eb596668b6';

abstract class _$BackendLobby extends $Notifier<Lobby> {
  Lobby build();
  @$internal
  @override
  Lobby runBuild() => build();
}

/// Provides the [BackendGameEngine] based on the [GameConfig] from [Lobby]'s config
/// A [Notifier] that handles events for a particular game, delegating to the game's implementation for non generic events
@ProviderFor(BackendGameEngine)
const backendGameEngineProvider = BackendGameEngineProvider._();

/// Provides the [BackendGameEngine] based on the [GameConfig] from [Lobby]'s config
/// A [Notifier] that handles events for a particular game, delegating to the game's implementation for non generic events
final class BackendGameEngineProvider
    extends $NotifierProvider<BackendGameEngine, NextStateOrError> {
  /// Provides the [BackendGameEngine] based on the [GameConfig] from [Lobby]'s config
  /// A [Notifier] that handles events for a particular game, delegating to the game's implementation for non generic events
  const BackendGameEngineProvider._(
      {super.runNotifierBuildOverride, BackendGameEngine Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'backendGameEngineProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[backendLobbyProvider],
          allTransitiveDependencies: const <ProviderOrFamily>[
            BackendGameEngineProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = backendLobbyProvider;

  final BackendGameEngine Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$backendGameEngineHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NextStateOrError value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<NextStateOrError>(value),
    );
  }

  @$internal
  @override
  BackendGameEngine create() => _createCb?.call() ?? BackendGameEngine();

  @$internal
  @override
  BackendGameEngineProvider $copyWithCreate(
    BackendGameEngine Function() create,
  ) {
    return BackendGameEngineProvider._(create: create);
  }

  @$internal
  @override
  BackendGameEngineProvider $copyWithBuild(
    NextStateOrError Function(
      Ref<NextStateOrError>,
      BackendGameEngine,
    ) build,
  ) {
    return BackendGameEngineProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<BackendGameEngine, NextStateOrError> $createElement(
          $ProviderPointer pointer) =>
      $NotifierProviderElement(this, pointer);
}

String _$backendGameEngineHash() => r'd0309c011901c7fbb3553eb8136a7d21d2b2298f';

abstract class _$BackendGameEngine extends $Notifier<NextStateOrError> {
  NextStateOrError build();
  @$internal
  @override
  NextStateOrError runBuild() => build();
}

// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use_from_same_package, unreachable_from_main, invalid_use_of_internal_member
