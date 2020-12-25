import 'dart:io';

import 'package:kt_dart/kt.dart';
import 'package:riverpod/all.dart';
import 'clients/providers.dart';
import 'errors.dart';
import 'game.dart';

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

final serverPlayersProvider = StateProvider((ref) => listFrom(const [
      Player('1', name: 'John'),
      Player('2', name: 'Mary'),
    ]));
final gameInitialStateProvider = Provider<Game>((ref) {
  final gameConfig = ref.watch(gameConfigProvider).state;
  final players = ref.read(serverPlayersProvider).state;
  return Game.getInitialState(gameConfig, players, ref.read);
});

final gameProvider = StateNotifierProvider<GameStateNotifier>((ref) {
  final gameConfig = ref.watch(gameConfigProvider).state;

  return GameStateNotifier(gameConfig, ref.read);
});

final gameErrorProvider = StateNotifierProvider((ref) => GameErrorNotifier());

class GameErrorNotifier extends StateNotifier<GameError> {
  GameErrorNotifier() : super(null);
  set error(GameError err) {
    state = err;
  }

  GameError get error => state;
}

class GameStateNotifier<E extends Event, T extends Game<E>>
    extends StateNotifier<T> {
  GameStateNotifier(this.gameConfig, this.read) : super(null);
  final Reader read;
  final GameConfig gameConfig;
  final Set<String> readyPlayers = {};
  List<T> previousStates = [];

  T get gameState => state;
  void handleEvent(GameEvent event) {
    previousStates.add(state);
    final nextState = event.when(
      general: (e) => e.maybeWhen(
        undo: () {
          previousStates.removeLast();
          return GameOrError.game(previousStates.removeLast());
        },
        start: () => GameOrError.game(read(gameInitialStateProvider) as T),
        readyNextRound: (e) {
          if (readyPlayers.length > 1) {
            previousStates.remove(state);
          }
          readyPlayers.add(e);
          if (readyPlayers.length == state.players.size) {
            readyPlayers.clear();
            return GameOrError.game(state.moveNextRound(read) as T);
          }
          return GameOrError.game(state);
        },
        message: (_, __, ___) => GameOrError.game(state.copyWithGeneric(
            (g) => g.addMessage(e as GameMessage).updateTime()) as T),
        orElse: () => GameOrError.error(
            GameError('General Event not implemented yet $e', 'programmer')),
      ),
      game: (e) => state.next(e, read),
    );
    if (nextState.isError) {
      read(gameErrorProvider).error = nextState.error;
      previousStates.removeLast();
    } else {
      state = nextState.value;
    }
  }
}
