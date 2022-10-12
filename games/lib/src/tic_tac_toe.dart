import 'package:game_scaffold_dart/game_scaffold_dart.dart';

typedef TicTacToeGame = ({IList<int?> board, int currentPlayer});
typedef TicTacToeGameEvent = ({int player, int location});

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

void registerTicTacToe() {
  Game.register<TicTacToeGame, TicTacToeGameEvent, JsonMap>(tttFunctions);
}

final GameFunctions<TicTacToeGame, TicTacToeGameEvent, JsonMap> tttFunctions = GameFunctions(
  game: (game) => (next: game.nextState, error: game.error),
  state: (state) => (nextRound: state.nextRound),
  toJson: (game) => {'board': game.board.toList(), 'currentPlayer': game.currentPlayer},
  fromJson: (map) => (board: (map['board'] as List).cast<int?>().lock, currentPlayer: map['currentPlayer'] as int),
  toJsonE: (event) => {'player': event.player, 'location': event.location},
  fromJsonE: (map) => (player: map['player'] as int, location: map['location'] as int),
  toJsonC: (m) => m,
  fromJsonC: (m) => m,
  gameName: 'Tic Tac Toe',
  gameType: 'tictactoe',
  initialState: (config, players) => GameState(game: (board: <int?>[for (var i = 0; i < 9; i++) null].lock, currentPlayer: 0), gameType: 'tictactoe', messages: <GameMessage>[].lock, generic: GenericGame.start(players), rewards: <double>[0, 0]),
);

enum Winner {
  p1,
  p2,
  tie;
  double get p1Points => this == p1 ? 1.0 : this == p2 ? 0.0 : 0.5;
  double get p2Points => this == p2 ? 1.0 : this == p1 ? 0.0 : 0.5;
}

extension TicTacToeStateX on GameState<TicTacToeGame> {
  GameState<TicTacToeGame> nextRound(GameConfig config) => GameState(
    game: (board: <int?>[for (var i = 0; i < 9; i++) null].lock, currentPlayer: game.currentPlayer == 0 ? 1 : 0),
    gameType: 'tictactoe',
    generic: generic.finishRound(),
    messages: messages,
    rewards: rewards,
  );
}

extension TicTacToeGameX on TicTacToeGame {
  
  TicTacToeGame next(TicTacToeGameEvent event, GameConfig config) => 
  (
    currentPlayer: currentPlayer == 0 ? 1 : 0,
    board: board.replace(event.location,  currentPlayer),
  );

  NextState<TicTacToeGame> nextState(TicTacToeGameEvent event, GameConfig config){
    final n = next(event, config);
    final winner = n.winner;
    if (winner != null){
      return (n, [winner.p1Points, winner.p2Points], GameStatus.betweenRounds);
    }
    return (n, null, GameStatus.started);
  }

  bool canMove(int player, int location) =>
      location >= 0 && location < 9 && board[location] == null;

  String? error(TicTacToeGameEvent event, GameConfig config){
     if (event.player != currentPlayer){
      return 'Not your turn';
    }
    if (!canMove(event.player, event.location)){
      return 'Invalid move';
    }
    return null;
  }

  Winner? get winner => 
    isWinner(0)  ? Winner.p1 : 
    isWinner(1) ? Winner.p2  :  
    board.every((e) => e != null) ? Winner.tie : null;

  bool isWinner(int player) {
    if (winningLocationCombinations
        .any((comb) => comb.every((loc) => board[loc] == player))) {
      return true;
    }
    return false;
  }

  bool isLoser(int player) => isWinner(player == 0 ? 1 : 0);

  IList<int> get availableLocations => board.asMap().entries.where((e) => e.value == null).map((e) => e.key).toIList();
}

