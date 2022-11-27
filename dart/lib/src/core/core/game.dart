// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_cast, avoid_annotating_with_dynamic

import 'package:riverpod/riverpod.dart';

import 'core.dart';

typedef GameCode = String;
typedef GameType = String;
typedef GameName = String;
typedef PlayerIndex = int;
typedef Rewards = List<double>;
typedef NextStateOrError<E extends Event, T extends Game> = ({GameState<E, T> state, GameError? error});
typedef NextState<E extends Event, T extends Game> = MaybeError<GameState<E,T>>;
typedef PlayerEvent<E extends Event> = ({String playerId, E event});

typedef MaybeError<T> = (T? value, String? error);
extension E<T> on MaybeError<T> {
  T get value => $0!;
  String get error => $1!;
  bool get hasError => $1 != null;
  bool get hasValue => $0 != null;
  X when<X>({required X Function(T) value, required X Function(T) error}) => hasError ? error($0 as T) : value($0 as T);
  MaybeError<X> map<X>(X Function(T) v) => $0 != null ? (v($0 as T), $1) : this as MaybeError<X>;
  MaybeError<T> mapError(String Function(String) e) =>  $1 != null ? ($0, e($1!)) : this;
}

extension V<T> on T {
  MaybeError<T> error(String err) => (this, err);
  MaybeError<T> get success => (this, null);
}

abstract class Game {
  const Game();
  GameType get type;
  bool get roundOver;
  bool gameOver(GenericGame g);
  Map<String, Object?> toJson();
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

  static void register<E extends Event, T extends Game>(GameFunctions<E,T> functions) {
    final type = functions.gameType;
    _functions[type] = functions;
  }

  static T gameFromJson<E extends Event, T extends Game>(JsonMap json) {
      final type = (json['game'] as JsonMap)['type']! as String;
      return _fromType(type).fromJson(json) as T;
  }

  static GameFunctions<E,T> functions<E extends Event, T extends Game>(GameType gameType) => _fromType(gameType) as GameFunctions<E,T>;

  static E eventFromJson<E>(JsonMap json) {
      final type = (json['event'] as JsonMap)['type']! as String;
      return _fromType(type).fromJsonE(json) as E;
  }

  static JsonMap toEventJson<E extends Event>(E event) => {
      'type': event.type,
      'data': event.toJson(),
    };
  static JsonMap toGameJson<E extends Event, T extends Game>(T game) => {
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

class GameState<E extends Event, T extends Game> {
  GameState({required this.game, required this.rewards, required this.generic});

  final T game;
  final Rewards rewards;
  final GenericGame generic;

   JsonMap toJson() => {
      'game': GameRegistry.toGameJson(game),
      'rewards': rewards,
      'generic': generic.toJson(),
    };

  GameState<E,T> updateReward(List<double> Function(List<double>) update) => copyWith(rewards: update(rewards));

  GameState<E,T> updateGame(T g) => copyWith(game: g);

  GameState<E,T> updateGeneric(GenericGame Function(GenericGame) update) => copyWith(generic: update(generic), rewards: rewards);

  GameState<E,T> addReward(List<double> rewards) => copyWith(rewards: rewards + this.rewards);

  GameState<E,T> updateStatus() => updateGeneric((g) => g.copyWith(status: game.roundOver ? GameStatus.betweenRounds : game.gameOver(g) ? GameStatus.finished : g.status));
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
    final next = GameRegistry.functions<E,T>(config.gameType).next(this, config, event.event);
    if (next.hasError){
     return (state: this, error: (message: next.error, player: event.playerId));
    }
    return (state: copyWith(game: next.value.game).updateStatus().updateGeneric((g) => g.copyWith(time: DateTime.now())), error: null);
  }

  NextStateOrError<E,T> nextRound(GameConfig config) {
    final next = GameRegistry.functions<E,T>(config.gameType).nextRound(this, config);
    return (state: next.copyWith(generic: next.generic.finishRound().updateTime()) as GameState<E,T>, error: null);
  }

  int nextPlayerIndex(int currentPlayer) => (currentPlayer + 1) % generic.players.length;
  Player playerFromIndex(int currentPlayer) => generic.players[currentPlayer];
  Player player(PlayerID id) => players.firstWhere((p) => p.id == id);

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

class GameFunctions<E extends Event, T extends Game> {
  GameFunctions({required this.initialState,required this.fromJson,required this.fromJsonE,required this.gameType, required this.gameName, required this.next, required this.nextRound,});
  final GameState<E,T> Function(GameConfig config, IList<Player> players) initialState;
  final NextState<E,T> Function(GameState<E,T> state, GameConfig config, E event) next;
  final GameState<E,T> Function(GameState<E,T> state, GameConfig config) nextRound;
  final T Function(JsonMap) fromJson;
  final E Function(JsonMap) fromJsonE;
  final GameType gameType;
  final GameName gameName;
}


// ignore: non_constant_identifier_names
GameState<E,T> GameStateFromJson<E extends Event, T extends Game>(Map<String, dynamic> json) => 
  GameState(
    game: GameRegistry.gameFromJson<E,T>(json), 
    rewards: (json['rewards'] as List).cast<double>(), 
    generic: GenericGame.fromJson(json['generic'] as JsonMap), 
  );

