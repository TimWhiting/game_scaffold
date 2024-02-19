// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef PlayerLobbyRef = Ref<GameInfo?>;

@ProviderFor(playerLobby)
const playerLobbyProvider = PlayerLobbyFamily._();

final class PlayerLobbyProvider
    extends $FunctionalProvider<GameInfo?, GameInfo?, PlayerLobbyRef>
    with $Provider<GameInfo?, PlayerLobbyRef> {
  const PlayerLobbyProvider._(
      {required PlayerLobbyFamily super.from,
      required PlayerID super.argument,
      GameInfo? Function(
        PlayerLobbyRef ref,
        PlayerID player,
      )? create})
      : _createCb = create,
        super(
          name: r'playerLobbyProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = lobbyNotifierProvider;

  final GameInfo? Function(
    PlayerLobbyRef ref,
    PlayerID player,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$playerLobbyHash();

  @override
  String toString() {
    return r'playerLobbyProvider'
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
  $ProviderElement<GameInfo?> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  PlayerLobbyProvider $copyWithCreate(
    GameInfo? Function(
      PlayerLobbyRef ref,
    ) create,
  ) {
    return PlayerLobbyProvider._(
        argument: argument as PlayerID,
        from: from! as PlayerLobbyFamily,
        create: (
          ref,
          PlayerID player,
        ) =>
            create(ref));
  }

  @override
  GameInfo? create(PlayerLobbyRef ref) {
    final _$cb = _createCb ?? playerLobby;
    final argument = this.argument as PlayerID;
    return _$cb(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerLobbyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playerLobbyHash() => r'8db59beeec66fdc3bb5e5060573df2b5cd89c8da';

final class PlayerLobbyFamily extends Family {
  const PlayerLobbyFamily._()
      : super(
          name: r'playerLobbyProvider',
          dependencies: const <ProviderOrFamily>[lobbyNotifierProvider],
          allTransitiveDependencies: const <ProviderOrFamily>[
            PlayerLobbyProvider.$allTransitiveDependencies0,
          ],
          isAutoDispose: true,
        );

  PlayerLobbyProvider call(
    PlayerID player,
  ) =>
      PlayerLobbyProvider._(argument: player, from: this);

  @override
  String debugGetCreateSourceHash() => _$playerLobbyHash();

  @override
  String toString() => r'playerLobbyProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    GameInfo? Function(
      PlayerLobbyRef ref,
      PlayerID args,
    ) create,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (container, provider) {
        provider as PlayerLobbyProvider;

        final argument = provider.argument as PlayerID;

        return provider
            .$copyWithCreate((ref) => create(ref, argument))
            .$createElement(container);
      },
    );
  }
}

/// Provides the [GameErrorNotifier] to keep track of errors of a game
@ProviderFor(ErrorNotifier)
const errorNotifierProvider = ErrorNotifierProvider._();

/// Provides the [GameErrorNotifier] to keep track of errors of a game
final class ErrorNotifierProvider
    extends $NotifierProvider<ErrorNotifier, GameError?> {
  /// Provides the [GameErrorNotifier] to keep track of errors of a game
  const ErrorNotifierProvider._(
      {super.runNotifierBuildOverride, ErrorNotifier Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'errorNotifierProvider',
          isAutoDispose: false,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final ErrorNotifier Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$errorNotifierHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameError? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameError?>(value),
    );
  }

  @$internal
  @override
  ErrorNotifier create() => _createCb?.call() ?? ErrorNotifier();

  @$internal
  @override
  ErrorNotifierProvider $copyWithCreate(
    ErrorNotifier Function() create,
  ) {
    return ErrorNotifierProvider._(create: create);
  }

  @$internal
  @override
  ErrorNotifierProvider $copyWithBuild(
    GameError? Function(
      Ref<GameError?>,
      ErrorNotifier,
    ) build,
  ) {
    return ErrorNotifierProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<ErrorNotifier, GameError?> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$errorNotifierHash() => r'aef8368d4e53c48941e3f0507733379596eca531';

abstract class _$ErrorNotifier extends $Notifier<GameError?> {
  GameError? build();
  @$internal
  @override
  GameError? runBuild() => build();
}

@ProviderFor(LobbyNotifier)
const lobbyNotifierProvider = LobbyNotifierProvider._();

final class LobbyNotifierProvider
    extends $NotifierProvider<LobbyNotifier, Lobby> {
  const LobbyNotifierProvider._(
      {super.runNotifierBuildOverride, LobbyNotifier Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'lobbyNotifierProvider',
          isAutoDispose: false,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final LobbyNotifier Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$lobbyNotifierHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Lobby value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Lobby>(value),
    );
  }

  @$internal
  @override
  LobbyNotifier create() => _createCb?.call() ?? LobbyNotifier();

  @$internal
  @override
  LobbyNotifierProvider $copyWithCreate(
    LobbyNotifier Function() create,
  ) {
    return LobbyNotifierProvider._(create: create);
  }

  @$internal
  @override
  LobbyNotifierProvider $copyWithBuild(
    Lobby Function(
      Ref<Lobby>,
      LobbyNotifier,
    ) build,
  ) {
    return LobbyNotifierProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<LobbyNotifier, Lobby> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$lobbyNotifierHash() => r'4815ef4cad20824ed0dbbb6a941f778cdfa53bee';

abstract class _$LobbyNotifier extends $Notifier<Lobby> {
  Lobby build();
  @$internal
  @override
  Lobby runBuild() => build();
}

/// Provides the [GameStateNotifier] based on the [GameConfig] from [lobby]'s config
/// A [Notifier] that handles events for a particular game, delegating to the game's implementation for non generic events
@ProviderFor(GameStateNotifier)
const gameStateNotifierProvider = GameStateNotifierProvider._();

/// Provides the [GameStateNotifier] based on the [GameConfig] from [lobby]'s config
/// A [Notifier] that handles events for a particular game, delegating to the game's implementation for non generic events
final class GameStateNotifierProvider
    extends $NotifierProvider<GameStateNotifier, GameState> {
  /// Provides the [GameStateNotifier] based on the [GameConfig] from [lobby]'s config
  /// A [Notifier] that handles events for a particular game, delegating to the game's implementation for non generic events
  const GameStateNotifierProvider._(
      {super.runNotifierBuildOverride, GameStateNotifier Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'gameStateNotifierProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[
            lobbyNotifierProvider,
            errorNotifierProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>[
            GameStateNotifierProvider.$allTransitiveDependencies0,
            GameStateNotifierProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = lobbyNotifierProvider;
  static const $allTransitiveDependencies1 = errorNotifierProvider;

  final GameStateNotifier Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$gameStateNotifierHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameState>(value),
    );
  }

  @$internal
  @override
  GameStateNotifier create() => _createCb?.call() ?? GameStateNotifier();

  @$internal
  @override
  GameStateNotifierProvider $copyWithCreate(
    GameStateNotifier Function() create,
  ) {
    return GameStateNotifierProvider._(create: create);
  }

  @$internal
  @override
  GameStateNotifierProvider $copyWithBuild(
    GameState Function(
      Ref<GameState>,
      GameStateNotifier,
    ) build,
  ) {
    return GameStateNotifierProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<GameStateNotifier, GameState> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$gameStateNotifierHash() => r'e38831345a42338812befafaac8a139e6107b7a8';

abstract class _$GameStateNotifier extends $Notifier<GameState> {
  GameState build();
  @$internal
  @override
  GameState runBuild() => build();
}

const $kDebugMode = bool.fromEnvironment('dart.vm.product');
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use_from_same_package, unreachable_from_main
