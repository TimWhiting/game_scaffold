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

/// Some extensions on `Game` to more easily get some of the `GenericGame` fields
extension GameX<T> on State<T> {

  /// Gets the player at the [currentPlayerIndex]
  Player? get currentPlayer =>
      currentPlayerIndex == null ? null : generic.players[currentPlayerIndex!];

  /// Returns a copy of the [GenericGame] with the next player in the player
  /// array as the current player
  State<T> nextPlayer() => (game: game, messages: messages, generic: generic, rewards: rewards, currentPlayerIndex: (currentPlayerIndex! + 1) % players.length);

  /// Returns a copy of the [GenericGame] with the current player being the one
  /// with id [player]
  State<T> setNextPlayer(PlayerID player) => (game: game, messages: messages, generic: generic, rewards: rewards, currentPlayerIndex: players.indexWhere((p) => p.id == player));

  State<T> updateReward(IMap<String, double> rewards) => (game: game, messages: messages, generic: generic, rewards: rewards.unlock, currentPlayerIndex: currentPlayerIndex);

  /// Gets the current Player ID
  String get currentPlayerID => currentPlayer!.id;

  /// Gets an unmodifiable list of players that are a part of this game
  IList<Player> get players => generic.players;

  /// Gets the players that are a part of this game
  IList<PlayerID> get playerIDs => generic.players.map((p) => p.id).toIList();

  /// Gets the `DateTime` that this state was updated
  DateTime get time => generic.time;

  /// Gets the status of the game
  GameStatus get status => generic.status;

  /// Gets the current round number
  int get round => generic.round;

  /// Gets whether the game is over
  bool get gameOver => generic.gameOver;

  /// Gets whether the round is over
  bool get roundOver => generic.roundOver;

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
