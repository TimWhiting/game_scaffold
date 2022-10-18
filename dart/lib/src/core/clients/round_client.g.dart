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

String $RoundClientHash() => r'6b008cecd79c59b97a306b794341ef4f34cac246';

/// See also [RoundClient].
class RoundClientProvider
    extends AutoDisposeNotifierProviderImpl<RoundClient, RoundInfo> {
  RoundClientProvider(
    this.multiplayerID,
  ) : super(
          () => RoundClient()..multiplayerID = multiplayerID,
          from: roundClientProvider,
          name: r'roundClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $RoundClientHash,
        );

  final String multiplayerID;

  @override
  bool operator ==(Object other) {
    return other is RoundClientProvider && other.multiplayerID == multiplayerID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, multiplayerID.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  RoundInfo runNotifierBuild(
    covariant _$RoundClient notifier,
  ) {
    return notifier.build(
      multiplayerID,
    );
  }
}

typedef RoundClientRef = AutoDisposeNotifierProviderRef<RoundInfo>;

/// See also [RoundClient].
final roundClientProvider = RoundClientFamily();

class RoundClientFamily extends Family<RoundInfo> {
  RoundClientFamily();

  RoundClientProvider call(
    String multiplayerID,
  ) {
    return RoundClientProvider(
      multiplayerID,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<RoundClient, RoundInfo> getProviderOverride(
    covariant RoundClientProvider provider,
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
  String? get name => r'roundClientProvider';
}

abstract class _$RoundClient extends BuildlessAutoDisposeNotifier<RoundInfo> {
  late final String multiplayerID;

  RoundInfo build(
    String multiplayerID,
  );
}
