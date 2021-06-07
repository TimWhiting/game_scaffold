import 'package:riverpod/riverpod.dart';

import '../backend.dart';
import '../client.dart';
import '../core.dart';

/// The GameServerClient interface
class GameServerClient {
  /// The GameServerClient interface
  GameServerClient(this.read, this._gClient, this._sClient);

  final GameClient _gClient;
  final ServerClient _sClient;

  /// The client's [playerID]
  PlayerID get playerID => _gClient.playerID;

  /// The [gameCode] of the game the client has joined
  GameCode get gameCode => _gClient.gameCode;

  /// The [Reader] for the game
  Reader read;

  /// Gets the game for the [playerID]
  GameReader get game => read.gameFor(playerID);

  /// Causes the client to exit the game
  void exitGame() => _gClient.exitGame();

  /// Registers the client with the game server with the optionally provided [code]
  ///
  /// Specifying [code] is just shorthand for updating the `gameCodeProvider`
  Future<void> register({GameCode? code}) async {
    if (code != null) {
      read.gameFor(playerID).gameCode = code;
    }
    return _gClient.register();
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
  void sendMessage(String message, {PlayerID? to}) =>
      _gClient.sendMessage(message);

  /// Creates a game on the server
  ///
  /// Specifying [config] is just a shorthand for updating `gameConfigProvider`
  Future<GameCode> createGame({GameConfig? config}) async {
    if (config != null) {
      read.gameFor(playerID).gameConfig = config;
    }
    await _sClient.createGame();
    return read.gameFor(playerID).gameCode;
  }

  /// Deletes the game on the server
  ///
  /// Specifying [code] is just shorthand for updating the `gameCodeProvider`
  Future<bool> deleteGame({GameCode? code}) async {
    if (code != null) {
      read.gameFor(playerID).gameCode = code;
    }
    return _sClient.deleteGame();
  }

  /// Connects to the backend
  Future<void> connect() async {
    await _sClient.connect();
  }

  /// Disconnect from the backend
  Future<void> disconnect() async {
    await _sClient.disconnect();
  }

  /// Gets a list of games on the server
  Future<IList<GameInfo>> getGames() => _sClient.getGames();

  Stream<Game> gameStream() => _gClient.gameStream();

  Stream<GameInfo> gameLobby() => _gClient.gameLobby();

  GameErrorNotifier get errorNotifier => _gClient.errorNotifier;
}
