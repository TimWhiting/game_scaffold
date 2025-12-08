import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

part 'generic.freezed.dart';
part 'generic.g.dart';

/// Represents a generic game, with common fields that can be manipulated by
/// common [GenericEvent]s
///
/// Includes
/// * List of [players]
/// * The [time] of the last game update
/// * The current [status]
/// * The current [round]
@freezed
sealed class GenericGame with _$GenericGame {
  const factory GenericGame({
    required DateTime time,
    required GameStatus status,
    required int round,
    @Default(IListConst([])) IList<Player> players,
    @Default(IListConst([])) IList<PlayerID> readyPlayers,
  }) = _GenericGame;
  const GenericGame._();

  factory GenericGame.fromJson(Map<String, dynamic> map) => _$GenericGameFromJson(map);

  /// Creates a default initialized game with [players]
  factory GenericGame.start(IList<Player> players) => GenericGame(
    players: players.toIList(),
    readyPlayers: <PlayerID>[].lock,
    time: DateTime.now(),
    status: GameStatus.started,
    round: 0,
  );

  /// Creates a default initialized game where the first player is chosen at random
  factory GenericGame.startRandom(IList<Player> players) => GenericGame(
    players: players,
    readyPlayers: <PlayerID>[].lock,
    time: DateTime.now(),
    status: GameStatus.started,
    round: 0,
  );

  /// Gets whether the game is over
  bool get gameOver => status == GameStatus.finished;

  /// Gets whether the round is over
  bool get roundOver => status == GameStatus.betweenRounds;

  /// Returns a copy of the [GenericGame] with the time updated to the current time
  GenericGame updateTime() => copyWith(time: DateTime.now());

  /// Returns a copy of the [GenericGame] with the [round] incremented,
  /// [status] set to [GameStatus.started]
  GenericGame finishRound() => copyWith(round: round + 1, status: GameStatus.started);

  /// Returns a copy of the [GenericGame] with the [status] updated to [status]
  GenericGame updateStatus(GameStatus status) => copyWith(status: status);

  /// Shuffles the player list, and resets the [currentPlayerIndex] to the first
  GenericGame shufflePlayers() => copyWith(players: players.shuffle());

  /// Clears the list of ready players
  GenericGame clearReadyPlayers() => copyWith(readyPlayers: <PlayerID>[].lock);

  /// Adds a ready player to the list
  GenericGame addReadyPlayer(PlayerID player) => copyWith(readyPlayers: readyPlayers.add(player));
}

/// A [GenericEvent] that is handled by the Generic server implementation
/// rather than handling it differently in each game implementation
@freezed
sealed class GenericEvent extends Event with _$GenericEvent {
  const GenericEvent._();

  /// Signals that [player] is ready for the next round
  const factory GenericEvent.readyNextRound(String player, {@Default('generic') String type}) =
      ReadyNextRound;

  factory GenericEvent.fromJson(Map<String, dynamic> map) => _$GenericEventFromJson(map);

  static void register() {
    GameRegistry.register(GameFunctionsGeneric());
  }
}

class GameFunctionsGeneric extends GameFunctions {
  @override
  Game fromJson(JsonMap json) => throw UnimplementedError();

  @override
  Event fromJsonE(JsonMap json) => GenericEvent.fromJson(json);

  @override
  GameName get gameName => 'Generic';

  @override
  GameType get gameType => 'generic';

  @override
  GameState<Event, Game> initialState(GameConfig config, IList<Player> players) =>
      throw UnimplementedError();

  @override
  NextState<Event, Game> next(
    covariant GameState<Event, Game> state,
    GameConfig config,
    covariant PlayerEvent<Event> event,
  ) => throw UnimplementedError();

  @override
  GameState<Event, Game> nextRound(covariant GameState<Event, Game> state, GameConfig config) =>
      throw UnimplementedError();
}

/// Represents the current status of the game as seen by the client
enum GameStatus {
  /// The client is waiting for the game to start
  lobby,

  /// The game has started
  started,

  /// The game is waiting for the clients to signal that they are ready for the
  /// next round before moving on
  betweenRounds,

