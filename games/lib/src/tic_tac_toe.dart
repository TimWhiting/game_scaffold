import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tic_tac_toe.freezed.dart';
part 'tic_tac_toe.g.dart';

@freezed
abstract class TicTacToeGame
    with _$TicTacToeGame
    implements Game<TicTacToeGameEvent> {
  const TicTacToeGame._();
  const factory TicTacToeGame({
    @required GenericGame generic,
    @unmodifiableStringList @required List<String> board,
    @Default('tictactoe') String type,
  }) = _TicTacToeGame;
  factory TicTacToeGame.fromJson(Map<String, dynamic> map) =>
      _$TicTacToeGameFromJson(map);

  @override
  GameOrError<TicTacToeGame> next(
      TicTacToeGameEvent event, BackendGameReader backendReader) {
    return _handleMove(event.player, event.location);
  }

  GameOrError<TicTacToeGame> _handleMove(String player, int location) {
    if (player != currentPlayer.id) {
      return GameError('Not your turn', player);
    }
    if (!canMove(player, location)) {
      return GameError('Location not valid', player);
    }

    return copyWith(
      board: board
          .mapIndexed((i, s) => i == location ? player : s)
          .toUnmodifiable(),
    )._nextPlayerOrEndRound().gameValue();
  }

  TicTacToeGame _nextPlayerOrEndRound() {
    var gGame = generic.nextPlayer();
    if (playerIDs.any((p) => isWinner(p)) || board.all((l) => l != null)) {
      if (round == 2) {
        gGame = gGame.finishRound(
          {
            players[0].id: points[players[0].id],
            players[1].id: points[players[1].id]
          },
        ).updateStatus(GameStatus.Finished);
      } else {
        gGame = gGame.updateStatus(GameStatus.BetweenRounds);
      }
    }
    return copyWith(generic: gGame);
  }

  bool canMove(String player, int location) {
    return location >= 0 && location < 9 && board[location] == null;
  }

  @override
  TicTacToeGame moveNextRound(
      GameConfig config, BackendGameReader backendReader) {
    return TicTacToeGame(
      generic: generic.finishRound(
        {
          players[0].id: points[players[0].id],
          players[1].id: points[players[1].id]
        },
      ),
      board: List.unmodifiable(List.filled(9, null)),
    );
  }

  @override
  TicTacToeGame copyWithGeneric(GenericGame Function(GenericGame p1) updates) {
    return copyWith(generic: updates(generic));
  }

  Map<String, double> get points {
    return Map.unmodifiable({
      for (final p in playerIDs)
        p: isWinner(p)
            ? 1.0
            : isLoser(p)
                ? 0.0
                : .5,
    });
  }

  static final List<List<int>> winningLocationCombinations = List.unmodifiable([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].map((l) => l.toUnmodifiable()));

  bool isWinner(String playerID) {
    if (winningLocationCombinations
        .any((comb) => comb.all((loc) => board[loc] == playerID))) {
      return true;
    }
    return false;
  }

  bool isLoser(String playerID) {
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
        generic: GenericGame.start(players),
        board: List.unmodifiable(List.filled(9, null)),
      ),
      gameEventFromJson: (j) => TicTacToeGameEvent.fromJson(j).asGameEvent,
    );
  }
}

@freezed
abstract class TicTacToeGameEvent with _$TicTacToeGameEvent implements Event {
  const TicTacToeGameEvent._();
  const factory TicTacToeGameEvent(String player, int location) =
      _TicTacToeGameEvent;
  factory TicTacToeGameEvent.fromJson(Map<String, dynamic> map) =>
      _$TicTacToeGameEventFromJson(map);
  @override
  String get type => 'tictactoe';
}
