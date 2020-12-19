import 'package:game_scaffold_dart/game_scaffold_dart.dart';

void main(List<String> arguments) {
  Game.registerGameType(
    'MyGame',
    name: 'Cool Game',
    fromJson: (_) => null,
    intialState: (_, __) => null,
    gameEventFromJson: (_) => null,
  );
  registerNoServerClients();
}