  /// The game is finished
  finished,
}

/// Extension methods for [GameStatus] to query phase state and provide readable names.
///
/// These methods allow you to safely check the current game phase and understand
/// what operations are valid in each phase.
///
/// Example:
/// ```dart
/// if (gameState.status.canSendEvents) {
///   // Safe to send game events
/// }
/// ```
extension GamePhaseQueries on GameStatus {
  /// Whether events can be sent in this phase.
  ///
  /// Returns `true` for [started] and [betweenRounds] phases where players can
  /// perform actions. Returns `false` for [lobby] (game not started) and [finished]
  /// (game over).
  bool get canSendEvents => this == GameStatus.started || this == GameStatus.betweenRounds;

  /// Whether the game round is actively playing.
  ///
  /// Returns `true` only for [started] phase. Useful for rendering active game UI.
  bool get isPlaying => this == GameStatus.started;

  /// Whether we're waiting for player readiness between rounds.
  ///
  /// Returns `true` only for [betweenRounds] phase. Useful for showing "waiting for
  /// players" UI or displaying round results.
  bool get isWaitingForReady => this == GameStatus.betweenRounds;

  /// Whether the game has not started yet.
  ///
  /// Returns `true` only for [lobby] phase. Useful for showing lobby/join UI.
  bool get isLobby => this == GameStatus.lobby;

  /// Whether the game is over.
  ///
  /// Returns `true` only for [finished] phase. Useful for showing final results.
  bool get isFinished => this == GameStatus.finished;

  /// Human-readable name for this phase.
  ///
  /// Useful for logging, debugging, and user-facing messages:
  /// ```dart
  /// logger.info('Game phase: ${gameState.status.phaseName}');
  /// ```
  String get phaseName => switch (this) {
    GameStatus.lobby => 'Lobby',
    GameStatus.started => 'Playing',
    GameStatus.betweenRounds => 'Between Rounds',
    GameStatus.finished => 'Finished',
  };

  /// Description of what players should do in this phase.
  ///
  /// Useful for tooltips or help text in the UI.
  String get phaseDescription => switch (this) {
    GameStatus.lobby => 'Waiting for the game to start',
    GameStatus.started => 'Game is active - send moves or actions',
    GameStatus.betweenRounds => 'Round is over - signal readiness for next round',
    GameStatus.finished => 'Game is complete',
  };
}

/// Some general config parameters for a game of [gameType]
///
/// Custom options can be added to the [options] map, but must be in a json
/// compatible form
// @Freezed(genericArgumentFactories: true)
@freezed
sealed class GameConfig with _$GameConfig {
  const factory GameConfig({
    required GameType gameType,
    PlayerID? adminID,
    @Default(NameSet.basic) NameSet nameSet,
    @Default(false) bool customNames,
    @Default(15) int rounds,
    @Default(1) int minPlayers,
    @Default(20) int maxPlayers,
    @Default(true) bool autoStart,
    @Default({}) Map<String, Object?> options,
  }) = _GameConfig;
  const GameConfig._();
  factory GameConfig.fromJson(Map<String, Object?> map) => _$GameConfigFromJson(map);
}

/// An object to provide info about a particular game to the client
///
/// Includes
/// * The game's [gameID] on the server
/// * The game's [gameType]
/// * A list of [players] who are part of the game
/// * The [player]'s id in the game
/// * Whether the player is the [creator] of the game
@freezed
sealed class GameInfo with _$GameInfo {
  const factory GameInfo({
    required GameCode gameID,
    required IList<PlayerName> players,
    required PlayerName player,
    required bool creator,
    required GameConfig config,
    required GameStatus status,
  }) = _GameInfo;
  factory GameInfo.fromJson(Map<String, dynamic> map) => _$GameInfoFromJson(map);
}

@freezed
sealed class Lobby with _$Lobby {
  const factory Lobby({
    required GameCode code,
    required GameConfig config,
    required GameStatus gameStatus,
    @Default(ISetConst({})) ISet<Player> players,
  }) = _Lobby;
  factory Lobby.fromJson(Map<String, dynamic> map) => _$LobbyFromJson(map);
}
