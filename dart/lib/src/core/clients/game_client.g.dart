// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef GameInfoRef = Ref<GameClientInfo>;

@ProviderFor(gameInfo)
const gameInfoProvider = GameInfoProvider._();

final class GameInfoProvider
    extends $FunctionalProvider<GameClientInfo, GameClientInfo, GameInfoRef>
    with $Provider<GameClientInfo, GameInfoRef> {
  const GameInfoProvider._(
      {GameClientInfo Function(
        GameInfoRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'gameInfoProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            multiplayerGameClientProvider,
            currentPlayerIDProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>{
            GameInfoProvider.$allTransitiveDependencies0,
            GameInfoProvider.$allTransitiveDependencies1,
            GameInfoProvider.$allTransitiveDependencies2,
            GameInfoProvider.$allTransitiveDependencies3,
            GameInfoProvider.$allTransitiveDependencies4,
            GameInfoProvider.$allTransitiveDependencies5,
            GameInfoProvider.$allTransitiveDependencies6,
          },
        );

  static const $allTransitiveDependencies0 = multiplayerGameClientProvider;
  static const $allTransitiveDependencies1 =
      MultiplayerGameClientProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      MultiplayerGameClientProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies3 =
      MultiplayerGameClientProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies4 =
      MultiplayerGameClientProvider.$allTransitiveDependencies3;
  static const $allTransitiveDependencies5 =
      MultiplayerGameClientProvider.$allTransitiveDependencies4;
  static const $allTransitiveDependencies6 =
      MultiplayerGameClientProvider.$allTransitiveDependencies5;

  final GameClientInfo Function(
    GameInfoRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$gameInfoHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameClientInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameClientInfo>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<GameClientInfo> $createElement(
          ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  GameInfoProvider $copyWithCreate(
    GameClientInfo Function(
      GameInfoRef ref,
    ) create,
  ) {
    return GameInfoProvider._(create: create);
  }

  @override
  GameClientInfo create(GameInfoRef ref) {
    final _$cb = _createCb ?? gameInfo;
    return _$cb(ref);
  }
}

String _$gameInfoHash() => r'5b2ba0914378bbb1db30160957153ec0f2644de6';

typedef GameInfoClientRef = Ref<MultiplayerGameClient>;

@ProviderFor(gameInfoClient)
const gameInfoClientProvider = GameInfoClientProvider._();

final class GameInfoClientProvider extends $FunctionalProvider<
        MultiplayerGameClient, MultiplayerGameClient, GameInfoClientRef>
    with $Provider<MultiplayerGameClient, GameInfoClientRef> {
  const GameInfoClientProvider._(
      {MultiplayerGameClient Function(
        GameInfoClientRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'gameInfoClientProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            multiplayerGameClientProvider,
            currentPlayerIDProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>{
            GameInfoClientProvider.$allTransitiveDependencies0,
            GameInfoClientProvider.$allTransitiveDependencies1,
            GameInfoClientProvider.$allTransitiveDependencies2,
            GameInfoClientProvider.$allTransitiveDependencies3,
            GameInfoClientProvider.$allTransitiveDependencies4,
            GameInfoClientProvider.$allTransitiveDependencies5,
            GameInfoClientProvider.$allTransitiveDependencies6,
          },
        );

  static const $allTransitiveDependencies0 = multiplayerGameClientProvider;
  static const $allTransitiveDependencies1 =
      MultiplayerGameClientProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      MultiplayerGameClientProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies3 =
      MultiplayerGameClientProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies4 =
      MultiplayerGameClientProvider.$allTransitiveDependencies3;
  static const $allTransitiveDependencies5 =
      MultiplayerGameClientProvider.$allTransitiveDependencies4;
  static const $allTransitiveDependencies6 =
      MultiplayerGameClientProvider.$allTransitiveDependencies5;

  final MultiplayerGameClient Function(
    GameInfoClientRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$gameInfoClientHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MultiplayerGameClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<MultiplayerGameClient>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<MultiplayerGameClient> $createElement(
          ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  GameInfoClientProvider $copyWithCreate(
    MultiplayerGameClient Function(
      GameInfoClientRef ref,
    ) create,
  ) {
    return GameInfoClientProvider._(create: create);
  }

  @override
  MultiplayerGameClient create(GameInfoClientRef ref) {
    final _$cb = _createCb ?? gameInfoClient;
    return _$cb(ref);
  }
}

String _$gameInfoClientHash() => r'cf72ff10524b0b0dbc22a90db3f07d3683ebeaf2';

@ProviderFor(MultiplayerGameClient)
const multiplayerGameClientProvider = MultiplayerGameClientFamily._();

final class MultiplayerGameClientProvider
    extends $NotifierProvider<MultiplayerGameClient, GameClientInfo> {
  const MultiplayerGameClientProvider._(
      {required MultiplayerGameClientFamily super.from,
      required PlayerID super.argument,
      super.runNotifierBuildOverride,
      MultiplayerGameClient Function()? create})
      : _createCb = create,
        super(
          name: r'multiplayerGameClientProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = singleConfigProvider;
  static const $allTransitiveDependencies1 = gameServiceProvider;
  static const $allTransitiveDependencies2 =
      GameServiceProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies3 =
      GameServiceProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies4 =
      GameServiceProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies5 =
      GameServiceProvider.$allTransitiveDependencies3;

  final MultiplayerGameClient Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$multiplayerGameClientHash();

  @override
  String toString() {
    return r'multiplayerGameClientProvider'
        ''
        '($argument)';
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameClientInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GameClientInfo>(value),
    );
  }

  @$internal
  @override
  MultiplayerGameClient create() =>
      _createCb?.call() ?? MultiplayerGameClient();

  @$internal
  @override
  MultiplayerGameClientProvider $copyWithCreate(
    MultiplayerGameClient Function() create,
  ) {
    return MultiplayerGameClientProvider._(
        argument: argument as PlayerID,
        from: from! as MultiplayerGameClientFamily,
        create: create);
  }

  @$internal
  @override
  MultiplayerGameClientProvider $copyWithBuild(
    GameClientInfo Function(
      Ref<GameClientInfo>,
      MultiplayerGameClient,
    ) build,
  ) {
    return MultiplayerGameClientProvider._(
        argument: argument as PlayerID,
        from: from! as MultiplayerGameClientFamily,
        runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<MultiplayerGameClient, GameClientInfo>
      $createElement(ProviderContainer container) =>
          $NotifierProviderElement(this, container);

  @override
  bool operator ==(Object other) {
    return other is MultiplayerGameClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$multiplayerGameClientHash() =>
    r'9fb62acb941531559353ffc2ec9e26df94f9f47c';

final class MultiplayerGameClientFamily extends Family {
  const MultiplayerGameClientFamily._()
      : super(
          name: r'multiplayerGameClientProvider',
          dependencies: const <ProviderOrFamily>[
            singleConfigProvider,
            gameServiceProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>{
            MultiplayerGameClientProvider.$allTransitiveDependencies0,
            MultiplayerGameClientProvider.$allTransitiveDependencies1,
            MultiplayerGameClientProvider.$allTransitiveDependencies2,
            MultiplayerGameClientProvider.$allTransitiveDependencies3,
            MultiplayerGameClientProvider.$allTransitiveDependencies4,
            MultiplayerGameClientProvider.$allTransitiveDependencies5,
          },
          isAutoDispose: true,
        );

  MultiplayerGameClientProvider call(
    PlayerID multiplayerID,
  ) =>
      MultiplayerGameClientProvider._(argument: multiplayerID, from: this);

  @override
  String debugGetCreateSourceHash() => _$multiplayerGameClientHash();

  @override
  String toString() => r'multiplayerGameClientProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    MultiplayerGameClient Function(
      PlayerID args,
    ) create,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (container, provider) {
        provider as MultiplayerGameClientProvider;

        final argument = provider.argument as PlayerID;

        return provider
            .$copyWithCreate(() => create(argument))
            .$createElement(container);
      },
    );
  }

  /// {@macro riverpod.override_with_build}
  Override overrideWithBuild(
    GameClientInfo Function(Ref<GameClientInfo> ref,
            MultiplayerGameClient notifier, PlayerID argument)
        build,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (container, provider) {
        provider as MultiplayerGameClientProvider;

        final argument = provider.argument as PlayerID;

        return provider
            .$copyWithBuild((ref, notifier) => build(ref, notifier, argument))
            .$createElement(container);
      },
    );
  }
}

abstract class _$MultiplayerGameClient extends $Notifier<GameClientInfo> {
  late final _$args =
      (ref as $NotifierProviderElement).origin.argument as PlayerID;
  PlayerID get multiplayerID => _$args;

  GameClientInfo build(
    PlayerID multiplayerID,
  );
  @$internal
  @override
  GameClientInfo runBuild() => build(
        _$args,
      );
}

// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use_from_same_package, unreachable_from_main
