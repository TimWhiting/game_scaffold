import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'game.dart';
import 'generic.dart';
import 'player.dart';

extension GameMapExtensions<K, V> on IMap<K, V> {
  IMap<K, S> mapValues<S>(S Function(MapEntry<K, V> entry) fn) => IMap({
        for (final entry in entries) entry.key: fn(entry),
      });

  IMap<S, V> mapKeys<S>(S Function(MapEntry<K, V> entry) fn) => IMap({
        for (final entry in entries) fn(entry): entry.value,
      });
}

typedef JsonMap = Map<String, Object?>;

extension GameRoundX<E extends Event> on GameRound<E> {
  bool canPlay(GameConfig config, E event) => next(config, event).isRight();
  PlayerIndex nextPlayerIndex(PlayerIndex currentPlayer) => (currentPlayer + 1) % players.length;
  GamePlayer<E> playerFromIndex(PlayerIndex currentPlayer) => players[currentPlayer];
  GamePlayer<E> player(PlayerID id) => players.firstWhere((p) => p.id == id);
  PlayerName playerName(PlayerID playerID) => player(playerID).name;
  PlayerIndex playerIndex(PlayerID playerID) =>
      players.indexWhere((p) => p.id == playerID);
}

extension GameX<E extends Event> on Game<E> {
  bool get gameOver => status == GameStatus.finished;
  bool get roundOver => status == GameStatus.betweenRounds;
  PlayerName playerName(PlayerID id) => players[id]!;
}