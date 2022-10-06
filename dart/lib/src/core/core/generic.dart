
import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

part 'generic.freezed.dart';
part 'generic.g.dart';


typedef Rewards = Map<PlayerID, double>;
typedef State<T> = ({T game, int? currentPlayerIndex, Rewards rewards, GenericGame generic, IList<GameMessage> messages});
typedef NextStateOrError<T> = ({State<T> state, GameError? error});
typedef GameError = ({String message, PlayerID player});

/// Represents a generic game, with common fields that can be manipulated by
/// common [GenericEvent]s
///
/// Includes
/// * List of [players]
/// * The [time] of the last game update
/// * The current [status]
/// * The [currentPlayerIndex]
/// * The current [round]
@freezed
class GenericGame with _$GenericGame {
  const factory GenericGame(
    IList<Player> players,
    IList<PlayerID> readyPlayers,
    DateTime time,
    GameStatus status,
    int round,
  ) = _GenericGame;
  const GenericGame._();

  factory GenericGame.fromJson(Map<String, dynamic> map) =>
      _$GenericGameFromJson(map);

  /// Creates a default initialized game with [players]
  factory GenericGame.start(IList<Player> players) => GenericGame(
        players.toIList(),
        <PlayerID>[].lock,
        DateTime.now(),
        GameStatus.started,
        0,
      );

  /// Creates a default initialized game where the first player is chosen at random
  factory GenericGame.startRandom(IList<Player> players) => GenericGame(
        players,
        <PlayerID>[].lock,
        DateTime.now(),
        GameStatus.started,
        0,
      );


  /// Gets whether the game is over
  bool get gameOver => status == GameStatus.finished;

  /// Gets whether the round is over
  bool get roundOver => status == GameStatus.betweenRounds;


  /// Returns a copy of the [GenericGame] with the time updated to the current time
  GenericGame updateTime() => copyWith(time: DateTime.now());

  /// Returns a copy of the [GenericGame] with the [round] incremented,
  /// [status] set to [GameStatus.started]
  GenericGame finishRound() =>
      copyWith(round: round + 1, status: GameStatus.started);

  /// Returns a copy of the [GenericGame] with the [status] updated to [status]
  GenericGame updateStatus(GameStatus status) => copyWith(status: status);

  /// Shuffles the player list, and resets the [currentPlayerIndex] to the first
  GenericGame shufflePlayers() => copyWith(players: players.shuffle());

  /// Clears the list of ready players
  GenericGame clearReadyPlayers() => copyWith(readyPlayers: <PlayerID>[].lock);

  /// Adds a ready player to the list
  GenericGame addReadyPlayer(PlayerID player) =>
      copyWith(readyPlayers: readyPlayers.add(player));
}

/// A [GenericEvent] that is handled by the Generic server implementation
/// rather than handling it differently in each game implementation
@freezed
class GenericEvent with _$GenericEvent implements Event {
  const GenericEvent._();

  /// Undo's the effects of the last event
  const factory GenericEvent.undo() = GenericEventUndo;

  /// Signals that [player] is ready for the next round
  const factory GenericEvent.readyNextRound(String player) =
      _GenericReadyNextRoundEvent;

  /// Sends a [message] from the player with id [from] to the player with id [to]
  const factory GenericEvent.message(
    String message, {
    required PlayerID from,
    required PlayerID? to,
  }) = GameMessage;

  factory GenericEvent.fromJson(Map<String, dynamic> map) =>
      _$GenericEventFromJson(map);
  @override
  String get type => 'GenericEvent';
}
