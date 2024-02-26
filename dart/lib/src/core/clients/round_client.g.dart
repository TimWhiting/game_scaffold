// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef RoundInfoRef = Ref<RoundInfo>;

@ProviderFor(roundInfo)
const roundInfoProvider = RoundInfoProvider._();

final class RoundInfoProvider
    extends $FunctionalProvider<RoundInfo, RoundInfo, RoundInfoRef>
    with $Provider<RoundInfo, RoundInfoRef> {
  const RoundInfoProvider._(
      {RoundInfo Function(
        RoundInfoRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'roundInfoProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            multiplayerRoundClientProvider,
            currentPlayerIDProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>{
            RoundInfoProvider.$allTransitiveDependencies0,
            RoundInfoProvider.$allTransitiveDependencies1,
            RoundInfoProvider.$allTransitiveDependencies2,
            RoundInfoProvider.$allTransitiveDependencies3,
            RoundInfoProvider.$allTransitiveDependencies4,
            RoundInfoProvider.$allTransitiveDependencies5,
            RoundInfoProvider.$allTransitiveDependencies6,
            RoundInfoProvider.$allTransitiveDependencies7,
            RoundInfoProvider.$allTransitiveDependencies8,
            RoundInfoProvider.$allTransitiveDependencies9,
          },
        );

  static const $allTransitiveDependencies0 = multiplayerRoundClientProvider;
  static const $allTransitiveDependencies1 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies3 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies4 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies3;
  static const $allTransitiveDependencies5 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies4;
  static const $allTransitiveDependencies6 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies5;
  static const $allTransitiveDependencies7 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies6;
  static const $allTransitiveDependencies8 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies7;
  static const $allTransitiveDependencies9 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies8;

  final RoundInfo Function(
    RoundInfoRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$roundInfoHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoundInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<RoundInfo>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<RoundInfo> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  RoundInfoProvider $copyWithCreate(
    RoundInfo Function(
      RoundInfoRef ref,
    ) create,
  ) {
    return RoundInfoProvider._(create: create);
  }

  @override
  RoundInfo create(RoundInfoRef ref) {
    final _$cb = _createCb ?? roundInfo;
    return _$cb(ref);
  }
}

String _$roundInfoHash() => r'cba74c5fedb33ef2c7032bd1f86fb779e6e3265d';

typedef RoundClientRef = Ref<MultiplayerRoundClient>;

@ProviderFor(roundClient)
const roundClientProvider = RoundClientProvider._();

final class RoundClientProvider extends $FunctionalProvider<
    MultiplayerRoundClient,
    MultiplayerRoundClient,
    RoundClientRef> with $Provider<MultiplayerRoundClient, RoundClientRef> {
  const RoundClientProvider._(
      {MultiplayerRoundClient Function(
        RoundClientRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'roundClientProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            multiplayerRoundClientProvider,
            currentPlayerIDProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>{
            RoundClientProvider.$allTransitiveDependencies0,
            RoundClientProvider.$allTransitiveDependencies1,
            RoundClientProvider.$allTransitiveDependencies2,
            RoundClientProvider.$allTransitiveDependencies3,
            RoundClientProvider.$allTransitiveDependencies4,
            RoundClientProvider.$allTransitiveDependencies5,
            RoundClientProvider.$allTransitiveDependencies6,
            RoundClientProvider.$allTransitiveDependencies7,
            RoundClientProvider.$allTransitiveDependencies8,
            RoundClientProvider.$allTransitiveDependencies9,
          },
        );

  static const $allTransitiveDependencies0 = multiplayerRoundClientProvider;
  static const $allTransitiveDependencies1 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies3 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies4 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies3;
  static const $allTransitiveDependencies5 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies4;
  static const $allTransitiveDependencies6 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies5;
  static const $allTransitiveDependencies7 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies6;
  static const $allTransitiveDependencies8 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies7;
  static const $allTransitiveDependencies9 =
      MultiplayerRoundClientProvider.$allTransitiveDependencies8;

  final MultiplayerRoundClient Function(
    RoundClientRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$roundClientHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MultiplayerRoundClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<MultiplayerRoundClient>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<MultiplayerRoundClient> $createElement(
          ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  RoundClientProvider $copyWithCreate(
    MultiplayerRoundClient Function(
      RoundClientRef ref,
    ) create,
  ) {
    return RoundClientProvider._(create: create);
  }

  @override
  MultiplayerRoundClient create(RoundClientRef ref) {
    final _$cb = _createCb ?? roundClient;
    return _$cb(ref);
  }
}

String _$roundClientHash() => r'92ecb73c57292fff15129f482f45624f5e7dcb30';

@ProviderFor(MultiplayerRoundClient)
const multiplayerRoundClientProvider = MultiplayerRoundClientFamily._();

final class MultiplayerRoundClientProvider
    extends $NotifierProvider<MultiplayerRoundClient, RoundInfo> {
  const MultiplayerRoundClientProvider._(
      {required MultiplayerRoundClientFamily super.from,
      required PlayerID super.argument,
      super.runNotifierBuildOverride,
      MultiplayerRoundClient Function()? create})
      : _createCb = create,
        super(
          name: r'multiplayerRoundClientProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = singleConfigProvider;
  static const $allTransitiveDependencies1 = multiplayerGameClientProvider;
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
  static const $allTransitiveDependencies7 = roundServiceProvider;
  static const $allTransitiveDependencies8 =
      RoundServiceProvider.$allTransitiveDependencies0;

  final MultiplayerRoundClient Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$multiplayerRoundClientHash();

  @override
  String toString() {
    return r'multiplayerRoundClientProvider'
        ''
        '($argument)';
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoundInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<RoundInfo>(value),
    );
  }

  @$internal
  @override
  MultiplayerRoundClient create() =>
      _createCb?.call() ?? MultiplayerRoundClient();

  @$internal
  @override
  MultiplayerRoundClientProvider $copyWithCreate(
    MultiplayerRoundClient Function() create,
  ) {
    return MultiplayerRoundClientProvider._(
        argument: argument as PlayerID,
        from: from! as MultiplayerRoundClientFamily,
        create: create);
  }

  @$internal
  @override
  MultiplayerRoundClientProvider $copyWithBuild(
    RoundInfo Function(
      Ref<RoundInfo>,
      MultiplayerRoundClient,
    ) build,
  ) {
    return MultiplayerRoundClientProvider._(
        argument: argument as PlayerID,
        from: from! as MultiplayerRoundClientFamily,
        runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<MultiplayerRoundClient, RoundInfo> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);

  @override
  bool operator ==(Object other) {
    return other is MultiplayerRoundClientProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$multiplayerRoundClientHash() =>
    r'15e5a836df8b34b755a213806dd7b3431add69b3';

final class MultiplayerRoundClientFamily extends Family {
  const MultiplayerRoundClientFamily._()
      : super(
          name: r'multiplayerRoundClientProvider',
          dependencies: const <ProviderOrFamily>[
            singleConfigProvider,
            multiplayerGameClientProvider,
            roundServiceProvider,
            currentPlayerIDProvider
          ],
          allTransitiveDependencies: const <ProviderOrFamily>{
            MultiplayerRoundClientProvider.$allTransitiveDependencies0,
            MultiplayerRoundClientProvider.$allTransitiveDependencies1,
            MultiplayerRoundClientProvider.$allTransitiveDependencies2,
            MultiplayerRoundClientProvider.$allTransitiveDependencies3,
            MultiplayerRoundClientProvider.$allTransitiveDependencies4,
            MultiplayerRoundClientProvider.$allTransitiveDependencies5,
            MultiplayerRoundClientProvider.$allTransitiveDependencies6,
            MultiplayerRoundClientProvider.$allTransitiveDependencies7,
            MultiplayerRoundClientProvider.$allTransitiveDependencies8,
          },
          isAutoDispose: true,
        );

  MultiplayerRoundClientProvider call(
    PlayerID multiplayerID,
  ) =>
      MultiplayerRoundClientProvider._(argument: multiplayerID, from: this);

  @override
  String debugGetCreateSourceHash() => _$multiplayerRoundClientHash();

  @override
  String toString() => r'multiplayerRoundClientProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    MultiplayerRoundClient Function(
      PlayerID args,
    ) create,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (container, provider) {
        provider as MultiplayerRoundClientProvider;

        final argument = provider.argument as PlayerID;

        return provider
            .$copyWithCreate(() => create(argument))
            .$createElement(container);
      },
    );
  }

  /// {@macro riverpod.override_with_build}
  Override overrideWithBuild(
    RoundInfo Function(Ref<RoundInfo> ref, MultiplayerRoundClient notifier,
            PlayerID argument)
        build,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (container, provider) {
        provider as MultiplayerRoundClientProvider;

        final argument = provider.argument as PlayerID;

        return provider
            .$copyWithBuild((ref, notifier) => build(ref, notifier, argument))
            .$createElement(container);
      },
    );
  }
}

abstract class _$MultiplayerRoundClient extends $Notifier<RoundInfo> {
  late final _$args =
      (ref as $NotifierProviderElement).origin.argument as PlayerID;
  PlayerID get multiplayerID => _$args;

  RoundInfo build(
    PlayerID multiplayerID,
  );
  @$internal
  @override
  RoundInfo runBuild() => build(
        _$args,
      );
}

// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use_from_same_package, unreachable_from_main
