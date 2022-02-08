import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

export 'errors.dart';

part 'game.freezed.dart';
part 'game.g.dart';

class GameEventConverter implements JsonConverter<GameEvent, JsonMap> {
  const GameEventConverter();
  @override
  GameEvent fromJson(JsonMap json) => Game.gameEventFromJson(json);

  @override
  JsonMap toJson(GameEvent object) => object.toJson();
}

class GameStateConverter implements JsonConverter<GameState, JsonMap> {
  const GameStateConverter();
  @override
  GameState fromJson(JsonMap json) => Game.stateFromJson(json);

  @override
  JsonMap toJson(GameState object) => object.toJson();
}

/// An [Event] that represents either a [GenericEvent] or a user defined [Event]
/// for a partiular game
@freezed
class Event with _$Event {
  const Event._();

  /// Represents an [event] that is for a particlar [Game]
  const factory Event.game(@GameEventConverter() GameEvent event) = EventGame;

  /// Undo's the effects of the last event
  const factory Event.undo() = UndoEvent;

  /// Signals that [player] is ready for the next round
  const factory Event.readyNextRound(String player) = ReadyNextRoundEvent;

  /// Sends a [message] from the player with id [from] to the player with id [to]
  const factory Event.message(
    String message, {
    required PlayerID from,
    required PlayerID? to,
  }) = MessageEvent;

  factory Event.fromJson(JsonMap json) => _$EventFromJson(json);
}

@freezed
class Matrix with _$Matrix {
  const factory Matrix(List<List<Reward>> rewards) = _Matrix;
  factory Matrix.fromJson(JsonMap map) => _$MatrixFromJson(map);
}

@freezed
class JointAction with _$JointAction {
  const factory JointAction.twoPlayer({required int p1, required int p2}) = _JointAction;
  factory JointAction.fromJson(JsonMap map) => _$JointActionFromJson(map);
}

@freezed
class Reward with _$Reward {
  const factory Reward({required double p1, required double p2}) = _Reward;
  factory Reward.fromJson(JsonMap map) => _$RewardFromJson(map);
}

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
class Game with _$Game {
  const factory Game(
    IList<Player> players,
    IList<PlayerID> readyPlayers,
    IList<IList<double>> allRoundScores,
    DateTime time,
    IList<MessageEvent> messages,
    GameStatus status,
    int? currentPlayerIndex,
    int round,
    // ignore: avoid_positional_boolean_parameters
    bool isMultiPly,
    bool isSimultaneousAction,
    @GameStateConverter() GameState gameState,
  ) = _Game;
  const Game._();

  factory Game.fromJson(JsonMap map) => _$GameFromJson(map);

  /// Creates a default initialized game with [players]
  factory Game.start(
    IList<Player> players,
    GameState gameState, {
    required bool multiPly,
    required bool simultaneousAction,
  }) =>
      Game(players.toIList(), <PlayerID>[].lock, <IList<double>>[].lock, DateTime.now(), <MessageEvent>[].lock,
          GameStatus.Started, 0, 0, multiPly, simultaneousAction, gameState);

  /// Creates a default initialized game where the first player is chosen at random
  factory Game.startRandom(
    IList<Player> players,
    GameState gameState, {
    required bool multiPly,
    required bool simultaneousAction,
  }) =>
      Game(
        players,
        <PlayerID>[].lock,
        <IList<double>>[].lock,
        DateTime.now(),
        <MessageEvent>[].lock,
        GameStatus.Started,
        0,
        Random().nextInt(players.length),
        multiPly,
        simultaneousAction,
        gameState,
      );

  /// Gets the player at the [currentPlayerIndex]
  Player? get currentPlayer => currentPlayerIndex == null ? null : players[currentPlayerIndex!];

  /// Gets the total score for each player based off of [allRoundScores]
  IMap<PlayerID, double> get totalScores => playerRoundScores.mapValues((entry) => entry.value.sum);

  List<PlayerID> get playerIDs => players.map((player) => player.id).toList();

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

  /// Returns a copy of the [Game] with the next player in the player
  /// array as the current player
  Game nextPlayer() => copyWith(currentPlayerIndex: (currentPlayerIndex! + 1) % players.length);

  /// Returns a copy of the [Game] with the current player being the one
  /// with id [player]
  Game setNextPlayer(PlayerID player) => copyWith(currentPlayerIndex: players.indexWhere((p) => p.id == player));

  /// Returns a copy of the [Game] with the time updated to the current time
  Game updateTime() => copyWith(time: DateTime.now());

  /// Returns a copy of the [Game] with the [msg] added to [messages]
  Game addMessage(MessageEvent msg) => copyWith(
        messages: messages.add(msg),
      );

  /// Returns a copy of the [Game] with the [round] incremented,
  /// [status] set to [GameStatus.Started] and optionally the
  /// players' [scores] added to [allRoundScores]
  Game finishRound([Map<PlayerID, double>? scores]) => scores != null
      ? updateScores(scores).copyWith(
          round: round + 1,
          status: GameStatus.Started,
        )
      : copyWith(round: round + 1, status: GameStatus.Started);

