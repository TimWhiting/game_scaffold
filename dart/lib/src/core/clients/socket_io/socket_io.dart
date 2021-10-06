import 'game_client.dart';
import 'server_client.dart';

export 'game_client.dart';
export 'server_client.dart';

/// Registers IO Client implementations
void registerIOClients() {
  IOGameClient.registerImplementation();
  IOServerClient.registerImplementation();
}

/// Location that corresponds to using an io-server for the backend
const IOClient = 'io-server';
