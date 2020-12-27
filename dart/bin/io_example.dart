import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_dart/src/games/reversi.dart';

void main(List<String> arguments) {
  Game.registerGeneralEvents();
  ReversiGame.register();
  registerIOClients();
  final _ = IOServer();
}
