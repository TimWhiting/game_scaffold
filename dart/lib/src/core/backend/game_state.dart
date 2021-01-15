import 'dart:io';

import 'package:kt_dart/kt.dart';
import 'package:riverpod/all.dart';
import '../core.dart';

/// Gets the home path based on the operating system, should only be used in server contexts
String get homeDir {
  if (Platform.isMacOS) {
    return Platform.environment['HOME'];
  } else if (Platform.isLinux) {
    return Platform.environment['HOME'];
  } else if (Platform.isWindows) {
    return Platform.environment['UserProfile'];
  }
  return Platform.environment['HOME'];
}

final agentBackendGame = Provider((ref) => BackendProvider(ref.read, '0000'));
final backendGameCodesProvider =
    StateProvider<KtList<String>>((ref) => listOf());
final backendGamesProvider =
    Provider.family<BackendProvider, String>((ref, code) {
  final bp = BackendProvider(ref.read, code);
  ref.onDispose(bp.dispose);
  return bp;
});

class BackendProvider {
  BackendProvider(this.read, this.code) {
    Future.delayed(
        10.milliseconds,
        () => read(backendGameCodesProvider).state =
            read(backendGameCodesProvider).state.plusElement(code));
    initialStateProvider = Provider<Game>(_initialStateImpl);
    gameStateProvider =
        StateNotifierProvider<GameStateNotifier>(_gameStateNotifier);
  }

  /// The game [code] that uniquely identifies the providers in this BackendProvider
  final String code;
  final Reader read;

  void dispose() {
    read(backendGameCodesProvider).state =
        read(backendGameCodesProvider).state.minusElement(code);
  }

  /// Provides the initial state of the game
  ///
  /// Creates based on config from [gameConfigProvider] and
  /// list of players from [playersProvider]
  Provider<Game> initialStateProvider;

  /// Provides the [GameStateNotifier] based on the [GameConfig] from [gameConfigProvider]
  StateNotifierProvider<GameStateNotifier> gameStateProvider;

  /// Keeps track of the players involved in the game on the server (or on the client) in the case of a local game
  final playersProvider = StateProvider<KtList<Player>>(
    (ref) => listFrom([]),
  );

  /// Keeps track
  final configProvider = StateProvider<GameConfig>((ref) => null);

  /// Provides the [GameErrorNotifier] to keep track of errors of a game
  final errorProvider = StateNotifierProvider((ref) => GameErrorNotifier());

  Game _initialStateImpl(ProviderReference ref) {
    final gameConfig = ref.watch(configProvider).state;
    final players = ref.watch(playersProvider).state;
    return Game.getInitialState(
        gameConfig, players, ref.read.backendGame(code));
  }

  GameStateNotifier _gameStateNotifier(ProviderReference ref) {
    final gameConfig = ref.watch(configProvider).state;
    return GameStateNotifier(gameConfig, ref.read, code);
  }
}

/// A companion [StateNotifier] to the [GameStateNotifier] that keeps track of the most recent error, and lets the client clear the error
class GameErrorNotifier extends StateNotifier<GameError> {
  GameErrorNotifier() : super(null);

  /// Sets the error [state]
  set error(GameError err) {
    state = err;
  }

  /// Gets the error that was set
  GameError get error => state;

  /// Clears any error that was set
  void clearError() {
    state = null;
  }
}

/// A [StateNotifier] that handles events for a particular game, delegating to the game's implementation for non generic events
class GameStateNotifier<E extends Event, T extends Game<E>>
    extends StateNotifier<T> {
  GameStateNotifier(this.gameConfig, this.read, this.code) : super(null);
  final Reader read;

  /// The [code] of this game
  final String code;

  /// The [GameConfig] that was used to create this [GameStateNotifier]
  final GameConfig gameConfig;

  /// The players that are ready for the next round
  final Set<String> _readyPlayers = {};

  /// A list of previous states
  final List<T> _previousStates = [];

  /// Returns the [state] of the game
  ///
  /// Remember to watch / listen to the state of the [GameStateNotifier]
  /// rather than just watching changes in the notifier itself, otherwise changes
  /// in the [gameState] will not trigger updates of the ui
  T get gameState => state;

  BackendGameReader get backend => read.backendGame(code);

  /// Handles a [GameEvent] and updates the state accordingly
  ///
  /// Delegates to the game implementation for a game specific event [E]
  ///
  /// In case of a [GenericEvent] this handles the implementation of handling the event
  void handleEvent(GameEvent event) {
    _previousStates.add(state);
    final nextState = event.when(
      general: (e) => e.maybeWhen(
        undo: () {
          _previousStates.removeLast();
          return _previousStates.removeLast().gameValue();
        },
        start: () => backend.initialState.gameValue(),
        readyNextRound: (e) {
          if (_readyPlayers.length > 1) {
            _previousStates.remove(state);
          }
          _readyPlayers.add(e);
          if (_readyPlayers.length == state.players.size) {
            _readyPlayers.clear();
            return state.moveNextRound(gameConfig, backend).gameValue();
          }
          return state.gameValue();
        },
        message: (_, __, ___) => state
            .copyWithGeneric((g) => g.addMessage(e as GameMessage).updateTime())
            .gameValue(),
        orElse: () =>
            GameError('General Event not implemented yet $e', 'programmer'),
      ),
      game: (e) => state.next(e, backend),
    );
    if (nextState.isError) {
      backend.gameError = nextState.error;
      _previousStates.removeLast();
    } else {
      state = nextState.value;
    }
  }
}

extension BackendReader on Reader {
  BackendGameReader get agentGame =>
      BackendGameReader(this, this(agentBackendGame));
  BackendGameReader backendGame(String code) =>
      BackendGameReader(this, this(backendGamesProvider(code)));
}

class BackendGameReader {
  BackendGameReader(this.read, this.game);
  final Reader read;
  final BackendProvider game;

  T call<T>(RootProvider<Object, T> provider) => read(provider);
}

extension BackendReaderX on BackendGameReader {
  /// On the backend gets the list of [Player]s
  KtList<Player> get players => this(game.playersProvider).state;

  /// On the  sets the players to [players]
  set players(KtList<Player> players) =>
      this(game.playersProvider).state = players;

  /// On the  gets the [GameConfig]
  GameConfig get gameConfig => this(game.configProvider).state;

  /// On the  sets the [GameConfig]
  set gameConfig(GameConfig config) => this(game.configProvider).state = config;

  /// On the  gets the latest [GameError]
  GameError get gameError => this(game.errorProvider.state);

  /// On the  sets the [GameError]
  set gameError(GameError error) => errorNotifier.error = error;

  /// on the  clears the lastest game error
  void clearError() => errorNotifier.clearError();

  /// On the  gets the error notifier
  GameErrorNotifier get errorNotifier => this(game.errorProvider);

  /// On the  gets the latest [Game] state
  Game get gameState => this(game.gameStateProvider.state);

  /// On the  gets the [GameStateNotifier]
  GameStateNotifier get gameNotifier => this(game.gameStateProvider);

  /// On the  handles [event]
  void handleEvent(GameEvent event) => gameNotifier.handleEvent(event);

  /// On the  gets the initial state for the [Game]
  ///
  /// It will create it based on the [PlayersProvider] and
  /// the [GameConfigProvider]
  Game get initialState => this(game.initialStateProvider);
}

String generateGameID(List<String> avoidList) {
  var gameid = '';
  while (gameid.length != 4 || avoidList.contains(gameid)) {
    gameid =
        'BCDFGHJKLMNPQRSTVWXZ'.characters.shuffled().join('').substring(0, 4);
  }
  return gameid;
}
