export 'core/errors.dart';
export 'core/game.dart';
export 'core/providers.dart';
export 'core/game_client.dart';
export 'core/server_client.dart';
export 'core/game_server.dart';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';

import 'core/server_client.dart';
import 'core/game_client.dart';
import 'core/game.dart';

void registerIOClients() {
  GameClient.registerImplementation(
    GameLocation.IOServer,
    (read, address, id, gameCode) =>
        IOGameClient(address: address, read: read, id: id, gameCode: gameCode),
  );
  ServerClient.registerImplementation(
    GameLocation.IOServer,
    (read, address, id) => IOServerClient(read: read, address: address, id: id),
  );
}

void registerNoServerClients() {
  GameClient.registerImplementation(
    GameLocation.Local,
    (read, address, id, gameCode) =>
        NoServerGameClient(read: read, id: id, gameCode: gameCode),
  );

  ServerClient.registerImplementation(
    GameLocation.Local,
    (read, address, id) => NoServerClient(read: read, id: id),
  );
}
