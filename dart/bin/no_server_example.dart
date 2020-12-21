import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_dart/src/games/reversi.dart';

void main(List<String> arguments) {
  Game.registerGeneralEvents();
  ReversiGame.register();
  registerNoServerClients();
}
