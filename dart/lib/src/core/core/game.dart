// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_cast, avoid_annotating_with_dynamic

import 'package:riverpod/riverpod.dart';

import 'core.dart';

typedef GameCode = String;
typedef GameType = String;


// ignore: avoid_classes_with_only_static_members
abstract class Game {
  static final Map<GameType, GameFunctions> _functions = {};

  static final Map<Type, GameType> _eventTypeMap = {};
  static final Map<Type, GameType> _gameTypeMap = {};

  static GameFunctions _fromType(GameType type) => Game._functions[type]!;
  static GameFunctions _fromEvent(Object event) => Game._functions[_eventTypeMap[event.runtimeType]]!;
  static GameFunctions _fromGame(Object event) => Game._functions[_eventTypeMap[event.runtimeType]]!;

  static void register<T extends Object,E extends Object>(GameFunctions<T,E> functions) {
    final type = functions.gameType;
    _functions[type] = functions;
    _gameTypeMap[T] = type;
    _eventTypeMap[E] = type;
  }

  static T fromJson<T>(JsonMap json) {
    if (T == dynamic){
      final type = (json['game'] as JsonMap)['type']! as String;
      return _fromType(type).fromJson(json) as T;
    }
    return _functions[_gameTypeMap[T]!]!.fromJson(json) as T;
  }
  static E eventFromJson<E>(JsonMap json) {
    if (E == dynamic){
      final type = (json['game'] as JsonMap)['type']! as String;
      return _fromType(type).fromJsonE(json) as E;
    }
    return _functions[_eventTypeMap[E]!]!.fromJsonE(json) as E;
  }

  static JsonMap toEventJson<E extends Object>(E event) => {
      'type': _fromEvent(event).gameType,
      'data': _fromEvent(event).toJsonEvent(event),
    };
  static JsonMap toGameJson<T extends Object>(T game) => {
      'type': _fromGame(game).gameType,
      'data': _fromGame(game).toJsonGame(game),
    };

  static String typeName<T extends Object>(GameState<T> type) => _fromType(_gameTypeMap[type]!).gameType;

  static GameState<T> initialState<T extends Object>(String gameType, GameConfig config, IList<Player> iList) => _fromType(gameType).initialState(config, iList) as GameState<T>;
}

typedef GameError = ({String message, PlayerID player});
/// A error notifier that lets the client clear the error
class GameErrorNotifier extends StateNotifier<GameError?> {
  GameErrorNotifier() : super(null);

  /// Sets the error [state]
  set error(GameError? err) {
    state = err;
  }

  /// Gets the error that was set
  GameError? get error => state;

  /// Clears any error that was set
  void clearError() {
    state = null;
  }
}

typedef PlayerIndex = int;
typedef Rewards = List<double>;
typedef NextStateOrError<T extends Object> = ({GameState<T> state, GameError? error});
typedef NextState<T> = (T, Rewards?, GameStatus);
typedef GameName = String;

class GameState<T extends Object> {
  GameState({required this.game,required this.rewards, required this.generic,required this.messages});

  final T game;
  final Rewards rewards;
  final GenericGame generic;
  final IList<GameMessage> messages;

   JsonMap toJson() => {
      'game': Game.toGameJson(game),
      'rewards': rewards,
      'generic': generic.toJson(),
      'messages': [for (final message in messages) message.toJson()],
    };

  GameState<T> updateReward(List<double> rewards) => copyWith(rewards: rewards);

  GameState<T> updateGame(T game) => copyWith(game: game);

  GameState<T> updateGeneric(GenericGame Function(GenericGame) update) => copyWith( generic: update(generic), rewards: rewards);

  GameState<T> updateMessages(IList<GameMessage> Function(IList<GameMessage>) update) => copyWith(messages: update(messages));

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

  NextStateOrError<T> next<E extends Object>(E event, GameConfig config) {
    final functions = Game._fromGame(game);
    final error = functions.game(game).error.call(event, config);
    if (error != null){
       return (state: this, error: (message: error, player: ''));
    }
    final next = functions.game(game).next.call(event, config);
    return (state: copyWith( game: next.$0 as T, rewards: next.$1 == null  ? rewards : next.$1! + rewards, generic: generic.updateStatus(next.$2).updateTime()), error: null);
  }

  NextStateOrError<T> nextRound<E extends Object>(GameConfig config) {
    final functions = Game._fromGame(game);
    final next = functions.state(this).nextRound.call(config);
    return (state: next.copyWith(generic: next.generic.updateStatus(GameStatus.started).updateTime()) as GameState<T>, error: null);
  }

  GameState<T> copyWith({
    T? game,
    Rewards? rewards,
    GenericGame? generic,
    IList<GameMessage>? messages,
  }) => GameState<T>(
      game: game ?? this.game,
      rewards: rewards ?? this.rewards,
      generic: generic ?? this.generic,
      messages: messages ?? this.messages,
    );
}

class GameFunctions<T extends Object, E extends Object> {
  GameFunctions({required this.game,required this.state,required this.initialState, required this.toJson, required this.fromJson, required this.toJsonE,required this.fromJsonE,required this.gameType, required this.gameName,});

  final GameStateFunctions<T, E> Function(T) game;
  final StateFunctions<T, E> Function(GameState<T>) state;
  final GameState<T> Function(GameConfig config, IList<Player> players) initialState;
  final JsonMap Function(T) toJson;
  final T Function(JsonMap) fromJson;
  final JsonMap Function(E) toJsonE;
  final E Function(JsonMap) fromJsonE;
  final GameType gameType;
  final GameName gameName;

  JsonMap toJsonEvent(covariant E event)=> toJsonE(event);

  JsonMap toJsonGame(covariant T event)=> toJson(event);
  // GameFunctions<T1,E1> cast<T1,E1>() => GameFunctions<T1, E1>(
  //   fromJson: fromJson as T1 Function(JsonMap), 
  //   fromJsonE: fromJsonE as E1 Function(JsonMap), 
  //   game: game as GameStateFunctions<T1, E1> Function(T1), 
  //   initialState: initialState as GameState<T1> Function(GameConfig, IList<Player>), 
  //   toJson: toJson as JsonMap Function(T1), 
  //   toJsonE: toJsonE as JsonMap Function(E1), 
  //   state: state as StateFunctions<T1, E1> Function(GameState<T1>), 
  //   gameType: gameType, gameName: gameName);
}


class StateFunctions<T extends Object, E> {
  StateFunctions({required this.nextRound});

 final GameState<T> Function(GameConfig config) nextRound;
}

class GameStateFunctions<T, E> {
  GameStateFunctions({required this.next,required this.error});

  final NextState<T> Function(E, GameConfig config) next;
  final String? Function(E, GameConfig) error;
}


// ignore: non_constant_identifier_names
GameState<T> GameStateFromJson<T extends Object>(Map<String, dynamic> json) => 
  GameState(
    game: Game.fromJson<T>(json), 
    rewards: (json['rewards'] as List).cast<double>(), 
    generic: GenericGame.fromJson(json['generic'] as JsonMap), 
    messages: (json['messages'] as List).map((e) => GameMessage.fromJson(e as JsonMap)).toIList(),
  );

