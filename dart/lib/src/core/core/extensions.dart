// ignore_for_file: one_member_abstracts

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

typedef GameCode = String;
typedef GameType = String;
typedef JsonMap = Map<String, Object?>;

abstract class GameState {
  int get numFeatures;
  IList<int> get features;
  int get markovId => features.hashCode;
  IList<Matrix> get actionRewards;
  String get type;
  JsonMap toJson();
  GameState next(Event event);
}

// The type of the event
typedef EventType = String;

abstract class GameEvent {
  JsonMap toJson();
}
