// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_client.dart';

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

String $MultiplayerGameClientHash() =>
    r'a3779a392abe891d704b8785e2467519b685bc41';

/// See also [MultiplayerGameClient].
class MultiplayerGameClientProvider
    extends NotifierProviderImpl<MultiplayerGameClient, GameClientInfo> {
  MultiplayerGameClientProvider(
    this.multiplayerID,
  ) : super(
          () => MultiplayerGameClient()..multiplayerID = multiplayerID,
          from: multiplayerGameClientProvider,
          name: r'multiplayerGameClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $MultiplayerGameClientHash,
        );

  final String multiplayerID;

  @override
  bool operator ==(Object other) {
    return other is MultiplayerGameClientProvider &&
        other.multiplayerID == multiplayerID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, multiplayerID.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  GameClientInfo runNotifierBuild(
    covariant _$MultiplayerGameClient notifier,
  ) {
    return notifier.build(
      multiplayerID,
    );
  }
}

typedef MultiplayerGameClientRef = NotifierProviderRef<GameClientInfo>;

/// See also [MultiplayerGameClient].
final multiplayerGameClientProvider = MultiplayerGameClientFamily();

class MultiplayerGameClientFamily extends Family<GameClientInfo> {
  MultiplayerGameClientFamily();

  MultiplayerGameClientProvider call(
    String multiplayerID,
  ) {
    return MultiplayerGameClientProvider(
      multiplayerID,
    );
  }

  @override
  NotifierProviderImpl<MultiplayerGameClient, GameClientInfo>
      getProviderOverride(
    covariant MultiplayerGameClientProvider provider,
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
  String? get name => r'multiplayerGameClientProvider';
}

abstract class _$MultiplayerGameClient
    extends BuildlessNotifier<GameClientInfo> {
  late final String multiplayerID;

  GameClientInfo build(
    String multiplayerID,
  );
}
