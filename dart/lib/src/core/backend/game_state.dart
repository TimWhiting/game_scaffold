import 'dart:io';

import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:characters/characters.dart';
import '../core.dart';

/// Gets the home path based on the operating system, should only be used in server contexts
String get homeDir {
  if (Platform.isMacOS) {
    return Platform.environment['HOME']!;
  } else if (Platform.isLinux) {
    return Platform.environment['HOME']!;
  } else if (Platform.isWindows) {
    return Platform.environment['UserProfile']!;
  }
  return Platform.environment['HOME']!;
}

final agentBackendGame = Provider((ref) => BackendProvider(ref.read, '0000'));
final backendGameCodesProvider =
    StateProvider<IList<GameCode>>((ref) => <GameCode>[].lock);
final ProviderFamily<BackendProvider, GameCode>? backendGamesProvider =
    Provider.family<BackendProvider, GameCode>((ref, code) {
  final bp = BackendProvider(ref.read, code);
  ref.onDispose(() {
    if (ref.mounted) {
      bp.dispose();
    }
  });
  return bp;
});

class BackendProvider {
  BackendProvider(this.read, this.code) {
    Future.delayed(
        Duration(milliseconds: 10),
        () => read(backendGameCodesProvider).state =
            read(backendGameCodesProvider).state.add(code));
  }

  /// The game [code] that uniquely identifies the providers in this BackendProvider
  final GameCode code;
  final Reader read;
  late BackendGameReader backendReader = BackendGameReader(read, this);

  void dispose() {
    read(backendGameCodesProvider).state =
        read(backendGameCodesProvider).state.remove(code);
  }

  /// Provides the initial state of the game
  ///
  /// Creates based on config from [gameConfigProvider] and
  /// list of players from [playersProvider]
  late Provider<Game> initialStateProvider = Provider<Game>(_initialStateImpl);

  /// Provides the [GameStateNotifier] based on the [GameConfig] from [gameConfigProvider]
  late StateNotifierProvider<GameStateNotifier, Game?> gameStateProvider =
      StateNotifierProvider<GameStateNotifier, Game?>(_gameStateNotifier);

  /// Keeps track of the players involved in the game on the server (or on the client) in the case of a local game
  final playersProvider = StateProvider<IList<Player>>(
    (ref) => <Player>[].lock,
  );

  /// Keeps track
  final configProvider =
      StateProvider<GameConfig>((ref) => GameConfig(gameType: ''));

  /// Provides the [GameErrorNotifier] to keep track of errors of a game
  final errorProvider = StateNotifierProvider<GameErrorNotifier, GameError?>(
      (ref) => GameErrorNotifier());

  Game _initialStateImpl(ProviderReference ref) {
    final gameConfig = ref.watch(configProvider).state;
    final players = ref.watch(playersProvider).state;
    return Game.getInitialState(gameConfig, players, backendReader);
  }

  GameStateNotifier _gameStateNotifier(ProviderReference ref) {
    final gameConfig = ref.watch(configProvider).state;
    return GameStateNotifier(gameConfig, backendReader, code);
  }
}

/// A companion [StateNotifier] to the [GameStateNotifier] that keeps track of the most recent error, and lets the client clear the error
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

