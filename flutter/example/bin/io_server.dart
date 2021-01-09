import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_dart/games.dart';

void main(List<String> arguments) {
  // Must be done on both client and server
  TicTacToeGame.register();
  // Only has to be done on server (unless server is in same process as client).
  Game.registerGeneralEvents();
  // Only has to be done on client
  registerIOClients();
  // Actually starts up the IO server.
  final _ = IOServer();
  // See test for more complete example of communicating with IOServer in raw dart code.
  // Flutter example will come in a bit
}
