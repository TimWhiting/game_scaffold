// import 'package:firebase_dart/firebase_dart.dart' hide Event;
// import 'package:game_scaffold_dart/game_scaffold_dart.dart';

// final firebaseAppProvider = Provider<FirebaseApp>((ref) =>
//     throw UnimplementedError('Override this provider with a FirebaseApp'));
// final firebaseRoundClient = Provider.autoDispose(FirebaseRoundClient.new);
// final firebaseGameClient = Provider.autoDispose(FirebaseGameClient.new);

// const String firebaseServer = 'firebase';
// List<Override> firebaseOverrides() => [
//       GameProviders.roundClientFamily(firebaseServer)
//           .overrideWithProvider(firebaseRoundClient),
//       GameProviders.gameClientFamily(firebaseServer)
//           .overrideWithProvider(firebaseGameClient),
//     ];

// mixin FirebaseDatabaseHelpers {
//   ProviderRef get ref;

//   FirebaseDatabase get firebaseDb =>
//       FirebaseDatabase(app: ref.read(firebaseAppProvider));

//   DatabaseReference get gamesReference => firebaseDb.reference().child('games');

//   DatabaseReference get allGames => firebaseDb.reference().child('allGames');

//   DatabaseReference game(GameCode code) => gamesReference.child(code);

//   DatabaseReference gameState(GameCode code) => game(code).child('state');

//   DatabaseReference gameConfig(GameCode code) => game(code).child('config');

//   DatabaseReference lobbyRef(GameCode code) => game(code).child('lobby');

//   DatabaseReference gamePlayersRef(GameCode code) =>
//       lobbyRef(code).child('players');

//   DatabaseReference playerGames(PlayerID player) =>
//       firebaseDb.reference().child('playerGames').child(player).child('games');

//   Future<GameInfo> lobbyFromFirebase(PlayerID playerID, GameCode game) async {
//     final info = await lobbyRef(game).get();
//     final json = info.value as Map<String, dynamic>;
//     json['creator'] = json['creator'] as PlayerID == playerID;
//     json['player'] ??= '';
//     return GameInfo.fromJson(json);
//   }
// }

// class FirebaseRoundClient extends RoundClient with FirebaseDatabaseHelpers {
//   FirebaseRoundClient(this.ref);

//   @override
//   final ProviderRef ref;
//   @override
//   void dispose() {}

//   @override
//   Future<bool> exitGame(PlayerID playerID, GameCode code) async => true;

//   @override
//   Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code) => game(code)
//       .onValue
//       .map((v) => GameInfo.fromJson(v.snapshot.value! as Map<String, dynamic>));

//   @override
//   Stream<GameOrError<Game<Event>>> gameStream(
//           PlayerID playerID, GameCode code) =>
//       firebaseDb.reference().child('games/$code/game').onValue.map((v) =>
//           GameOrError.fromJson(v.snapshot.value! as Map<String, dynamic>));

//   @override
//   Future<PlayerName?> joinGame(
//       PlayerID playerID, GameCode code, PlayerName name) async {
//     final result = await functions
//         .httpsCallable('joinGame')
//         .call({'playerID': playerID, 'code': code, 'name': name});
//     return result.data as PlayerName?;
//   }

//   @override
//   Future<bool> sendEvent(PlayerID playerID, GameCode code, Event event) async {
//     final result = await functions
//         .httpsCallable('sendEvent')
//         .call({'playerID': playerID, 'code': code, 'event': event.toJson()});
//     return result.data as bool;
//   }

//   @override
//   Future<bool> startGame(PlayerID playerID, GameCode code) async {
//     await lobbyRef(code).update({'status': GameStatus.started.name});
//     final config = await gameConfig(code).get();
//     final players = await lobbyRef(code).child('players').get();
//     await gameState(code).set(
//       Game.getInitialState(
//         GameConfig.fromJson(config.value as Map<String, dynamic>),
//         players as List<PlayerName>? ?? <PlayerName>[],
//       ),
//     );
//     return true;
//   }
// }

// class FirebaseGameClient extends GameClient with FirebaseDatabaseHelpers {
//   FirebaseGameClient(this.ref);

//   @override
//   final ProviderRef ref;
//   @override
//   @override
//   Future<GameCode> createGame(PlayerID playerID, GameConfig config) async {
//     final codes = (await allGames.get()).value as List? ?? [];
//     final newCode = generateGameID(codes.cast());
//     await allGames.set([...codes, newCode]);
//     await gameConfig(newCode).set(config.toJson());
//     await lobbyRef(newCode).set({
//       'players': [],
//       'gameType': config.gameType,
//       'status': GameStatus.lobby,
//       'gameId': newCode,
//       'creator': playerID,
//     });
//     final games = await playerGames(playerID).get();

//     await playerGames(playerID).set([...games.value as List? ?? [], newCode]);

//     return newCode;
//   }

//   @override
//   Future<bool> deleteGame(PlayerID playerID, GameCode code) async {
//     final games = await playerGames(playerID).get();
//     await playerGames(playerID).set((games.value as List? ?? [])..remove(code));
//     await game(code).remove();
//     final all = await allGames.get();
//     await allGames.set((all as List? ?? [])..remove(code));
//     return true;
//   }

//   @override
//   void dispose() {}

//   @override
//   Future<IList<GameInfo>> getGames(PlayerID playerID) async {
//     final gameCodes = await playerGames(playerID).get();
//     final infos = <GameInfo>[];
//     for (final game in gameCodes.value as List<GameCode>? ?? <GameCode>[]) {
//       infos.add(await lobbyFromFirebase(playerID, game));
//     }
//     return infos.lock;
//   }
// }
