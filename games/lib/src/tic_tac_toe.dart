import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';

part 'tic_tac_toe.freezed.dart';
part 'tic_tac_toe.g.dart';

void registerTicTacToe() {
  GameRegistry.register(TTTFunctions());
}

class TTTFunctions extends GameFunctions<TicTacToeGameEvent, TicTacToeGame> {
  @override
  TicTacToeGame fromJson(JsonMap json) => TicTacToeGame.fromJson(json);
  @override
  TicTacToeGameEvent fromJsonE(JsonMap json) =>
      TicTacToeGameEvent.fromJson(json);
  @override
  String get gameName => 'Tic Tac Toe';
  @override
  String get gameType => 'tictactoe';
  @override
  GameState<TicTacToeGameEvent, TicTacToeGame> initialState(
          GameConfig config, IList<Player> players) =>
      GameState(
        game: TicTacToeGame(
            board: <int?>[for (var i = 0; i < 9; i++) null].lock,
            currentPlayer: 0),
        generic: GenericGame.start(players),
        rewards: <double>[0, 0],
      );
  @override
  NextState<TicTacToeGameEvent, TicTacToeGame> next(GameState state,
      GameConfig config, PlayerEvent<TicTacToeGameEvent> event) {
    final st = state.cast<TicTacToeGameEvent, TicTacToeGame>();
    final game = st.game;
    if (event.event.player != game.currentPlayer) {
      return st.error('Not your turn');
    }
    if (!game.canMove(event.event.player, event.event.location)) {
      return st.error('Invalid move');
    }
    final n = game._next(event.event, config);
    final winner = n.winner;
    if (winner != null) {
      return st
          .updateGame(n.copyWith(currentPlayer: game.currentPlayer))
          .addReward([winner.p1Points, winner.p2Points]).success;
    }
    return st.updateGame(n).success;
  }

  @override
  TTTGameState nextRound(GameState state, GameConfig config) {
    final st = state.cast<TicTacToeGameEvent, TicTacToeGame>();
    return st.updateGame(TicTacToeGame(
      board: <int?>[for (var i = 0; i < 9; i++) null].lock,
      currentPlayer: st.game.currentPlayer == 0 ? 1 : 0,
    ));
  }
}

@freezed
class TicTacToeGameEvent extends Event with _$TicTacToeGameEvent {
  const factory TicTacToeGameEvent({
    required int player,
    required int location,
  }) = _TicTacToeGameEvent;
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

typedef TTTGameState = GameState<TicTacToeGameEvent, TicTacToeGame>;

@freezed
class TicTacToeGame extends Game with _$TicTacToeGame {
  const factory TicTacToeGame({
    required IList<int?> board,
    required int currentPlayer,
    @Default('tictactoe') String type,
  }) = _TicTacToeGame;
  factory TicTacToeGame.fromJson(Map<String, dynamic> map) =>
      _$TicTacToeGameFromJson(map);
  const TicTacToeGame._();

  TicTacToeGame _next(TicTacToeGameEvent event, GameConfig config) =>
      TicTacToeGame(
        currentPlayer: currentPlayer == 0 ? 1 : 0,
        board: board.replace(event.location, currentPlayer),
      );

  @override
  bool get roundOver => winner != null;
  @override
  bool gameOver(GenericGame g) => g.round == 10;

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
