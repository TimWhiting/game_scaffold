export 'game_client.dart';
export 'server_client.dart';

import 'game_client.dart';
import 'server_client.dart';

/// Registers IO Client implementations
void registerIOClients() {
  IOGameClient.registerImplementation();
  IOServerClient.registerImplementation();
}
