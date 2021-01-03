import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_dart/games.dart';

void main(List<String> arguments) {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerIOClients();
  final _ = IOServer();
}
