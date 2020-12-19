import 'package:kt_dart/kt.dart';
import 'package:riverpod/all.dart';
import 'errors.dart';
import 'game.dart';
import 'providers.dart';

final serverPlayersProvider = StateProvider((ref) => listFrom(const [
      Player(PlayerID('1'), name: 'John'),
      Player(PlayerID('2'), name: 'Mary'),
    ]));
final gameInitialStateProvider = Provider<Game>((ref) {
  final gameConfig = ref.watch(gameConfigProvider).state;
  final players = ref.read(serverPlayersProvider).state;
  return Game.initialState(gameConfig, players);
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

class GameStateNotifier<T extends Game> extends StateNotifier<T> {
  GameStateNotifier(this.gameConfig, this.read) : super(null);
  final Reader read;
  final GameConfig gameConfig;
  final Set<PlayerID> readyPlayers = {};
  List<T> previousStates = [];

  T get gameState => state;
  void handleEvent(GameEvent event) {
    previousStates.add(state);
    try {
      state = event.when(
        general: (e) => e.maybeWhen(
          undo: () {
            previousStates.removeLast();
            return previousStates.removeLast();
          },
          start: () => read(gameInitialStateProvider) as T,
          readyNextRound: (e) {
            if (readyPlayers.length > 1) {
              previousStates.remove(state);
            }
            readyPlayers.add(e);
            if (readyPlayers.length == state.players.size) {
              readyPlayers.clear();
              return state.moveNextRound(read) as T;
            }
            return state;
          },
          message: (_, __, ___) => state.next(event, read) as T,
          orElse: () => throw Exception('General Event not implemented yet $e'),
        ),
        game: (_) => state.next(event, read) as T,
      );
    } on GameError catch (err) {
      read(gameErrorProvider).error = err;
      previousStates.removeLast();
    } on Exception catch (err) {
      print(err.toString());
      previousStates.removeLast();
    }
  }
}
