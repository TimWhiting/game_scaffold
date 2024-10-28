
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'core/core/core.dart';

@EventGenerics(type: 'TicTacToe')
sealed class TicTacToeEvent implements Event {
  const TicTacToeEvent();
  external factory TicTacToeEvent.basic({required int location, required PlayerID playerID});
}

void main(){
  final res = TicTacToeEvent.readyNextRound(playerID: '');
  print(res);
}

enum Winner {
  p1,
  p2,
  tie;

  double get p1Points => this == p1
      ? 1.0
      : this == p2
          ? 0.0
          : 0.5;
  double get p2Points => this == p2
      ? 1.0
      : this == p1
          ? 0.0
          : 0.5;
}

// No per player info
@PlayerGenerics()
sealed class TicTacToePlayer implements GamePlayer<TicTacToeEvent> {}

class TicTacToeGame implements Game<TicTacToeEvent> {
  MaybeError<TicTacToeGame> nextRound(TicTacToeRound round, GameConfig config) =>
    TicTacToeRound.start(players, round.currentPlayerIndex == 0 ? 1 : 0).success;
  @override
  bool isOver(TicTacToeRound round, GameConfig config) => this.round == config.rounds; 
}

@RoundGenerics(type: 'TicTacToe', name: "Tic Tac Toe")
class TicTacToeRound implements GameRound<TicTacToeEvent> {
  factory TicTacToeRound.start(IMap<PlayerID, PlayerName> players, int currentPlayerIndex) => 
    TicTacToeRound(
      board: <int?>[for (var i = 0; i < 9; i++) null].lock, 
      players: {for (final MapEntry(key: id, value: n) in players.entries) TicTacToePlayer(id: id, name: n)},
      currentPlayerIndex: currentPlayerIndex,
    );
 
  final IList<int?> board
  MaybeError<TicTacToeGame> next(TicTacToeEvent event, GameConfig config) {
    if (event.player != currentPlayer) {
      return this.error('Not your turn'); // TODO: Generic check.
    }
    if (!canMove(event.player, event.location)) {
      return this.error('Invalid move');
    }
    return TicTacToeGame(
        currentPlayer: currentPlayer == 0 ? 1 : 0,
        board: board.replace(event.location, currentPlayer),
      ).success;
  }
  @override
  bool isOver(GameConfig c) => winner != null;
  @override
  Rewards rewards(GameConfig c) => {winner.p1Points, winner.p2Points};
   late final Winner? winner = isWinner(0)
      ? Winner.p1
      : isWinner(1)
          ? Winner.p2
          : board.every((e) => e != null)
              ? Winner.tie
              : null;
  bool isWinner(int player) {
    if (winningLocationCombinations.any((comb) => comb.every((loc) => board[loc] == player))) {
      return true;
    }
    return false;
  }
  bool isLoser(int player) => isWinner(player == 0 ? 1 : 0);

  IList<int> get availableLocations => board.asMap().entries.where((e) => e.value == null).map((e) => e.key).toIList();
  static IList<IList<int>> winningLocationCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].map((l) => l.lock).toIList();
  bool canMove(int player, int location) => location >= 0 && location < 9 && board[location] == null;
}