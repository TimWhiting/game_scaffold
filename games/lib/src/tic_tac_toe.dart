import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
part 'tic_tac_toe.freezed.dart';
part 'tic_tac_toe.g.dart';

typedef TicTacToeGame = ({IList<String?> board});


final IList<IList<int>> winningLocationCombinations = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].map((l) => l.lock).toIList();

extension TicTacToeGameXX on State<TicTacToeGame> {
   NextStateOrError<TicTacToeGame> next(TicTacToeGameEvent event) {
    if (event.player != generic.players[currentPlayerIndex!].id){
      return (state: this, error: (message: 'Not your turn', playerId: event.player));
    }
    if (!canMove(event.player, event.location)){
      return (state: this, error: (message:'Invalid move', playerId: event.playerId));
    }
    return (state: updateReward(points).nextPlayer(), error: null);
  }

   bool canMove(PlayerID player, int location) =>
      location >= 0 && location < 9 && game.board[location] == null;

  IMap<String, double> get points => IMap({
        for (final p in playerIDs)
          p: isWinner(p)
              ? 1.0
              : isLoser(p)
                  ? 0.0
                  : .5,
      });


  bool isWinner(PlayerID playerID) {
    if (winningLocationCombinations
        .any((comb) => comb.every((loc) => game.board[loc] == playerID))) {
      return true;
    }
    return false;
  }

  bool isLoser(PlayerID playerID) {
    if (isWinner(playerIDs.firstWhere((id) => id != playerID))) {
      return true;
    } else {
      return false;
    }
  }
}

typedef TicTacToeGameEvent = ({PlayerID player, int location});