/// A [StateNotifier] that handles events for a particular game, delegating to the game's implementation for non generic events
class GameStateNotifier<E extends Event, T extends Game<E>>
    extends StateNotifier<T> {
  GameStateNotifier(this.gameConfig, this.read, this.code)
      : _gameStateLogger = Logger('GameStateNotifier $code'),
        super(read.initialState as T);
  final Logger _gameStateLogger;
  final BackendGameReader read;

  /// The [code] of this game
  final GameCode code;

  /// The [GameConfig] that was used to create this [GameStateNotifier]
  final GameConfig gameConfig;

  /// A list of previous states
  final List<T> _previousStates = [];

  /// Returns the [state] of the game
  ///
  /// Remember to watch / listen to the state of the [GameStateNotifier]
  /// rather than just watching changes in the notifier itself, otherwise changes
  /// in the [gameState] will not trigger updates of the ui
  T? get gameState => state;

  /// Handles a [GameEvent] and updates the state accordingly
  ///
  /// Delegates to the game implementation for a game specific event [E]
  ///
  /// In case of a [GenericEvent] this handles the implementation of handling the event
  void handleEvent(GameEvent event) {
    print('${event.toJson()}');
    try {
      _previousStates.add(state);
      final nextState = event.when(
        general: (e) => e.maybeWhen(
          undo: () {
            _previousStates.removeLast();
            return _previousStates.removeLast().gameValue();
          },
          start: () => read.initialState.gameValue(),
          readyNextRound: (e) {
            if (state.readyPlayers.length > 1) {
              _previousStates.remove(state);
            }
            var newState = state.copyWithGeneric((g) => g.addReadyPlayer(e));
            if (newState.readyPlayers.length == state.players.length) {
              return state
                  .moveNextRound(gameConfig, read)
                  .copyWithGeneric((g) => g.clearReadyPlayers())
                  .gameValue();
            }
            return newState.gameValue();
          },
          message: (_, __, ___) => state
              .copyWithGeneric(
                  (g) => g.addMessage(e as GameMessage).updateTime())
              .gameValue(),
          orElse: () =>
              GameError('General Event not implemented yet $e', 'programmer'),
        ),
        game: (e) => state.next(e as E, read),
      );
      if (nextState.isError) {
        read.gameError = nextState.error;
        _previousStates.removeLast();
      } else {
        state = nextState.value as T;
      }
    } catch (error, st) {
      _gameStateLogger.severe('$error $st');
    }
  }
}

extension BackendReader on Reader {
  BackendGameReader get agentGame =>
      BackendGameReader(this, this(agentBackendGame));
  BackendGameReader backendGame(GameCode code) =>
      BackendGameReader(this, this(backendGamesProvider!(code)));
}

class BackendGameReader {
  BackendGameReader(this.read, this.game);
  final Reader read;
  final BackendProvider game;

  T call<T>(RootProvider<Object, T> provider) => read(provider);
}

extension BackendReaderX on BackendGameReader {
  /// On the backend gets the list of [Player]s
  IList<Player> get players => this(game.playersProvider).state;

  /// On the  sets the players to [players]
  set players(IList<Player> players) =>
      this(game.playersProvider).state = players;

  /// On the  gets the [GameConfig]
  GameConfig get gameConfig => this(game.configProvider).state;

  /// On the  sets the [GameConfig]
  set gameConfig(GameConfig config) => this(game.configProvider).state = config;

  /// On the  gets the latest [GameError]
  GameError? get gameError => this(game.errorProvider);

  /// On the  sets the [GameError]
  set gameError(GameError? error) => errorNotifier.error = error;

  /// on the  clears the lastest game error
  void clearError() => errorNotifier.clearError();

  /// On the  gets the error notifier
  GameErrorNotifier get errorNotifier => this(game.errorProvider.notifier);

  /// On the  gets the latest [Game] state
  Game? get gameState => this(game.gameStateProvider);

  /// On the  gets the [GameStateNotifier]
  GameStateNotifier get gameNotifier => this(game.gameStateProvider.notifier);

  /// On the  handles [event]
  void handleEvent(GameEvent event) => gameNotifier.handleEvent(event);

  /// On the  gets the initial state for the [Game]
  ///
  /// It will create it based on the [PlayersProvider] and
  /// the [GameConfigProvider]
  Game get initialState => this(game.initialStateProvider);
}

GameCode generateGameID(List<String> avoidList) {
  var gameid = '';
  while (gameid.length != 4 || avoidList.contains(gameid)) {
    gameid = ('BCDFGHJKLMNPQRSTVWXZ'.characters.toList()..shuffle())
        .join('')
        .substring(0, 4);
  }
  return gameid;
}
