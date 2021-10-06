import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'events.dart';
import 'game.dart';
import 'generic.dart';
import 'player.dart';

export 'package:fast_immutable_collections/fast_immutable_collections.dart';

extension GameTypeOf on String {
  /// Returns the game's user friendly name based on the game's type identifier
  String get name => Game.gameNames[this]!;
}

/// An extension to convert an `Event` to a `GameEvent`
extension EventX on Event {
  /// Converts an `Event` to a `GameEvent` if it isn't already a `GameEvent`
  GameEvent get asGameEvent => this is GameEvent
      ? this as GameEvent
      : this is GenericEvent
          ? GameEvent.general(this as GenericEvent)
          : GameEvent.game(this);
}

/// Some extensions on `Game` to more easiliy get some of the `GenericGame` fields
extension GameX on Game {
  /// Gets the current player's index
  int? get currentPlayerIndex => generic.currentPlayerIndex;

  /// Gets the current [Player] or null if the game is not turn based
  Player? get currentPlayer => generic.currentPlayer;

  /// Gets the current Player ID
  String get currentPlayerID => generic.currentPlayer!.id;

  /// Gets an unmodifiable list of players that are a part of this game
  IList<Player> get players => generic.players;

  /// Gets the players that are a part of this game
  IList<PlayerID> get playerIDs => generic.players.map((p) => p.id).toIList();

  /// Gets the `DateTime` that this state was updated
  DateTime get time => generic.time;

  /// Gets the list of `GameMessage`s that have been exchanged this game
  IList<GameMessage> get messages => generic.messages;

  /// Gets the status of the game
  GameStatus get status => generic.status;

  /// Gets the current round number
  int get round => generic.round;

  /// Gets the total score for each player mapped by player id
  IMap<PlayerID, double> get totalScores => generic.totalScores;

  /// Gets the list of round scores for each player mapped by their id
  IMap<PlayerID, IList<double>> get playerRoundScores =>
      generic.playerRoundScores;

  /// Gets the map of player scores grouped by round
  IList<IMap<PlayerID, double>> get roundPlayerScores =>
      generic.roundPlayerScores;

  /// Gets whether the game is over
  bool get gameOver => generic.gameOver;

  /// Gets whether the round is over
  bool get roundOver => generic.roundOver;

  /// Gets whether the game has multiple actions before a reward
  bool get isMultiPly => generic.isMultiPly;

  /// Gets whether the game is simultaneous action at this ply
  bool get isSimultaneousAction => generic.isSimultaneousAction;

  /// Gets the players who are ready for the next round
  IList<PlayerID> get readyPlayers => generic.readyPlayers;
}

extension GameMapExtensions<K, V> on IMap<K, V> {
  IMap<K, S> mapValues<S>(S Function(MapEntry<K, V> entry) fn) => IMap({
        for (final entry in entries) entry.key: fn(entry),
      });

  IMap<S, V> mapKeys<S>(S Function(MapEntry<K, V> entry) fn) => IMap({
        for (final entry in entries) fn(entry): entry.value,
      });
}
