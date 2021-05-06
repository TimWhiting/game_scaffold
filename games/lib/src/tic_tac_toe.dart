import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tic_tac_toe.freezed.dart';
part 'tic_tac_toe.g.dart';

@freezed
class TicTacToeGame with _$TicTacToeGame implements Game<TicTacToeGameEvent> {
  const factory TicTacToeGame({
    required GenericGame generic,
    required IList<String?> board,
    @Default('tictactoe') String type,
  }) = _TicTacToeGame;
  const TicTacToeGame._();

  factory TicTacToeGame.fromJson(Map<String, dynamic> map) =>
      _$TicTacToeGameFromJson(map);

  @override
  GameOrError<TicTacToeGame> next(
          TicTacToeGameEvent event, BackendGameReader backendReader) =>
      _handleMove(event.player, event.location);

  GameOrError<TicTacToeGame> _handleMove(PlayerID player, int location) {
    if (player != currentPlayer?.id) {
      return GameError('Not your turn', player);
    }
    if (!canMove(player, location)) {
      return GameError('Location not valid', player);
    }

    return copyWith(
      board: board.mapIndexed((i, s) => i == location ? player : s).toIList(),
    )._nextPlayerOrEndRound().gameValue();
  }

  TicTacToeGame _nextPlayerOrEndRound() {
    var gGame = generic.nextPlayer();
    if (playerIDs.any(isWinner) || board.every((l) => l != null)) {
      if (round == 2) {
        gGame = gGame.finishRound(
          {
            players[0].id: points[players[0].id]!,
            players[1].id: points[players[1].id]!
          },
        ).updateStatus(GameStatus.Finished);
      } else {
        gGame = gGame.updateStatus(GameStatus.BetweenRounds);
      }
    }
    return copyWith(generic: gGame);
  }

  bool canMove(PlayerID player, int location) =>
      location >= 0 && location < 9 && board[location] == null;

  @override
  TicTacToeGame moveNextRound(
          GameConfig config, BackendGameReader backendReader) =>
      TicTacToeGame(
        generic: generic.finishRound(
          {
            players[0].id: points[players[0].id]!,
            players[1].id: points[players[1].id]!
          },
        ),
        board: List.filled(9, null).lock,
      );

  @override
  TicTacToeGame copyWithGeneric(GenericGame Function(GenericGame p1) updates) =>
      copyWith(generic: updates(generic));

  IMap<String, double> get points => IMap({
        for (final p in playerIDs)
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
    if (winningLocationCombinations
        .any((comb) => comb.every((loc) => board[loc] == playerID))) {
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

  static void register() {
    Game.registerGameType(
      'tictactoe',
      name: 'Tic Tac Toe',
      fromJson: (json) => TicTacToeGame.fromJson(json),
      initialState: (config, players, _) => TicTacToeGame(
        generic: GenericGame.start(players,
            multiPly: true, simultaneousAction: false),
        board: List.filled(9, null).lock,
      ),
      gameEventFromJson: (j) => TicTacToeGameEvent.fromJson(j).asGameEvent,
    );
  }
}

@freezed
class TicTacToeGameEvent with _$TicTacToeGameEvent implements Event {
  const factory TicTacToeGameEvent(PlayerID player, int location) =
      _TicTacToeGameEvent;
  const TicTacToeGameEvent._();

  factory TicTacToeGameEvent.fromJson(Map<String, dynamic> map) =>
      _$TicTacToeGameEventFromJson(map);
  @override
  String get type => 'tictactoe';
}
