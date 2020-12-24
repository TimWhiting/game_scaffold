import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kt_dart/kt.dart' hide nullable;
import 'package:riverpod/all.dart';

import 'errors.dart';

export 'package:dartx/dartx.dart';
export 'package:kt_dart/kt.dart' hide nullable;

export 'errors.dart';

part 'game.freezed.dart';
part 'game.g.dart';

enum GameStatus {
  NotConnected,
  NotJoined,
  NotStarted,
  Started,
  Finished,
  BetweenRounds,
}

enum NameSet { Basic }
final Map<NameSet, List<String>> nameSets = {
  NameSet.Basic: ['Bob', 'Jo', 'Jane', 'Luis', 'Martin', 'Cobb', 'Dora'],
};

@freezed
abstract class Player with _$Player {
  const factory Player(String id, {@Default('') String name}) = _Player;
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

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
      Random().nextInt(players.size));

  Player get currentPlayer => players[currentPlayerIndex];

  KtMap<String, double> get totalScores =>
      playerRoundScores.mapValues((entry) => entry.value.sum());
  KtMap<String, KtList<double>> get playerRoundScores => KtMap.from({
        for (final p in 0.rangeTo(players.size - 1))
          players[p].id: allRoundScores.map((rs) => rs[p]),
      });
  KtList<KtMap<String, double>> get roundPlayerScores =>
      allRoundScores.map((rs) => KtMap.from(
            {
              for (final i in 0.rangeTo(players.size - 1)) players[i].id: rs[i],
            },
          ));
  bool get gameOver => gameStatus == GameStatus.Finished;
  bool get roundOver => gameStatus == GameStatus.BetweenRounds;

  GenericGame nextPlayer() =>
      copyWith(currentPlayerIndex: (currentPlayerIndex + 1) % players.size);
  GenericGame setNextPlayer(String player) =>
      copyWith(currentPlayerIndex: players.indexOfFirst((p) => p.id == player));
  GenericGame updateTime() => copyWith(time: DateTime.now());
  GenericGame addMessage(GameMessage msg) => copyWith(
        messages: messages.plusElement(msg),
      );
  GenericGame finishRound(KtMap<String, double> scores) => copyWith(
        allRoundScores:
            allRoundScores.plusElement(players.map((p) => scores[p.id])),
        round: round + 1,
      );
  GenericGame updateStatus(GameStatus status) => copyWith(gameStatus: status);
}

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
  GameOrError next(E event, Reader read);

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
  Game moveNextRound(Reader read);

  /// Serializes the state for consumption by the frontend
  Map<String, dynamic> toJson();

  /// Returns the name game type that is registered for serialization
  String get type;

  /// Converts the game from json to the particular type based on the type field
  static Game fromJson(Map<String, dynamic> json) {
    final fromJson = fromJsonFactory[json['type']];
    if (fromJson == null) {
      throw UnimplementedError('No game of that type exists ${json['type']}');
    }
    return fromJson(json);
  }

  static Map<String, Game Function(Map<String, dynamic>)> fromJsonFactory = {};
  static Map<String, GameEvent Function(Map<String, dynamic>)>
      eventFromJsonFactory = {};
  static Map<String, String> gameNames = {};
  static Map<String, Game Function(GameConfig, KtList<Player>, Reader)>
      initialStates = {};

  /// Registers a game type with the server
  static void registerGameType<T extends Game>(
    String type, {
    @required String name,
    @required T Function(Map<String, dynamic>) fromJson,
    @required T Function(GameConfig, KtList<Player>, Reader read) initialState,
    @required GameEvent Function(Map<String, dynamic>) gameEventFromJson,
  }) {
    fromJsonFactory[type] = fromJson;
    gameNames[type] = name;
    eventFromJsonFactory[type] = gameEventFromJson;
    initialStates[type] = initialState;
  }

  /// Will get the initial state for a particular configuration
  static Game getInitialState(
      GameConfig gameConfig, KtList<Player> players, Reader read) {
    final initState = initialStates[gameConfig.gameType];
    if (initState == null) {
      throw UnimplementedError(
          'No game of that type exists in the registry ${gameConfig.gameType}');
    }
    return initState(gameConfig, players, read);
  }

  /// Returns the game event translated from json
  static GameEvent gameEventFromJson(Map<String, dynamic> json) {
    final fromJson = eventFromJsonFactory[json['type']];
    if (fromJson == null) {
      throw UnimplementedError(
          'No GameEvent of that type exists ${json['type']}');
    }
    return fromJson(json);
  }

  /// Registers the set of general events
  static void registerGeneralEvents() {
    eventFromJsonFactory['GeneralEvent'] =
        (Map<String, dynamic> j) => GeneralEvent.fromJson(j).asGameEvent;
  }
}

extension GameX on Game {
  Player get currentPlayer => generic.currentPlayer;
  KtList<Player> get players => generic.players;
  DateTime get time => generic.time;
  KtList<GameMessage> get messages => generic.messages;
  GameStatus get gameStatus => generic.gameStatus;
  int get currentPlayerIndex => generic.currentPlayerIndex;
  int get round => generic.round;
  KtMap<String, double> get totalScores => generic.totalScores;
  KtMap<String, KtList<double>> get playerRoundScores =>
      generic.playerRoundScores;
  KtList<KtMap<String, double>> get roundPlayerScores =>
      generic.roundPlayerScores;
  bool get gameOver => generic.gameOver;
  bool get roundOver => generic.roundOver;
}

abstract class Event {
  Map<String, dynamic> toJson();
  String get type;
}

extension EventX on Event {
  GameEvent get asGameEvent => this is GameEvent
      ? this
      : this is GeneralEvent
          ? GameEvent.general(this)
          : GameEvent.game(this);
}

// typedef String = String;
const String P1 = '0';
const String P2 = '1';

@freezed
abstract class GameEvent with _$GameEvent implements Event {
  const GameEvent._();
  const factory GameEvent.game(Event event) = _GameEventGame;
  const factory GameEvent.general(GeneralEvent event) = _GameEventGeneral;
  @override
  String get type => when(game: (_) => 'game', general: (_) => 'general');
  @override
  Map<String, dynamic> toJson() => when(
      game: (g) => g.toJson()..['type'] = g.type,
      general: (g) => g.toJson()..['type'] = g.type);
}

@freezed
abstract class GeneralEvent with _$GeneralEvent implements Event {
  const GeneralEvent._();
  const factory GeneralEvent.undo() = _GeneralEventUndo;
  const factory GeneralEvent.start() = _GeneralEventStart;
  const factory GeneralEvent.readyNextRound(String player) =
      _GeneralReadyNextRoundEvent;
  const factory GeneralEvent.message(String message,
      {@required String from, @required @nullable String to}) = GameMessage;

  factory GeneralEvent.fromJson(Map<String, dynamic> map) =>
      _$GeneralEventFromJson(map);
  @override
  String get type => 'GeneralEvent';
}

@freezed
abstract class GameConfig with _$GameConfig {
  const factory GameConfig({
    NameSet nameSet,
    @Default(false) bool customNames,
    String adminId,
    String gameType,
    @Default(15) int rounds,

    /// [options must be json serializable]
    Map<String, dynamic> options,
  }) = _GameConfig;
  factory GameConfig.fromJson(Map<String, dynamic> map) =>
      _$GameConfigFromJson(map);
}

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

extension GameTypeOf on String {
  String get name => Game.gameNames[this];
}
