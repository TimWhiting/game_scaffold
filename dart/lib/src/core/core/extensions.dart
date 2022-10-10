import 'package:fast_immutable_collections/fast_immutable_collections.dart';

export 'package:fast_immutable_collections/fast_immutable_collections.dart';

extension GameMapExtensions<K, V> on IMap<K, V> {
  IMap<K, S> mapValues<S>(S Function(MapEntry<K, V> entry) fn) => IMap({
        for (final entry in entries) entry.key: fn(entry),
      });

  IMap<S, V> mapKeys<S>(S Function(MapEntry<K, V> entry) fn) => IMap({
        for (final entry in entries) fn(entry): entry.value,
      });
}

extension AddRewards on List<double> {
  // ignore: unused_element
  List<double> operator +(List<double> other) =>
      [for (var i = 0; i < length; i++) this[i] + other[i]];
}

typedef JsonMap = Map<String, Object?>;
