import 'dart:async';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum IOChannel {
  error,
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
}

extension IOChannelX on IOChannel {
  String get string {
    switch (this) {
      case IOChannel.getgames:
        return 'getgames';
      case IOChannel.allgames:
        return 'allgames';
      case IOChannel.error:
        return 'error';
      case IOChannel.gamestate:
        return 'gamestate';
      case IOChannel.event:
        return 'event';
      case IOChannel.register:
        return 'register';
      case IOChannel.connection:
        return 'connection';
      case IOChannel.connect:
        return 'connect';
      case IOChannel.creategame:
        return 'creategame';
      case IOChannel.deletegame:
        return 'deletegame';
      case IOChannel.gameinfo:
        return 'gameinfo';
      case IOChannel.getgameinfo:
        return 'getgameinfo';
      case IOChannel.gamecreated:
        return 'gamecreated';
      case IOChannel.name:
        return 'name';
      case IOChannel.disconnect:
        return 'disconnect';
      case IOChannel.gamedeleted:
        return 'gamedeleted';
    }
    throw UnimplementedError('Invalid IO Channel');
  }

  IOChannel get responseChannel {
    final error = UnimplementedError('No corresponding response channel');
    switch (this) {
      case IOChannel.error:
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
  Future<Object> call(IOChannel requestChannel, Object request) {
    final responseChannel = requestChannel.responseChannel;
    final completer = Completer<Object>();
    once(responseChannel.string, completer.complete);
    emit(requestChannel.string, request);
    return completer.future;
  }
}
