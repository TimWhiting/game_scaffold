import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_games/games.dart';

import 'package:game_scaffold_test/game_scaffold_test.dart';
import 'package:test/test.dart';

extension PlayerX on TicTacToeGameEvent {
  PlayerEvent<TicTacToeGameEvent> get p => (
      playerId: '$player',
      event: this,
    );
}

void main() {
  registerTicTacToe();

  testGame<TicTacToeGameEvent, TicTacToeGame>(
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

      tester.event(const TicTacToeGameEvent(player: 0, location: 0).p, (state, error) {
        expect(error, isNull);
        expect(state.game.board.every((s) => s == null), false);
        expect(state.game.board[0], 0);
      });
      tester.event( const TicTacToeGameEvent(player: 1, location: 0).p, (state, error) {
        expect(error, isNotNull);
        expect(state.game.board[0], 0);
      });
      tester.event( const TicTacToeGameEvent(player: 1, location: 1).p, (state, error) {
        expect(error, isNull);
        expect(state.game.board[1], 1);
      });
      tester.event( const TicTacToeGameEvent(player: 1, location: 2).p, (state, error) {
        expect(error, isNotNull);
        expect(state.game.board[2], null);
      });
      tester.event( const TicTacToeGameEvent(player: 0, location: 3).p, (state, error) {
        expect(error, isNull);
        expect(state.game.board[3], 0);
      });
      tester.event( const TicTacToeGameEvent(player: 1, location: 2).p, (state, error) {
        expect(error, isNull);
        expect(state.game.board[2], 1);
      });
      tester.event( const TicTacToeGameEvent(player: 0, location: 6).p, (state, error) {
        expect(error, isNull);
        expect(state.game.board[6], 0);
        expect(state.game.isWinner(0), true);
        expect(state.game.isLoser(1), true);
        expect(state.roundOver, true);
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
