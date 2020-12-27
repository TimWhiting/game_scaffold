import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'events.dart';
import 'game.dart';
import 'player.dart';
part 'generic.freezed.dart';
part 'generic.g.dart';

/// Represents a generic game, with common fields that can be manipulated by
/// common [GenericEvent]s
///
/// Includes
/// * List of [players]
/// * A list of scores for all rounds [allRoundScores]
/// * The [time] of the last game update
/// * A list of [messages] that were sent
/// * The current [gameStatus]
/// * The [currentPlayerIndex]
/// * The current [round]
@freezed
abstract class GenericGame with _$GenericGame {
  const GenericGame._();
  const factory GenericGame(
    KtList<Player> players,
    KtList<KtList<double>> allRoundScores,
    DateTime time,
    KtList<GameMessage> messages,
    GameStatus gameStatus,
    int currentPlayerIndex,
    int round,
  ) = _GenericGame;
  factory GenericGame.fromJson(Map<String, dynamic> map) =>
      _$GenericGameFromJson(map);
  factory GenericGame.start(KtList<Player> players) => GenericGame(players,
      KtList.empty(), DateTime.now(), KtList.empty(), GameStatus.Started, 0, 0);
  factory GenericGame.startRandom(KtList<Player> players) => GenericGame(
        players,
        KtList.empty(),
        DateTime.now(),
        KtList.empty(),
        GameStatus.Started,
        0,
        Random().nextInt(players.size),
      );

  /// Gets the player at the [currentPlayerIndex]
  Player get currentPlayer => players[currentPlayerIndex];

  /// Gets the total score for each player based off of [allRoundScores]
  KtMap<String, double> get totalScores =>
      playerRoundScores.mapValues((entry) => entry.value.sum());

  /// Gets the scores for each player for all rounds based off of [allRoundScores]
  KtMap<String, KtList<double>> get playerRoundScores => KtMap.from({
        for (final p in 0.rangeTo(players.size - 1))
          players[p].id: allRoundScores.map((rs) => rs[p]),
      });

  /// Gets the scores for each round for each player based off of [allRoundScores]
  KtList<KtMap<String, double>> get roundPlayerScores =>
      allRoundScores.map((rs) => KtMap.from(
            {
              for (final i in 0.rangeTo(players.size - 1)) players[i].id: rs[i],
            },
          ));

  /// Gets whether the game is over
  bool get gameOver => gameStatus == GameStatus.Finished;

  /// Gets whether the round is over
  bool get roundOver => gameStatus == GameStatus.BetweenRounds;

  /// Returns a copy of the [GenericGame] with the next player in the player
  /// array as the current player
  GenericGame nextPlayer() =>
      copyWith(currentPlayerIndex: (currentPlayerIndex + 1) % players.size);

  /// Returns a copy of the [GenericGame] with the current player being the one
  /// with id [player]
  GenericGame setNextPlayer(String player) =>
      copyWith(currentPlayerIndex: players.indexOfFirst((p) => p.id == player));

  /// Returns a copy of the [GenericGame] with the time updated to the current time
  GenericGame updateTime() => copyWith(time: DateTime.now());

  /// Returns a copy of the [GenericGame] with the [msg] added to [messages]
  GenericGame addMessage(GameMessage msg) => copyWith(
        messages: messages.plusElement(msg),
      );

  /// Returns a copy of the [GenericGame] with the [round] incremented
  /// and the players' [scores] added to [allRoundScores]
  GenericGame finishRound(KtMap<String, double> scores) => copyWith(
        allRoundScores:
            allRoundScores.plusElement(players.map((p) => scores[p.id])),
        round: round + 1,
        gameStatus: GameStatus.Started,
      );

  /// Returns a copy of the [GenericGame] with the [gameStatus] updated to [status]
  GenericGame updateStatus(GameStatus status) => copyWith(gameStatus: status);
}

/// A [GenericEvent] that is handled by the Generic server implementation
/// rather than handling it differently in each game implementation
@freezed
abstract class GenericEvent with _$GenericEvent implements Event {
  const GenericEvent._();

  /// Undo's the effects of the last event
  const factory GenericEvent.undo() = _GenericEventUndo;

  /// Starts the game
  const factory GenericEvent.start() = _GenericEventStart;

  /// Signals that [player] is ready for the next round
  const factory GenericEvent.readyNextRound(String player) =
      _GenericReadyNextRoundEvent;

  /// Sends a [message] from the player with id [from] to the player with id [to]
  const factory GenericEvent.message(String message,
      {@required String from, @required @nullable String to}) = GameMessage;

  factory GenericEvent.fromJson(Map<String, dynamic> map) =>
      _$GenericEventFromJson(map);
  @override
  String get type => 'GenericEvent';
}
