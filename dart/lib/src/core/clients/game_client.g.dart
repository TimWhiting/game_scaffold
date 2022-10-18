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

String $GameClientHash() => r'8675f0383837ba23bb15f261fd039a82d3260c9b';

/// See also [GameClient].
class GameClientProvider
    extends AutoDisposeNotifierProviderImpl<GameClient, GameClientInfo> {
  GameClientProvider(
    this.multiplayerID,
  ) : super(
          () => GameClient()..multiplayerID = multiplayerID,
          from: gameClientProvider,
          name: r'gameClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $GameClientHash,
        );

  final String multiplayerID;

  @override
  bool operator ==(Object other) {
    return other is GameClientProvider && other.multiplayerID == multiplayerID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, multiplayerID.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  GameClientInfo runNotifierBuild(
    covariant _$GameClient notifier,
  ) {
    return notifier.build(
      multiplayerID,
    );
  }
}

typedef GameClientRef = AutoDisposeNotifierProviderRef<GameClientInfo>;

/// See also [GameClient].
final gameClientProvider = GameClientFamily();

class GameClientFamily extends Family<GameClientInfo> {
  GameClientFamily();

  GameClientProvider call(
    String multiplayerID,
  ) {
    return GameClientProvider(
      multiplayerID,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<GameClient, GameClientInfo>
      getProviderOverride(
    covariant GameClientProvider provider,
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
  String? get name => r'gameClientProvider';
}

abstract class _$GameClient
    extends BuildlessAutoDisposeNotifier<GameClientInfo> {
  late final String multiplayerID;

  GameClientInfo build(
    String multiplayerID,
  );
}
