import 'package:freezed_annotation/freezed_annotation.dart';
part 'player.freezed.dart';
part 'player.g.dart';

/// The unique ID given to each player each game
typedef PlayerID = String;

/// The unique ID of the player from the service (e.g. Firebase)
typedef AuthID = String;

/// The player's name in the game
typedef PlayerGameName = String;

/// The player's real name
typedef UserName = String;

/// A default PlayerID for Player 1 in a two player game
const PlayerID P1 = '0';

/// A default PlayerID for Player 2 in a two player game
const PlayerID P2 = '1';

/// Represents a set of names that can be randomly assigned to players
enum NameSet { Basic }

/// The sets of approved names for random assignment
final Map<NameSet, List<PlayerGameName>> nameSets = {
  NameSet.Basic: ['Bob', 'Jo', 'Jane', 'Luis', 'Martin', 'Cobb', 'Dora'],
};

/// Represents the basic details of a player in a game
@freezed
class Player with _$Player {
  /// Represents the basic details of a player in a game
  ///
  /// Players have a unique id and an optional name
  const factory Player(PlayerID id, {@Default('') PlayerGameName name, @Default('') AuthID authID}) = _Player;
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
