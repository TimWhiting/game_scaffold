import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';

part 'tic_tac_toe.freezed.dart';
part 'tic_tac_toe.g.dart';

@freezed
class TicTacToeGameEvent with _$TicTacToeGameEvent {
  const factory TicTacToeGameEvent({required int player, required int location}) = _TicTacToeGameEvent;
  factory TicTacToeGameEvent.fromJson(Map<String, dynamic> map) => _$TicTacToeGameEventFromJson(map);
}

@freezed
class TicTacToeGame with _$TicTacToeGame {
  const factory TicTacToeGame({required  IList<int?> board, required  int currentPlayer}) = _TicTacToeGame;
  factory TicTacToeGame.fromJson(Map<String, dynamic> map) => _$TicTacToeGameFromJson(map);
}

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
  Game.register<TicTacToeGame, TicTacToeGameEvent>(tttFunctions);
}

final GameFunctions<TicTacToeGame, TicTacToeGameEvent> tttFunctions = GameFunctions(
  game: (game) => GameStateFunctions(next: game.nextState, error: game.error),
  state: (state) => StateFunctions(nextRound: TicTacToeStateX(state).nextRound),
  toJson: (game) => game.toJson(),
  fromJson: TicTacToeGame.fromJson,
  toJsonE: (event) => event.toJson(),
  fromJsonE: TicTacToeGameEvent.fromJson,
  gameName: 'Tic Tac Toe',
  gameType: 'tictactoe',
  initialState: (config, players) => GameState(game: TicTacToeGame(board: <int?>[for (var i = 0; i < 9; i++) null].lock, currentPlayer: 0),  messages: <GameMessage>[].lock, generic: GenericGame.start(players), rewards: <double>[0, 0]),
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
    game: TicTacToeGame(board: <int?>[for (var i = 0; i < 9; i++) null].lock, currentPlayer: game.currentPlayer == 0 ? 1 : 0),    
    generic: generic.finishRound(),
    messages: messages,
    rewards: rewards,
  );
}

extension TicTacToeGameX on TicTacToeGame {
  
  TicTacToeGame next(TicTacToeGameEvent event, GameConfig config) => 
  TicTacToeGame(
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

