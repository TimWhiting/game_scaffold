import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

part 'generic.freezed.dart';
part 'generic.g.dart';


/// Represents the current status of the game as seen by the client
enum GameStatus {
  /// The client is waiting for the game to start
  lobby,

  /// The game has started
  started,

  /// The game is waiting for the clients to signal that they are ready for the
  /// next round before moving on
  betweenRounds,

  /// The game is finished
  finished,
}

/// Some general config parameters for a game of [gameType]
///
/// Custom options can be added to the [options] map, but must be in a json
/// compatible form
// @Freezed(genericArgumentFactories: true)
@freezed
class GameConfig with _$GameConfig {
  const factory GameConfig({
    required GameType gameType,
    PlayerID? adminID,
    @Default(NameSet.basic) NameSet nameSet,
    @Default(false) bool customNames,
    @Default(15) int rounds,
    @Default(1) int minPlayers,
    @Default(10) int maxPlayers,
    @Default(true) bool autoStart,
    @Default({}) Map<String, Object?> options,
  }) = _GameConfig;
  const GameConfig._();
  factory GameConfig.fromJson(Map<String, Object?> map) =>
      _$GameConfigFromJson(map);
}

/// An object to provide info about a particular game to the client
///
/// Includes
/// * The game's [gameID] on the server
/// * The game's [config]
/// * A list of [players] who are part of the game
/// * The [player]'s id in the game
/// * Whether the player is the [creator] of the game
@freezed
class GameInfo with _$GameInfo {
  const factory GameInfo({
    required GameCode gameID,
    required IList<PlayerName> players,
    required PlayerName player,
    required bool creator,
    required GameConfig config,
    required GameStatus status,
  }) = _GameInfo;

  factory GameInfo.fromJson(Map<String, dynamic> map) =>
      _$GameInfoFromJson(map);
}

@freezed
class Lobby with _$Lobby {
  const factory Lobby({
    required GameCode code,
    required GameConfig config,
    required GameStatus gameStatus,
    @Default(ISetConst({})) ISet<Player> players,
  }) = _Lobby;
  factory Lobby.fromJson(Map<String, dynamic> map) => _$LobbyFromJson(map);
}
