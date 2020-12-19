export 'package:riverpod/riverpod.dart';
export 'core/errors.dart';
export 'core/game.dart';
export 'core/providers.dart';
export 'core/game_client.dart';
export 'core/server_client.dart';
export 'core/game_server.dart';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';

import 'core/server_client.dart';
import 'core/game_client.dart';

void registerIOClients() {
  IOGameClient.registerImplementation();
  IOServerClient.registerImplementation();
}

void registerNoServerClients() {
  NoServerGameClient.registerImplementation();
  NoServerClient.registerImplementation();
}
