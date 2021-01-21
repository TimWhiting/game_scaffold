import 'dart:async';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:enum_to_string/enum_to_string.dart';

/// Options for a socket io server
final socketIOOpts = <String, dynamic>{
  'transports': ['websocket'],
  'forceNew': true,
};

/// The IO Channels used by the socket io implemenations of [GameClient] and [ServerClient]
enum IOChannel {
  error_channel,
  gamestate,
  event,
  register,
  connect,
  connection,
  creategame,
  gamecreated,
  deletegame,
  gamedeleted,
  gameinfo,
  getgameinfo,
  name,
  disconnect,
  getgames,
  allgames,
  lobby,
}

extension IOChannelX on IOChannel {
  /// Retrieves the string for the enum
  String get string {
    if (this == null) {
      throw UnimplementedError('Socket IO channel cannot be null');
    }
    return EnumToString.convertToString(this);
  }

  /// Returns the corresponding response `IOChannel` for a particular channel
  ///
  /// This allows us to create a asynchronous request/response type API on top
  /// of the `IO.Socket` stream interface
  IOChannel get responseChannel {
    final error = UnimplementedError('No corresponding response channel');

    switch (this) {
      case IOChannel.lobby:
      case IOChannel.error_channel:
      case IOChannel.gamestate:
      case IOChannel.event:
      case IOChannel.connect:
      case IOChannel.connection:
      case IOChannel.gamecreated:
      case IOChannel.gameinfo:
      case IOChannel.name:
      case IOChannel.disconnect:
      case IOChannel.allgames:
      case IOChannel.gamedeleted:
        throw error;
      case IOChannel.deletegame:
        return IOChannel.gamedeleted;
      case IOChannel.creategame:
        return IOChannel.gamecreated;
      case IOChannel.register:
        return IOChannel.name;
      case IOChannel.getgameinfo:
        return IOChannel.gameinfo;
      case IOChannel.getgames:
        return IOChannel.allgames;
    }
    throw UnimplementedError('Invalid IO Channel');
  }
}

extension SocketIOX on IO.Socket {
  /// Calls `requestChannel` with `request`, and receives the corresponding
  /// response on the `requestChannel.reponseChannel`, returning it as a `Future`
  Future<Object> call(IOChannel requestChannel, Object request) {
    final responseChannel = requestChannel.responseChannel;
    final completer = Completer<Object>();
    once(responseChannel.string, completer.complete);
    emit(requestChannel.string, request);
    return completer.future;
  }
}
