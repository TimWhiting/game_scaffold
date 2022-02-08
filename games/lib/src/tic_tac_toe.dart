import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';

part 'tic_tac_toe.freezed.dart';
part 'tic_tac_toe.g.dart';

@freezed
class TicTacToeGame with _$TicTacToeGame implements GameState {
  const factory TicTacToeGame({
    required IList<String?> board,
    @Default('tictactoe') String type,
  }) = _TicTacToeGame;
  const TicTacToeGame._();

  factory TicTacToeGame.fromJson(Map<String, dynamic> map) => _$TicTacToeGameFromJson(map);

  @override
  GameOrError next(TicTacToeGameEvent event, Game game) => _handleMove(event.player, event.location, game);

  GameOrError _handleMove(PlayerID player, int location, Game game) {
    if (player != game.currentPlayer?.id) {
      return GameError('Not your turn', player);
    }
    if (!canMove(player, location)) {
      return GameError('Location not valid', player);
    }

    return copyWith(
      board: board.mapIndexed((i, s) => i == location ? player : s).toIList(),
    )._nextPlayerOrEndRound(game);
  }

  GameOrError _nextPlayerOrEndRound(Game game) {
    var gGame = game.nextPlayer();
    if (game.playerIDs.any(isWinner) || board.every((l) => l != null)) {
      if (game.round == 2) {
        gGame = gGame.finishRound(
          {game.players[0].id: points[game.players[0].id]!, game.players[1].id: points[game.players[1].id]!},
        ).updateStatus(GameStatus.Finished);
      } else {
        gGame = gGame.updateStatus(GameStatus.BetweenRounds);
      }
    }
    return GameValue(game.copyWith(gameState: this));
  }

  bool canMove(PlayerID player, int location) => location >= 0 && location < 9 && board[location] == null;

  @override
  Game moveNextRound(GameConfig config, Game game) => game.finishRound(
        {game.players[0].id: points[game.players[0].id]!, game.players[1].id: points[game.players[1].id]!},
      ).copyWith(
          gameState: copyWith(
        board: List.filled(9, null).lock,
      ));

  IMap<String, double> get points => IMap({
        for (final p in [P1, P2])
          p: isWinner(p)
              ? 1.0
              : isLoser(p)
                  ? 0.0
                  : .5,
      });

  static final IList<IList<int>> winningLocationCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].map((l) => l.lock).toIList();

  bool isWinner(PlayerID playerID) {
    if (winningLocationCombinations.any((comb) => comb.every((loc) => board[loc] == playerID))) {
      return true;
    }
    return false;
  }

  bool isLoser(PlayerID playerID) {
    if (isWinner([P1, P2].firstWhere((id) => id != playerID))) {
      return true;
    } else {
      return false;
    }
  }

  static void register() {
    Game.registerGameType(
      'tictactoe',
      name: 'Tic Tac Toe',
      fromJson: (json) => TicTacToeGame.fromJson(json),
      initialState: (config, players) => Game.start(
        players,
        TicTacToeGame(
          board: List.filled(9, null).lock,
        ),
        multiPly: true,
        simultaneousAction: false,
      ),
      gameEventFromJson: (j) => TicTacToeGameEvent.fromJson(j),
    );
  }
}

@freezed
class TicTacToeGameEvent with _$TicTacToeGameEvent implements GameEvent {
  const factory TicTacToeGameEvent(PlayerID player, int location) = _TicTacToeGameEvent;
  const TicTacToeGameEvent._();

  factory TicTacToeGameEvent.fromJson(Map<String, dynamic> map) => _$TicTacToeGameEventFromJson(map);
}
