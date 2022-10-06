import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

export 'errors.dart';

part 'game.freezed.dart';
part 'game.g.dart';

typedef GameCode = String;
typedef GameType = String;

// ignore: avoid_classes_with_only_static_members
/// Abstract class that all games must inherit from
abstract class Game {
  static bool _generalIsRegistered = false;

  /// Registers a game type with the server
  static void registerGameType<T extends Game, Q extends Game>(
    GameType type, {
    required String name,
    required Q Function(Map<String, dynamic>) fromJson,
    required T Function(GameConfig, IList<Player>) initialState,
    required GameEvent Function(Map<String, dynamic>) gameEventFromJson,
    Q Function(T)? toClientView,
  }) {
    if (!_generalIsRegistered) {
      _generalIsRegistered = true;
      _registerGeneralEvents();
    }
    gameNames[type] = name;
    _fromJsonFactory[type] = fromJson;
    _eventFromJsonFactory[type] = gameEventFromJson;
    _initialStates[type] = initialState;
    _toClientViews[type] = (toClientView as Game Function(Game)?) ?? (g) => g;
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
  static Game toClientView(Game g) => _toClientViews[g]!(g);

  /// Will get the initial state for a particular configuration
  static Game getInitialState(GameConfig gameConfig, IList<Player> players) {
    final initState = _initialStates[gameConfig.gameType];
    if (initState == null) {
      throw UnimplementedError(
          'No game of that type exists in the registry ${gameConfig.gameType}');
    }
    return initState(gameConfig, players);
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
  static void _registerGeneralEvents() {
    _eventFromJsonFactory['GenericEvent'] =
        (j) => GenericEvent.fromJson(j).asGameEvent;
  }

  /// Some private fields to keep track of information about registered games

  /// Converts the game from json based on the type
  static final Map<GameType, Game Function(Map<String, dynamic>)>
      _fromJsonFactory = {};

  /// Converts the game to a potentially smaller form for sending over the wire
  static final Map<GameType, Game Function(Game)> _toClientViews = {};

  /// Converts the event from json to the event type
  static final Map<GameType, GameEvent Function(Map<String, dynamic>)>
      _eventFromJsonFactory = {};

  /// Stores the user friendly name of the game based on the type
  static final Map<GameType, String> gameNames = {};

  /// Stores the function to create the initial state of the game
  static final Map<GameType, Game Function(GameConfig, IList<Player>)>
      _initialStates = {};
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

/// Some general config parameters for a game of [gameType]
///
/// Custom options can be added to the [options] map, but must be in a json
/// compatible form
@Freezed(genericArgumentFactories: true)
class GameConfig<T> with _$GameConfig<T> {
  const factory GameConfig({
    required GameType gameType,
    PlayerID? adminID,
    @Default(NameSet.Basic) NameSet nameSet,
    @Default(false) bool customNames,
    @Default(15) int rounds,
    @Default(1) int minPlayers,
    @Default(10) int maxPlayers,
    @Default(true) bool autoStart,
    T? options,
  }) = _GameConfig;
  const GameConfig._();
  factory GameConfig.fromJson(
          Map<String, Object?> map,
          // ignore: avoid_annotating_with_dynamic
          T Function(Object?) fromJsonT) =>
      _$GameConfigFromJson(map, fromJsonT);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      super.toJson(toJsonT);
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
class GameInfo with _$GameInfo {
  const factory GameInfo({
    required GameCode gameID,
    required IList<PlayerName> players,
    required PlayerName player,
    required bool creator,
    required GameType gameType,
    required GameStatus status,
  }) = _GameInfo;
  factory GameInfo.fromJson(Map<String, dynamic> map) =>
      _$GameInfoFromJson(map);
}

@freezed
class Lobby with _$Lobby {
  const factory Lobby({
    required GameCode code,
    required ISet<Player> players,
    required GameConfig config,
    required GameStatus gameStatus,
  }) = _Lobby;
  factory Lobby.fromJson(Map<String, dynamic> map) => _$LobbyFromJson(map);
}
