import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_scaffold_dart/src/core/core/generic.dart';
part 'events.freezed.dart';

/// Represents an event of a game
///
/// Must associate itself with a particular [type] of game registered to the server
abstract class Event {
  Map<String, dynamic> toJson();

  /// The game [type] this event is handled by
  String get type;
}

/// An [Event] that represents either a [GenericEvent] or a user defined [Event]
/// for a partiular game
@freezed
abstract class GameEvent with _$GameEvent implements Event {
  const GameEvent._();

  /// Represents an [event] that is for a particlar [Game]
  const factory GameEvent.game(Event event) = _GameEventGame;

  /// Represents an [event] that is one of the predefined [GenericEvent]s.
  const factory GameEvent.general(GenericEvent event) = _GameEventGeneral;

  @override
  String get type => when(game: (_) => 'game', general: (_) => 'general');

  @override
  Map<String, dynamic> toJson() =>
      // Some magic to add in the type information so the [Event] can be deserialized properly
      when(
        game: (g) => g.toJson()..['type'] = g.type,
        general: (g) => g.toJson()..['type'] = g.type,
      );
}