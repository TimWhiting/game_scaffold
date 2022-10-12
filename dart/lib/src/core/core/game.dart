
import 'package:riverpod/riverpod.dart';

import 'core.dart';

typedef GameCode = String;
typedef GameType = String;


// ignore: avoid_classes_with_only_static_members
abstract class Game {
  static final Map<GameType, GameFunctions> _functions = {};

  static final Map<Type, GameType> _eventTypeMap = {};
  static final Map<Type, GameType> _gameTypeMap = {};
  static final Map<Type, GameType> _configTypeMap = {};

  static GameFunctions<T, E, C> fromType<T, E, C>(GameType type) => Game._functions[type]! as GameFunctions<T, E, C>;

  static void register<T, E, C>(GameFunctions<T,E,C> functions) {
    final type = functions.gameType;
    _functions[type] = functions;
    _gameTypeMap[T] = type;
    _eventTypeMap[E] = type;
    _configTypeMap[C] = type;
  }
}
extension GameTypeName on Type {
  GameFunctions<T, E, C> event<T, E, C>() => Game._functions[Game._eventTypeMap[this]]! as GameFunctions<T, E, C>;
  GameFunctions<T, E, C> game<T, E, C>() => Game._functions[Game._gameTypeMap[this]]! as GameFunctions<T, E, C>;
  GameFunctions<T, E, C> config<T, E, C>() => Game._functions[Game._configTypeMap[this]]! as GameFunctions<T, E, C>;
}

typedef GameEvent<T> = (T,);
extension GameEventX<T> on GameEvent<T> {
  Map<String, dynamic> toJson() => {
      'type': T.event().gameType,
      'data': T.event().toJsonE.call($0),
    };
}
// ignore: non_constant_identifier_names
GameEvent<T> GameEventFromJson<T>(Map<String, dynamic> json) => (Game.fromType(json['type'] as String).fromJsonE.call(json['data'] as JsonMap),);

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
typedef NextStateOrError<T> = ({GameState<T> state, GameError? error});
typedef NextState<T> = (T, Rewards?, GameStatus);
typedef GameName = String;

class GameState<T> {
  GameState({required this.gameType,required this.game,required this.rewards, required this.generic,required this.messages});

  final GameType gameType;
  final T game;
  final Rewards rewards;
  final GenericGame generic;
  final IList<GameMessage> messages;
}

class GameFunctions<T, E, C> {
  GameFunctions({required this.game,required this.state,required this.initialState, required this.toJson, required this.fromJson, required this.toJsonE,required this.fromJsonE,required this.toJsonC,required this.fromJsonC,required this.gameType, required this.gameName,});

  final GameStateFunctions<T, E, C> Function(T) game;
  final StateFunctions<T, E, C> Function(GameState<T>) state;
  final GameState<T> Function(GameConfig<C> config, IList<Player> players) initialState;
  final JsonMap Function(T) toJson;
  final T Function(JsonMap) fromJson;
  final JsonMap Function(E) toJsonE;
  final E Function(JsonMap) fromJsonE;
  final JsonMap Function(C) toJsonC;
  final C Function(JsonMap) fromJsonC;
  final GameType gameType;
  final GameName gameName;
}


typedef StateFunctions<T, E, C> = ({
  GameState<T> Function(GameConfig<C> config) nextRound,
});

typedef GameStateFunctions<T, E, C> = ({
  NextState<T> Function(E, GameConfig<C> config) next,
  String? Function(E, GameConfig<C>) error,
});


// ignore: non_constant_identifier_names
GameState<T> GameStateFromJson<T, E, C>(Map<String, dynamic> json) => 
  GameState(
    gameType: json['gameType'] as String,
    game: Game.fromType<T, E, C>(json['gameType'] as String).fromJson.call(json['data'] as JsonMap), 
    rewards: (json['rewards'] as List).cast<double>(), 
    generic: GenericGame.fromJson(json['generic'] as JsonMap), 
    messages: (json['messages'] as List).map((e) => GameMessage.fromJson(e as JsonMap)).toIList(),
  );

extension StateX<T> on GameState<T> {
  JsonMap toJson() => {
      'gameType': gameType,
      'game': T.game().toJson.call(game),
      'rewards': rewards,
      'generic': generic.toJson(),
      'messages': [for (final message in messages) message.toJson()],
    };

  GameState<T> updateReward(List<double> rewards) => GameState(gameType: gameType, game: game, messages: messages, generic: generic, rewards: rewards);

  GameState<T> updateGame(T game) => GameState(gameType: gameType, game: game, messages: messages, generic: generic, rewards: rewards);

  GameState<T> updateGeneric(GenericGame Function(GenericGame) update) => GameState(gameType: gameType, game: game, messages: messages, generic: update(generic), rewards: rewards);

  GameState<T> updateMessages(IList<GameMessage> Function(IList<GameMessage>) update) => GameState(gameType: gameType, game: game, messages: update(messages), generic: generic, rewards: rewards);

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

  NextStateOrError<T> next<E, C>(E event, GameConfig<C> config) {
    final functions = T.game<T, E, C>();
    final error = functions.game.call(game).error.call(event, config);
    if (error != null){
       return (state: this, error: (message: error, player: ''));
    }
    final next = functions.game.call(game).next.call(event, config);
    return (state: GameState(gameType: gameType, game: next.$0, rewards: next.$1 == null  ? rewards : next.$1! + rewards, generic: generic.updateStatus(next.$2).updateTime(), messages: messages), error: null);
  }

  NextStateOrError<T> nextRound<E, C>(GameConfig<C> config) {
    final functions = T.game<T, E, C>();
    final next = functions.state.call(this).nextRound.call(config);
    return (state: GameState(gameType: gameType, game: next.game, rewards: next.rewards, generic: next.generic.updateStatus(GameStatus.started).updateTime(), messages:next.messages), error: null);
  }
}

