import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

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
/// * The current [status]
/// * The [currentPlayerIndex]
/// * The current [round]
@freezed
class GenericGame with _$GenericGame {
  const factory GenericGame(
    IList<Player> players,
    IList<PlayerID> readyPlayers,
    IList<IList<double>> allRoundScores,
    DateTime time,
    IList<GameMessage> messages,
    GameStatus status,
    int? currentPlayerIndex,
    int round,
    // ignore: avoid_positional_boolean_parameters
    bool isMultiPly,
    bool isSimultaneousAction,
  ) = _GenericGame;
  const GenericGame._();

  factory GenericGame.fromJson(Map<String, dynamic> map) => _$GenericGameFromJson(map);

  /// Creates a default initialized game with [players]
  factory GenericGame.start(
    IList<Player> players, {
    required bool multiPly,
    required bool simultaneousAction,
  }) =>
      GenericGame(
        players.toIList(),
        <PlayerID>[].lock,
        <IList<double>>[].lock,
        DateTime.now(),
        <GameMessage>[].lock,
        GameStatus.Started,
        0,
        0,
        multiPly,
        simultaneousAction,
      );

  /// Creates a default initialized game where the first player is chosen at random
  factory GenericGame.startRandom(
    IList<Player> players, {
    required bool multiPly,
    required bool simultaneousAction,
  }) =>
      GenericGame(
        players,
        <PlayerID>[].lock,
        <IList<double>>[].lock,
        DateTime.now(),
        <GameMessage>[].lock,
        GameStatus.Started,
        0,
        Random().nextInt(players.length),
        multiPly,
        simultaneousAction,
      );

  /// Gets the player at the [currentPlayerIndex]
  Player? get currentPlayer => currentPlayerIndex == null ? null : players[currentPlayerIndex!];

  /// Gets the total score for each player based off of [allRoundScores]
  IMap<PlayerID, double> get totalScores => playerRoundScores.mapValues((entry) => entry.value.sum);

  /// Gets the scores for each player for all rounds based off of [allRoundScores]
  IMap<PlayerID, IList<double>> get playerRoundScores => IMap({
        for (var p = 0; p < players.length; p++) players[p].id: IList(allRoundScores.map((rs) => rs[p])),
      });

  /// Gets the scores for each round for each player based off of [allRoundScores]
  IList<IMap<PlayerID, double>> get roundPlayerScores => IList(allRoundScores.map((rs) => IMap(
        {
          for (var i = 0; i < players.length; i++) players[i].id: rs[i],
        },
      )));

  /// Gets whether the game is over
  bool get gameOver => status == GameStatus.Finished;

  /// Gets whether the round is over
  bool get roundOver => status == GameStatus.BetweenRounds;

  /// Returns a copy of the [GenericGame] with the next player in the player
  /// array as the current player
  GenericGame nextPlayer() => copyWith(currentPlayerIndex: (currentPlayerIndex! + 1) % players.length);

  /// Returns a copy of the [GenericGame] with the current player being the one
  /// with id [player]
  GenericGame setNextPlayer(PlayerID player) => copyWith(currentPlayerIndex: players.indexWhere((p) => p.id == player));

  /// Returns a copy of the [GenericGame] with the time updated to the current time
  GenericGame updateTime() => copyWith(time: DateTime.now());

  /// Returns a copy of the [GenericGame] with the [msg] added to [messages]
  GenericGame addMessage(GameMessage msg) => copyWith(
        messages: messages.add(msg),
      );

  /// Returns a copy of the [GenericGame] with the [round] incremented,
  /// [status] set to [GameStatus.Started] and optionally the
  /// players' [scores] added to [allRoundScores]
  GenericGame finishRound([Map<PlayerID, double>? scores]) => scores != null
      ? updateScores(scores).copyWith(
          round: round + 1,
          status: GameStatus.Started,
        )
      : copyWith(round: round + 1, status: GameStatus.Started);

  /// Returns a copy of the [GenericGame] with the [scores] added to
  /// [allRoundScores]
  GenericGame updateScores(Map<PlayerID, double> scores) =>
      copyWith(allRoundScores: allRoundScores.add(players.map((p) => scores[p.id]!).toIList()));

  /// Returns a copy of the [GenericGame] with the [status] updated to [status]
  GenericGame updateStatus(GameStatus status) => copyWith(status: status);

  /// Shuffles the player list, and resets the [currentPlayerIndex] to the first
  GenericGame shufflePlayers() => copyWith(
        players: players.shuffle(),
        currentPlayerIndex: 0,
      );

  /// Clears the list of ready players
  GenericGame clearReadyPlayers() => copyWith(readyPlayers: <PlayerID>[].lock);

  /// Adds a ready player to the list
  GenericGame addReadyPlayer(PlayerID player) => copyWith(readyPlayers: readyPlayers.add(player));
}

/// A [GenericEvent] that is handled by the Generic server implementation
/// rather than handling it differently in each game implementation
@freezed
class GenericEvent with _$GenericEvent implements Event {
  const GenericEvent._();

  /// Undo's the effects of the last event
  const factory GenericEvent.undo() = GenericEventUndo;

  /// Signals that [player] is ready for the next round
  const factory GenericEvent.readyNextRound(String player) = _GenericReadyNextRoundEvent;

  /// Sends a [message] from the player with id [from] to the player with id [to]
  const factory GenericEvent.message(
    String message, {
    required PlayerID from,
    required PlayerID? to,
  }) = GameMessage;

  factory GenericEvent.fromJson(Map<String, dynamic> map) => _$GenericEventFromJson(map);
  @override
  String get type => 'GenericEvent';
}
