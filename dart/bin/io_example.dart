import 'package:game_scaffold_dart/server.dart';

void main(List<String> arguments) {
  Game.registerGeneralEvents();
  Game.registerGameType(
    'MyGame',
    name: 'Cool Game',
    fromJson: (_) => null,
    intialState: (_, __, ___) => null,
    gameEventFromJson: (_) => null,
  );
  registerIOClients();
  startServer();
}
