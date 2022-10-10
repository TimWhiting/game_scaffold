import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'game.dart';

export 'package:fast_immutable_collections/fast_immutable_collections.dart';

extension GameTypeOf on String {
  /// Returns the game's user friendly name based on the game's type identifier
  String get name => Game.gameNames[this]!;
}

extension GameMapExtensions<K, V> on IMap<K, V> {
  IMap<K, S> mapValues<S>(S Function(MapEntry<K, V> entry) fn) => IMap({
        for (final entry in entries) entry.key: fn(entry),
      });

  IMap<S, V> mapKeys<S>(S Function(MapEntry<K, V> entry) fn) => IMap({
        for (final entry in entries) fn(entry): entry.value,
      });
}
