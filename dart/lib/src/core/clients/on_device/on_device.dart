import 'game_client.dart';
import 'server_client.dart';

export 'game_client.dart';
export 'server_client.dart';

/// Registers clients for on device game event handling
void registerOnDeviceClients() {
  NoServerGameClient.registerImplementation();
  NoServerClient.registerImplementation();
}

/// Location that corresponds to running the game on-device
const OnDeviceLocation = 'on-device';
