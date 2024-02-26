// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef RoundServiceRef<T extends RoundService> = Ref<T>;

@ProviderFor(roundService)
const roundServiceProvider = RoundServiceFamily._();

final class RoundServiceProvider<T extends RoundService>
    extends $FunctionalProvider<T, T, RoundServiceRef<T>>
    with $Provider<T, RoundServiceRef<T>> {
  const RoundServiceProvider._(
      {required RoundServiceFamily super.from,
      required PlayerID super.argument,
      T Function(
        RoundServiceRef<T> ref,
        PlayerID multiplayerID,
      )? create})
      : _createCb = create,
        super(
          name: r'roundServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = onDeviceRoundServiceProvider;
  static const $allTransitiveDependencies1 =
      OnDeviceRoundServiceProvider.$allTransitiveDependencies0;

  final T Function(
    RoundServiceRef<T> ref,
    PlayerID multiplayerID,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$roundServiceHash();

  RoundServiceProvider<T> _copyWithCreate(
    T Function<T extends RoundService>(
      RoundServiceRef<T> ref,
      PlayerID multiplayerID,
    ) create,
  ) {
    return RoundServiceProvider<T>._(
        argument: argument as PlayerID,
        from: from! as RoundServiceFamily,
        create: create<T>);
  }

  @override
  String toString() {
    return r'roundServiceProvider'
        '<${T}>'
        '($argument)';
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(T value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<T>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<T> $createElement(ProviderContainer container) =>
      $ProviderElement(this, container);

  @override
  RoundServiceProvider<T> $copyWithCreate(
    T Function(
      RoundServiceRef<T> ref,
    ) create,
  ) {
    return RoundServiceProvider<T>._(
        argument: argument as PlayerID,
        from: from! as RoundServiceFamily,
        create: (
          ref,
          PlayerID multiplayerID,
        ) =>
            create(ref));
  }

  @override
  T create(RoundServiceRef<T> ref) {
    final _$cb = _createCb ?? roundService<T>;
    final argument = this.argument as PlayerID;
    return _$cb(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RoundServiceProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$roundServiceHash() => r'76934f2048c020118a55e7de5c3ff50bdd6f8680';

final class RoundServiceFamily extends Family {
  const RoundServiceFamily._()
      : super(
          name: r'roundServiceProvider',
          dependencies: const <ProviderOrFamily>[onDeviceRoundServiceProvider],
          allTransitiveDependencies: const <ProviderOrFamily>[
            RoundServiceProvider.$allTransitiveDependencies0,
            RoundServiceProvider.$allTransitiveDependencies1,
          ],
          isAutoDispose: true,
        );

  RoundServiceProvider<T> call<T extends RoundService>(
    PlayerID multiplayerID,
  ) =>
      RoundServiceProvider<T>._(argument: multiplayerID, from: this);

  @override
  String debugGetCreateSourceHash() => _$roundServiceHash();

  @override
  String toString() => r'roundServiceProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    T Function<T extends RoundService>(
      RoundServiceRef<T> ref,
      PlayerID args,
    ) create,
  ) {
    return $FamilyOverride(
      from: this,
      createElement: (container, provider) {
        provider as RoundServiceProvider;

        return provider._copyWithCreate(<T extends RoundService>(
          ref,
          PlayerID multiplayerID,
        ) {
          return create(ref, multiplayerID);
        }).$createElement(container);
      },
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use_from_same_package, unreachable_from_main
