A test package for `game_scaffold_dart`

Allows you an easy way to test games by a series of events and expected outcomes, without worrying about the setup / Riverpod / provider logic.


Example:
```dart
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_dart/games.dart';

import 'package:game_scaffold_test/test.dart';
import 'package:test/test.dart';

void main() {
  registerOnDeviceClients();
  Game.registerGeneralEvents();
  TicTacToeGame.register();

  testGame<TicTacToeGame>(
    'TicTacToe',
    config: GameConfig(
        gameType: 'tictactoe', rounds: 3, customNames: false, maxPlayers: 2),
    players: [
      Player(P1),
      Player(P2),
    ],
    test: (tester) {
      final initialState = tester.game;
      expect(initialState.players.size, 2);
      expect(initialState.board.all((s) => s == null), true);

      tester.event(TicTacToeGameEvent(P1, 0), (game, error) {
        expect(game.board.all((s) => s == null), false);
        expect(game.board[0], P1);
      });
      tester.event(TicTacToeGameEvent(P2, 0), (game, error) {
        expect(error, isNotNull);
        expect(game.board[0], P1);
      });
      tester.event(TicTacToeGameEvent(P2, 1), (game, error) {
        expect(error, isNull);
        expect(game.board[1], P2);
      });
      tester.event(TicTacToeGameEvent(P2, 2), (game, error) {
        expect(error, isNotNull);
        expect(game.board[2], null);
      });
      tester.event(TicTacToeGameEvent(P1, 3), (game, error) {
        expect(error, isNull);
        expect(game.board[3], P1);
      });
      tester.event(TicTacToeGameEvent(P2, 2), (game, error) {
        expect(error, isNull);
        expect(game.board[2], P2);
      });
      tester.event(TicTacToeGameEvent(P1, 6), (game, error) {
        expect(error, isNull);
        expect(game.board[6], P1);
        expect(game.isWinner(P1), true);
        expect(game.isLoser(P2), true);
        expect(game.roundOver, true);
      });
    },
  );
}
```