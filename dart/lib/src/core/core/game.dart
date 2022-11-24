// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_cast, avoid_annotating_with_dynamic

import 'package:riverpod/riverpod.dart';

import 'core.dart';

typedef GameCode = String;
typedef GameType = String;

abstract class Game<E extends Event, T extends Game<E,T>> {
  const Game();
  GameType get type;
  NextState<E,T> next(E event, GameConfig config);
  String? error(E event, GameConfig config);
  Map<String, Object?> toJson();
  GameState<E,T> nextRound(GameState<E,T> state, GameConfig config);
}

abstract class Event {
  const Event();
  GameType get type;
  Map<String, Object?> toJson();
}


// ignore: avoid_classes_with_only_static_members
abstract class GameRegistry {
  static final Map<GameType, GameFunctions> _functions = {};
  static GameFunctions _fromType(GameType type) => _functions[type]!;

  static void register<E extends Event, T extends Game<E, T>>(GameFunctions<E,T> functions) {
    final type = functions.gameType;
    _functions[type] = functions;
  }

  static T gameFromJson<E extends Event, T extends Game<E, T>>(JsonMap json) {
      final type = (json['game'] as JsonMap)['type']! as String;
      return _fromType(type).fromJson(json) as T;
    
  }
  static E eventFromJson<E>(JsonMap json) {
      final type = (json['game'] as JsonMap)['type']! as String;
      return _fromType(type).fromJsonE(json) as E;
  }

  static JsonMap toEventJson<E extends Event>(E event) => {
      'type': event.type,
      'data': event.toJson(),
    };
  static JsonMap toGameJson<E extends Event, T extends Game<E, T>>(T game) => {
      'type': game.type,
      'data': game.toJson(),
    };

  static String typeName(GameState state) => GameRegistry._functions[state.game.type]!.gameType;

  static GameState initialState(String gameType, GameConfig config, IList<Player> iList) => _fromType(gameType).initialState(config, iList);
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
typedef NextStateOrError<E extends Event, T extends Game<E, T>> = ({GameState<E, T> state, GameError? error});
typedef NextState<E extends Event, T extends Game<E, T>> = (T, Rewards?, GameStatus);
typedef GameName = String;
typedef PlayerEvent<E extends Event> = ({String playerId, E event});

class GameState<E extends Event, T extends Game<E, T>> {
  GameState({required this.game,required this.rewards, required this.generic});

  final T game;
  final Rewards rewards;
  final GenericGame generic;

   JsonMap toJson() => {
      'game': GameRegistry.toGameJson(game),
      'rewards': rewards,
      'generic': generic.toJson(),
    };

  GameState<E,T> updateReward(List<double> rewards) => copyWith(rewards: rewards);

  GameState<E,T> updateGame(T game) => copyWith(game: game);

  GameState<E,T> updateGeneric(GenericGame Function(GenericGame) update) => copyWith(generic: update(generic), rewards: rewards);

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

  NextStateOrError<E,T> next(PlayerEvent<E> event, GameConfig config) {
    final error = game.error(event.event, config);
    if (error != null){
       return (state: this, error: (message: error, player: event.playerId));
    }
    final next = game.next(event.event, config);
    return (state: copyWith( game: next.$0 as T, rewards: next.$1 == null  ? rewards : next.$1! + rewards, generic: generic.updateStatus(next.$2).updateTime()), error: null);
  }

  NextStateOrError<E,T> nextRound(GameConfig config) {
    final next = game.nextRound(this, config);
    return (state: next.copyWith(generic: next.generic.updateStatus(GameStatus.started).updateTime()) as GameState<E,T>, error: null);
  }

  GameState<E,T> copyWith({
    T? game,
    Rewards? rewards,
    GenericGame? generic,
  }) => GameState<E,T>(
      game: game ?? this.game,
      rewards: rewards ?? this.rewards,
      generic: generic ?? this.generic,
    );
}

class GameFunctions<E extends Event, T extends Game<E, T>> {
  GameFunctions({required this.initialState, required this.toJson, required this.fromJson, required this.toJsonE,required this.fromJsonE,required this.gameType, required this.gameName});
  final GameState<E,T> Function(GameConfig config, IList<Player> players) initialState;
  final JsonMap Function(T) toJson;
  final T Function(JsonMap) fromJson;
  final JsonMap Function(E) toJsonE;
  final E Function(JsonMap) fromJsonE;
  final GameType gameType;
  final GameName gameName;

  JsonMap toJsonEvent(covariant E event)=> toJsonE(event);

  JsonMap toJsonGame(covariant T event)=> toJson(event);
}


// ignore: non_constant_identifier_names
GameState<E,T> GameStateFromJson<E extends Event, T extends Game<E, T>>(Map<String, dynamic> json) => 
  GameState(
    game: GameRegistry.gameFromJson<E,T>(json), 
    rewards: (json['rewards'] as List).cast<double>(), 
    generic: GenericGame.fromJson(json['generic'] as JsonMap), 
  );

