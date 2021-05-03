import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_games/games.dart';

import 'package:game_scaffold_test/game_scaffold_test.dart';
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
      expect(initialState.players.length, 2);
      expect(initialState.board.every((s) => s == ''), true);

      tester.event(TicTacToeGameEvent(P1, 0), (game, error) {
        expect(game.board.every((s) => s == ''), false);
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
        expect(game.board[2], '');
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
      tester.nextRound((game) {
        expect(game.playerRoundScores[P1], [1]);
        expect(game.playerRoundScores[P2], [0]);
        expect(game.totalScores[P1], 1);
        expect(game.totalScores[P2], 0);
      });
    },
  );
}
