import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';

part 'tic_tac_toe.freezed.dart';
part 'tic_tac_toe.g.dart';

void registerTicTacToe() {
  GameRegistry.register<TicTacToeGameEvent, TicTacToeGame>(tttFunctions);
}

final GameFunctions<TicTacToeGameEvent, TicTacToeGame> tttFunctions =
    GameFunctions(
  toJson: (game) => game.toJson(),
  fromJson: TicTacToeGame.fromJson,
  toJsonE: (event) => event.toJson(),
  fromJsonE: TicTacToeGameEvent.fromJson,
  gameName: 'Tic Tac Toe',
  gameType: 'tictactoe',
  initialState: (config, players) => GameState(
    game: TicTacToeGame(
        board: <int?>[for (var i = 0; i < 9; i++) null].lock, currentPlayer: 0),
    generic: GenericGame.start(players),
    rewards: <double>[0, 0],
  ),
  next: TicTacToeGame.next,
  nextRound: TicTacToeGame.nextRound,
);

@freezed
class TicTacToeGameEvent extends Event with _$TicTacToeGameEvent {
  const factory TicTacToeGameEvent(
      {required int player, required int location}) = _TicTacToeGameEvent;
  const TicTacToeGameEvent._();
  factory TicTacToeGameEvent.fromJson(Map<String, dynamic> map) =>
      _$TicTacToeGameEventFromJson(map);
  @override
  GameType get type => 'tictactoe';
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

@freezed
class TicTacToeGame extends Game with _$TicTacToeGame {
  const factory TicTacToeGame({
    required IList<int?> board,
    required int currentPlayer,
  }) = _TicTacToeGame;
  factory TicTacToeGame.fromJson(Map<String, dynamic> map) =>
      _$TicTacToeGameFromJson(map);
  const TicTacToeGame._();
  @override
  GameType get type => 'tictactoe';

  TicTacToeGame _next(TicTacToeGameEvent event, GameConfig config) =>
      TicTacToeGame(
        currentPlayer: currentPlayer == 0 ? 1 : 0,
        board: board.replace(event.location, currentPlayer),
      );

  @override
  bool get roundOver => winner != null;
  @override
  bool gameOver(GenericGame g) => g.round == 10;

  static NextState<TicTacToeGameEvent, TicTacToeGame> next(
      GameState<TicTacToeGameEvent, TicTacToeGame> state,
      GameConfig config,
      TicTacToeGameEvent event) {
    final game = state.game;
    if (event.player != game.currentPlayer) {
      return state.error('Not your turn');
    }
    if (!game.canMove(event.player, event.location)) {
      return state.error('Invalid move');
    }
    final n = game._next(event, config);
    final winner = n.winner;
    if (winner != null) {
      return state
          .updateGame(n.copyWith(currentPlayer: game.currentPlayer))
          .addReward([winner.p1Points, winner.p2Points]).value;
    }
    return state.updateGame(n).value;
  }

  static GameState<TicTacToeGameEvent, TicTacToeGame> nextRound(
          GameState<TicTacToeGameEvent, TicTacToeGame> state,
          GameConfig config) =>
      GameState<TicTacToeGameEvent, TicTacToeGame>(
        game: TicTacToeGame(
            board: <int?>[for (var i = 0; i < 9; i++) null].lock,
            currentPlayer: state.game.currentPlayer == 0 ? 1 : 0),
        generic: state.generic.finishRound(),
        rewards: state.rewards,
      );

  bool canMove(int player, int location) =>
      location >= 0 && location < 9 && board[location] == null;

  Winner? get winner => isWinner(0)
      ? Winner.p1
      : isWinner(1)
          ? Winner.p2
          : board.every((e) => e != null)
              ? Winner.tie
              : null;

  bool isWinner(int player) {
    if (winningLocationCombinations
        .any((comb) => comb.every((loc) => board[loc] == player))) {
      return true;
    }
    return false;
  }

  bool isLoser(int player) => isWinner(player == 0 ? 1 : 0);

  IList<int> get availableLocations => board
      .asMap()
      .entries
      .where((e) => e.value == null)
      .map((e) => e.key)
      .toIList();

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
}
