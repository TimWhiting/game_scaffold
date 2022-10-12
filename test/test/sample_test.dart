import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_games/games.dart';

import 'package:game_scaffold_test/game_scaffold_test.dart';
import 'package:test/test.dart';

void main() {
  registerTicTacToe();

  testGame<TicTacToeGame>(
    'TicTacToe',
    config: const GameConfig(
        gameType: 'tictactoe', rounds: 3, customNames: false, maxPlayers: 2),
    players: [
      const Player('0'),
      const Player('1'),
    ],
    test: (tester) async {
      final initialState = tester.game;
      expect(initialState.players.length, 2);
      expect(initialState.game.board.every((s) => s == null), true);

      tester.event(((player: 0, location: 0), ), (game, error) {
        expect(game.game.board.every((s) => s == null), false);
        expect(game.game.board[0], 0);
      });
      tester.event(((player: 1, location: 0), ), (game, error) {
        expect(error, isNotNull);
        expect(game.game.board[0], 0);
      });
      tester.event(((player: 1, location: 1), ), (game, error) {
        expect(error, isNull);
        expect(game.game.board[1], 1);
      });
      tester.event(((player: 1, location: 2), ), (game, error) {
        expect(error, isNotNull);
        expect(game.game.board[2], null);
      });
      tester.event(((player: 0, location: 3), ), (game, error) {
        expect(error, isNull);
        expect(game.game.board[3], 0);
      });
      tester.event(((player: 1, location: 2), ), (game, error) {
        expect(error, isNull);
        expect(game.game.board[2], 1);
      });
      tester.event(((player: 0, location: 6), ), (game, error) {
        expect(error, isNull);
        expect(game.game.board[6], 0);
        expect(game.game.isWinner(0), true);
        expect(game.game.isLoser(1), true);
        expect(game.roundOver, true);
      });
      tester.nextRound((game) {
        // expect(game.playerRoundScores[0], [1]);
        // expect(game.playerRoundScores[P2], [0]);
        // expect(game.totalScores[0], 1);
        // expect(game.totalScores[P2], 0);
      });
    },
  );
}
