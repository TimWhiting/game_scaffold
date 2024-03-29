import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/games.dart';

void main(List<String> arguments) {
  // Must be done on both client and server
  TicTacToeGame.register();

  // Actually starts up the IO server.
  final _ = IOServer();
  // See test for more complete example of communicating with IOServer in raw dart code.
  // Flutter example will come in a bit
}
