import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'player.freezed.dart';
part 'player.g.dart';

// typedef PlayerID = String; // TODO: Create a typedef when nonfunction-type-aliases becomes available
/// A default PlayerID for Player 1 in a two player game
const String P1 = '0';

/// A default PlayerID for Player 2 in a two player game
const String P2 = '1';

/// Represents a set of names that can be randomly assigned to players
enum NameSet { Basic }

/// The sets of approved names for random assignment
final Map<NameSet, List<String>> nameSets = {
  NameSet.Basic: ['Bob', 'Jo', 'Jane', 'Luis', 'Martin', 'Cobb', 'Dora'],
};

/// Represents the basic details of a player in a game
@freezed
abstract class Player with _$Player {
  /// Represents the basic details of a player in a game
  ///
  /// Players have a unique id and an optional name
  const factory Player(String id, {@Default('') String name}) = _Player;
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
