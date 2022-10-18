// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $MultiplayerRoundClientHash() =>
    r'a16dd5c4ac3fa4448a11d014cbe5a0231bd8f216';

/// See also [MultiplayerRoundClient].
class MultiplayerRoundClientProvider
    extends AutoDisposeNotifierProviderImpl<MultiplayerRoundClient, RoundInfo> {
  MultiplayerRoundClientProvider(
    this.multiplayerID,
  ) : super(
          () => MultiplayerRoundClient()..multiplayerID = multiplayerID,
          from: multiplayerRoundClientProvider,
          name: r'multiplayerRoundClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $MultiplayerRoundClientHash,
        );

  final String multiplayerID;

  @override
  bool operator ==(Object other) {
    return other is MultiplayerRoundClientProvider &&
        other.multiplayerID == multiplayerID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, multiplayerID.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  RoundInfo runNotifierBuild(
    covariant _$MultiplayerRoundClient notifier,
  ) {
    return notifier.build(
      multiplayerID,
    );
  }
}

typedef MultiplayerRoundClientRef = AutoDisposeNotifierProviderRef<RoundInfo>;

/// See also [MultiplayerRoundClient].
final multiplayerRoundClientProvider = MultiplayerRoundClientFamily();

class MultiplayerRoundClientFamily extends Family<RoundInfo> {
  MultiplayerRoundClientFamily();

  MultiplayerRoundClientProvider call(
    String multiplayerID,
  ) {
    return MultiplayerRoundClientProvider(
      multiplayerID,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<MultiplayerRoundClient, RoundInfo>
      getProviderOverride(
    covariant MultiplayerRoundClientProvider provider,
  ) {
    return call(
      provider.multiplayerID,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'multiplayerRoundClientProvider';
}

abstract class _$MultiplayerRoundClient
    extends BuildlessAutoDisposeNotifier<RoundInfo> {
  late final String multiplayerID;

  RoundInfo build(
    String multiplayerID,
  );
}
