import 'package:riverpod/experimental/mutation.dart';

import '../../../game_scaffold_dart.dart';

/// Mutations for game management operations
///
/// **ALL mutations are keyed by playerID** since each player maintains their own
/// [MultiplayerGameClient] state and sees only the games they're part of.
///
/// Use `.call(playerID)` to get per-player mutation state and watch/trigger operations.

/// Fetches the list of games available to a player
///
/// Per-player mutation - use `.call(playerID)` - each player sees their own game list
final fetchGamesMutation = Mutation<IList<GameInfo>?>();

/// Creates a new game
///
/// Per-player mutation - use `.call(playerID)` - tracks creation request per player
final createGameMutation = Mutation<GameCode>();

/// Deletes a game
///
/// Per-player mutation - use `.call(playerID)` - each player can delete their games
final deleteGameMutation = Mutation<bool>();

/// Joins a game by code and player name
///
/// Per-player mutation - use `.call(playerID)` for per-player state
/// Returns the player's assigned name in the game
final joinGameMutation = Mutation<PlayerName>();

/// Starts a game (typically admin operation)
///
/// Per-player mutation - use `.call(playerID)` - tracks start request per player
final startGameMutation = Mutation<bool>();

/// Sends an event during gameplay
///
/// Per-player mutation - use `.call((playerID, code))` or use `.call(playerID)`
/// Events are player-specific and update that player's game state
final sendEventMutation = Mutation<bool>();

/// Sends a ready-for-next-round event
///
/// Per-player mutation - use `.call(playerID)` - player marks themselves ready
final readyNextRoundMutation = Mutation<bool>();

/// Exits the game
///
/// Per-player mutation - use `.call(playerID)` - player exits their session
final exitGameMutation = Mutation<bool>();

