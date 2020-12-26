export 'game_client.dart';
export 'server_client.dart';

import 'game_client.dart';
import 'server_client.dart';

/// Registers clients for on device game event handling
void registerOnDeviceClients() {
  NoServerGameClient.registerImplementation();
  NoServerClient.registerImplementation();
}
