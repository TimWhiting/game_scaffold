// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_device.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// An implementation of a [RoundService] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
@ProviderFor(OnDeviceRoundService)
const onDeviceRoundServiceProvider = OnDeviceRoundServiceProvider._();

/// An implementation of a [RoundService] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
final class OnDeviceRoundServiceProvider
    extends $NotifierProvider<OnDeviceRoundService, void> {
  /// An implementation of a [RoundService] for a local game on device with no server connection
  ///
  /// Warning implementation not complete or tested yet
  const OnDeviceRoundServiceProvider._(
      {super.runNotifierBuildOverride, OnDeviceRoundService Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'onDeviceRoundServiceProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[currentPlayerIDProvider],
          allTransitiveDependencies: const <ProviderOrFamily>[
            OnDeviceRoundServiceProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = currentPlayerIDProvider;

  final OnDeviceRoundService Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$onDeviceRoundServiceHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<void>(value),
    );
  }

  @$internal
  @override
  OnDeviceRoundService create() => _createCb?.call() ?? OnDeviceRoundService();

  @$internal
  @override
  OnDeviceRoundServiceProvider $copyWithCreate(
    OnDeviceRoundService Function() create,
  ) {
    return OnDeviceRoundServiceProvider._(create: create);
  }

  @$internal
  @override
  OnDeviceRoundServiceProvider $copyWithBuild(
    void Function(
      Ref<void>,
      OnDeviceRoundService,
    ) build,
  ) {
    return OnDeviceRoundServiceProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<OnDeviceRoundService, void> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$onDeviceRoundServiceHash() =>
    r'3bc292969ba93b3de021492207064890584f3315';

abstract class _$OnDeviceRoundService extends $Notifier<void> {
  void build();
  @$internal
  @override
  void runBuild() => build();
}

/// An on device implementation of [GameService]
///
/// Warning implementation not complete or tested yet
@ProviderFor(OnDeviceGameService)
const onDeviceGameServiceProvider = OnDeviceGameServiceProvider._();

/// An on device implementation of [GameService]
///
/// Warning implementation not complete or tested yet
final class OnDeviceGameServiceProvider
    extends $NotifierProvider<OnDeviceGameService, void> {
  /// An on device implementation of [GameService]
  ///
  /// Warning implementation not complete or tested yet
  const OnDeviceGameServiceProvider._(
      {super.runNotifierBuildOverride, OnDeviceGameService Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          name: r'onDeviceGameServiceProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[],
          allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  final OnDeviceGameService Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$onDeviceGameServiceHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<void>(value),
    );
  }

  @$internal
  @override
  OnDeviceGameService create() => _createCb?.call() ?? OnDeviceGameService();

  @$internal
  @override
  OnDeviceGameServiceProvider $copyWithCreate(
    OnDeviceGameService Function() create,
  ) {
    return OnDeviceGameServiceProvider._(create: create);
  }

  @$internal
  @override
  OnDeviceGameServiceProvider $copyWithBuild(
    void Function(
      Ref<void>,
      OnDeviceGameService,
    ) build,
  ) {
    return OnDeviceGameServiceProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<OnDeviceGameService, void> $createElement(
          ProviderContainer container) =>
      $NotifierProviderElement(this, container);
}

String _$onDeviceGameServiceHash() =>
    r'dd70df380ccef45c147b74a663e57ecc2e063f81';

abstract class _$OnDeviceGameService extends $Notifier<void> {
  void build();
  @$internal
  @override
  void runBuild() => build();
}

// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use_from_same_package, unreachable_from_main
