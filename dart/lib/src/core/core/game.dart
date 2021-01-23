import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../backend/game_state.dart';
import 'errors.dart';
import 'extensions.dart';
import 'events.dart';
import 'generic.dart';
import 'player.dart';
export 'package:dartx/dartx.dart';

export 'errors.dart';

part 'game.freezed.dart';
part 'game.g.dart';

/// Abstract class that all games must inherit from
abstract class Game<E extends Event> {
  Game();

  /// [generic] game holding some commonly used state
  GenericGame get generic;

  /// This method takes an event and returns the changed game state or an error
  ///
  /// Errors are typically for displaying on the UI why the particular player can't make that move.
  /// So make the error as informative as possible. This method should return a copy of the state if
  /// undo functionality needs to work. (i.e. the class should be immutable), for high performance you can
  /// make the changes and just return the changed instance itself, but undo functionality won't work.
  GameOrError next(E event, BackendGameReader backendReader);

  /// Copies the state of the game with generic replaced by the function applying updates to the most recent copy of generic
  ///
  /// This method should be implemented as follows for Games created with freezed and a field called generic:
  ///
  /// ```dart
  /// @override
  /// Game copyWithGeneric(GenericGame Function(GenericGame p1) updates) {
  ///  return copyWith(generic: updates(generic));
  ///}
  /// ```
  Game copyWithGeneric(GenericGame Function(GenericGame) updates);

  /// Logic to apply after all players have consented they want to play another round
  /// to initialize the next round
  Game moveNextRound(GameConfig config, BackendGameReader backendReader);

  /// Serializes the state for consumption by the frontend
  Map<String, dynamic> toJson();

  /// Returns the name game type that is registered for serialization
  String get type;

  /// Registers a game type with the server
  static void registerGameType<T extends Game, Q extends Game>(
    String type, {
    @required String name,
    @required Q Function(Map<String, dynamic>) fromJson,
    @required
        T Function(GameConfig, List<Player>, BackendGameReader) initialState,
    @required GameEvent Function(Map<String, dynamic>) gameEventFromJson,
    Q Function(T) toClientView,
  }) {
    gameNames[type] = name;
    _fromJsonFactory[type] = fromJson;
    _eventFromJsonFactory[type] = gameEventFromJson;
    _initialStates[type] = initialState;
    _toClientViews[type] = (toClientView as Game Function(Game)) ?? (g) => g;
  }

  /// Converts the game from json to the particular type based on the type field
  static Game fromJson(Map<String, dynamic> json) {
    final fromJson = _fromJsonFactory[json['type']];
    if (fromJson == null) {
      throw UnimplementedError('No game of that type exists ${json['type']}');
    }
    return fromJson(json);
  }

  /// Optionally converts the game from a full game state to a view of the game from the client's perspective
  static Game toClientView(Game g) => _toClientViews[g.type](g);

  /// Will get the initial state for a particular configuration
  static Game getInitialState(GameConfig gameConfig, List<Player> players,
      BackendGameReader backendReader) {
    final initState = _initialStates[gameConfig.gameType];
    if (initState == null) {
      throw UnimplementedError(
          'No game of that type exists in the registry ${gameConfig.gameType}');
    }
    return initState(gameConfig, players, backendReader);
  }

  /// Returns the game event translated from json
  static GameEvent gameEventFromJson(Map<String, dynamic> json) {
    final fromJson = _eventFromJsonFactory[json['type']];
    if (fromJson == null) {
      throw UnimplementedError(
          'No GameEvent of that type exists ${json['type']}');
    }
    return fromJson(json);
  }

  /// Registers the set of general events
  static void registerGeneralEvents() {
    _eventFromJsonFactory['GenericEvent'] =
        (Map<String, dynamic> j) => GenericEvent.fromJson(j).asGameEvent;
  }

  /// Some private fields to keep track of information about registered games

  /// Converts the game from json based on the type
  static final Map<String, Game Function(Map<String, dynamic>)>
      _fromJsonFactory = {};

  /// Converts the game to a potentially smaller form for sending over the wire
  static final Map<String, Game Function(Game)> _toClientViews = {};

  /// Converts the event from json to the event type
  static final Map<String, GameEvent Function(Map<String, dynamic>)>
      _eventFromJsonFactory = {};

  /// Stores the user friendly name of the game based on the type
  static final Map<String, String> gameNames = {};

  /// Stores the function to create the initial state of the game
  static final Map<String,
          Game Function(GameConfig, List<Player>, BackendGameReader)>
      _initialStates = {};
}

/// Represents the current status of the game as seen by the client
enum GameStatus {
  /// The client is not connected to the backend
  NotConnected,

  /// The client has not joined a game on the backend yet
  NotJoined,

  /// The client is waiting for the game to start
  NotStarted,

  /// The game has started
  Started,

  /// The game is finished
  Finished,

  /// The game is waiting for the clients to signal that they are ready for the
  /// next round before moving on
  BetweenRounds,
}

/// Some general config parameters for a game of [gameType]
///
/// Custom options can be added to the [options] map, but must be in a json
/// compatible form
@freezed
abstract class GameConfig with _$GameConfig {
  const factory GameConfig({
    String adminId,
    String gameType,
    @Default(NameSet.Basic) NameSet nameSet,
    @Default(false) bool customNames,
    @Default(15) int rounds,
    @Default(1) int minPlayers,
    @Default(10) int maxPlayers,
    @Default(true) bool autoStart,

    /// [options] must be json serializable
    Map<String, dynamic> options,
  }) = _GameConfig;
  factory GameConfig.fromJson(Map<String, dynamic> map) =>
      _$GameConfigFromJson(map);
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
abstract class GameInfo with _$GameInfo {
  const factory GameInfo(
    String gameId,
    List<String> players,
    String player,
    bool creator,
    String gameType,
  ) = _GameInfo;
  factory GameInfo.fromJson(Map<String, dynamic> map) =>
      _$GameInfoFromJson(map);
}
