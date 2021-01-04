import 'package:riverpod/all.dart';

import '../client.dart';
import '../core.dart';

class GameServerClient {
  GameServerClient(this.read, this._gClient, this._sClient);

  final GameClient _gClient;
  final ServerClient _sClient;

  /// The client's [playerID]
  String get playerID => _gClient.id;

  /// The [gameCode] of the game the client has joined
  String get gameCode => _gClient.gameCode;

  Reader read;

  /// Causes the client to exit the game
  void exitGame() => _gClient.exitGame();

  /// Registers the client with the game server with the optionally provided [code]
  ///
  /// Specifying [code] is just shorthand for updating the [gameCodeProvider]
  Future<void> register({String code}) async {
    if (code != null) {
      read(gameCodeProvider(playerID)).state = code;
    }
    return await _gClient.register();
  }

  /// Sends [event] to the game server
  void sendEvent(Event event) => _gClient.sendEvent(event);

  /// Sends a start event to the game server
  void startGame() => _gClient.startGame();

  /// Sends an undo event to the game server
  void undo() => _gClient.undo();

  /// Sends a new round event to the game server
  void newRound() => _gClient.newRound();

  /// Sends a message event to the game server
  ///
  /// Not currently implemented [to], a particular player the comment is directed
  /// towards
  void sendMessage(String message, {String to}) =>
      _gClient.sendMessage(message);

  /// Creates a game on the server
  ///
  /// Specifying [config] is just a shorthand for updating the [gameConfigProvider]
  Future<String> createGame({GameConfig config}) async {
    if (config != null) {
      read(gameConfigProvider(playerID)).state = config;
    }
    await _sClient.createGame();
    return read(gameCodeProvider(playerID)).state;
  }

  /// Deletes the game on the server
  ///
  /// Specifying [code] is just shorthand for updating the [gameCodeProvider]
  Future<bool> deleteGame({String code}) async {
    if (code != null) {
      read(gameCodeProvider(playerID)).state = code;
    }
    return await _sClient.deleteGame();
  }

  /// Gets a list of games on the server
  Future<List<GameInfo>> getGames() => _sClient.getGames();

  /// Gets info about a particular game from the server
  Future<GameInfo> getGameInfo(String gameId) async {
    await _sClient.getGameInfo(gameId);
    return read(gameInfoProvider(playerID)).state;
  }
}
