library game_core;

export 'package:riverpod/riverpod.dart';
export 'core/errors.dart';
export 'core/game.dart';
export 'core/clients/clients.dart';
export 'core/game_server.dart';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';

import 'core/clients/clients.dart';

void registerIOClients() {
  IOGameClient.registerImplementation();
  IOServerClient.registerImplementation();
}

void registerNoServerClients() {
  NoServerGameClient.registerImplementation();
  NoServerClient.registerImplementation();
}
