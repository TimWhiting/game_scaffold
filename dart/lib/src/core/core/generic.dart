
import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

part 'generic.freezed.dart';
part 'generic.g.dart';

typedef JsonMap = Map<String, Object?>;
typedef PlayerIndex = int;
typedef Rewards = List<double>;
typedef State<T> = ({T game, Rewards rewards, GenericGame generic, IList<GameMessage> messages});
typedef NextStateOrError<T> = ({State<T> state, GameError? error});
typedef GameError = ({String message, PlayerID player});
typedef NextState<T> = (T, Rewards?, GameStatus);
typedef GameFunctions<T, E> = ({
  GameStateFunctions<T, E> Function(T) game,
  State<T> Function(GameConfig config, IList<PlayerID> players) initialState,
  JsonMap Function(T) toJson,
  T Function(JsonMap) fromJson,
  JsonMap Function(E) toJsonE,
  E Function(JsonMap) fromJsonE,
});
typedef GameStateFunctions<T, E> = ({
  NextState<T> Function(E, GameConfig config) next,
  T Function(GameConfig config) nextRound,
  String? Function(E, GameConfig) error,
});


extension AddRewards on List<double> {
  // ignore: unused_element
  List<double> operator +(List<double> other) => [for (var i = 0; i < length; i++) this[i] + other[i]];
}

extension StateX<T> on State<T> {
  State<T> updateReward(List<double> rewards) => (game: game, messages: messages, generic: generic, rewards: rewards);

  State<T> updateGame(T game) => (game: game, messages: messages, generic: generic, rewards: rewards);

  State<T> updateGeneric(GenericGame Function(GenericGame) update) => (game: game, messages: messages, generic: update(generic), rewards: rewards);

  State<T> updateMessages(IList<GameMessage> Function(IList<GameMessage>) update) => (game: game, messages: update(messages), generic: generic, rewards: rewards);

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

  NextStateOrError<T> next<E>(E event, GameConfig config) {
    final functions = Game.functions[T] as GameFunctions<T, E>;
    final error = functions.game(game).error(event, config);
    if (error != null){
       return (state: this, error: (message: error, player: ''));
    }
    final next = functions.game(game).next(event, config);
    return (state: (game: next.$0, rewards: next.$1 == null  ? rewards : next.$1! + rewards, generic: generic.updateStatus(next.$2).updateTime(), messages: messages), error: null);
  }

  NextStateOrError<T> nextRound<E>(GameConfig config) {
    final functions = Game.functions[T] as GameFunctions<T, E>;
    final next = functions.game(game).nextRound(config);
    return (state: (game: next, rewards: rewards, generic: generic.updateStatus(GameStatus.started).updateTime(), messages: messages), error: null);
  }
}


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
