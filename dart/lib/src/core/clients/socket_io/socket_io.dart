export 'game_client.dart';
export 'server_client.dart';

import 'game_client.dart';
import 'server_client.dart';

void registerIOClients() {
  IOGameClient.registerImplementation();
  IOServerClient.registerImplementation();
}