  /// Returns a copy of the [Game] with the [scores] added to
  /// [allRoundScores]
  Game updateScores(Map<PlayerID, double> scores) =>
      copyWith(allRoundScores: allRoundScores.add(players.map((p) => scores[p.id]!).toIList()));

  /// Returns a copy of the [Game] with the [status] updated to [status]
  Game updateStatus(GameStatus status) => copyWith(status: status);

  /// Shuffles the player list, and resets the [currentPlayerIndex] to the first
  Game shufflePlayers() => copyWith(
        players: players.shuffle(),
        currentPlayerIndex: 0,
      );

  /// Clears the list of ready players
  Game clearReadyPlayers() => copyWith(readyPlayers: <PlayerID>[].lock);

  /// Adds a ready player to the list
  Game addReadyPlayer(PlayerID player) => copyWith(readyPlayers: readyPlayers.add(player));

  /// Returns the name game type that is registered for serialization
  // GameType get type;
  static bool _generalIsRegistered = false;

  /// Registers a game type with the server
  static void registerGameType<GS extends GameState, E extends GameEvent>(
    GameType type, {
    required String name,
    required GS Function(JsonMap) fromJson,
    required Game Function(GameConfig, IList<Player>) initialState,
    required E Function(JsonMap) gameEventFromJson,
  }) {
    if (!_generalIsRegistered) {
      _generalIsRegistered = true;
    }
    gameNames[type] = name;
    _fromJsonFactory[type] = fromJson;
    _eventFromJsonFactory[type] = gameEventFromJson;
    _initialStates[type] = initialState;
  }

  /// Converts the game from json to the particular type based on the type field
  static GameState stateFromJson(Object? obj) {
    final json = obj! as JsonMap;
    final fromJson = _fromJsonFactory[json['type']];
    if (fromJson == null) {
      throw UnimplementedError('No game of that type exists ${json['type']}');
    }
    return fromJson(json);
  }

  /// Will get the initial state for a particular configuration
  static Game getInitialState(GameConfig gameConfig, IList<Player> players) {
    final initState = _initialStates[gameConfig.gameType];
    if (initState == null) {
      throw UnimplementedError('No game of that type exists in the registry ${gameConfig.gameType}');
    }
    return initState(gameConfig, players);
  }

  /// Returns the game event translated from json
  static GameEvent gameEventFromJson(Object? obj) {
    final json = obj! as JsonMap;
    final fromJson = _eventFromJsonFactory[json['type']];
    if (fromJson == null) {
      throw UnimplementedError('No GameEvent of that type exists ${json['type']}');
    }
    return fromJson(json);
  }

  /// Some private fields to keep track of information about registered games

  /// Converts the game from json based on the type
  static final Map<GameType, GameState Function(JsonMap)> _fromJsonFactory = {};

  /// Converts the event from json to the event type
  static final Map<GameType, GameEvent Function(JsonMap)> _eventFromJsonFactory = {};

  /// Stores the user friendly name of the game based on the type
  static final Map<GameType, String> gameNames = {};

  /// Stores the function to create the initial state of the game
  static final Map<GameType, Game Function(GameConfig, IList<Player>)> _initialStates = {};
}

/// Represents the current status of the game as seen by the client
enum GameStatus {
  /// The client is waiting for the game to start
  Lobby,

  /// The game has started
  Started,

  /// The game is waiting for the clients to signal that they are ready for the
  /// next round before moving on
  BetweenRounds,

  /// The game is finished
  Finished,
}

/// Some general config parameters for a game of [gameType]
///
/// Custom options can be added to the [options] map, but must be in a json
/// compatible form
@freezed
class GameConfig with _$GameConfig {
  const factory GameConfig({
    required GameType gameType,
    PlayerID? adminID,
    @Default(NameSet.Basic) NameSet nameSet,
    @Default(false) bool customNames,
    @Default(15) int rounds,
    @Default(1) int minPlayers,
    @Default(10) int maxPlayers,
    @Default(true) bool autoStart,

    /// [options] must be json serializable
    JsonMap? options,
  }) = _GameConfig;
  factory GameConfig.fromJson(JsonMap map) => _$GameConfigFromJson(map);
}

/// An object to provide info about a particular game to the client
///
/// Includes
/// * The game's [gameId] on the server
/// * The game's [gameType]
/// * A list of [players] who are part of the game
/// * The [player]'s id in the game
/// * Whether the player is the [creator] of the game
@freezed
class GameInfo with _$GameInfo {
  const factory GameInfo({
    required GameCode gameId,
    required IList<PlayerGameName> players,
    required PlayerGameName player,
    required bool creator,
    required GameType gameType,
    required GameStatus status,
  }) = _GameInfo;
  factory GameInfo.fromJson(JsonMap map) => _$GameInfoFromJson(map);
}

@freezed
class Lobby with _$Lobby {
  const factory Lobby({
    required GameCode code,
    required ISet<Player> players,
    required GameConfig config,
    required GameStatus gameStatus,
  }) = _Lobby;
  factory Lobby.fromJson(JsonMap map) => _$LobbyFromJson(map);
}
