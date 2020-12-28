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
    config: GameConfig(gameType: 'tictactoe', rounds: 3, customNames: false),
    players: [
      Player(P1),
      Player(P2),
    ],
    events: [
      null,
      TicTacToeGameEvent(P1, 0),
      TicTacToeGameEvent(P2, 0),
      TicTacToeGameEvent(P2, 1),
      TicTacToeGameEvent(P2, 2),
      TicTacToeGameEvent(P1, 3),
      TicTacToeGameEvent(P2, 2),
      TicTacToeGameEvent(P1, 6),
    ],
    expected: [
      (game, error) {
        expect(game.players.size, 2);
        expect(game.board.all((s) => s == null), true);
      },
      (game, error) {
        expect(game.board.all((s) => s == null), false);
        expect(game.board[0], P1);
      },
      (game, error) {
        expect(error, isNotNull);
        expect(game.board[0], P1);
      },
      (game, error) {
        expect(error, isNull);
        expect(game.board[1], P2);
      },
      (game, error) {
        expect(error, isNotNull);
        expect(game.board[2], null);
      },
      (game, error) {
        expect(error, isNull);
        expect(game.board[3], P1);
      },
      (game, error) {
        expect(error, isNull);
        expect(game.board[2], P2);
      },
      (game, error) {
        expect(error, isNull);
        expect(game.board[6], P1);
        expect(game.isWinner(P1), true);
        expect(game.isLoser(P2), true);
        expect(game.roundOver, true);
      },
    ],
  );
}
