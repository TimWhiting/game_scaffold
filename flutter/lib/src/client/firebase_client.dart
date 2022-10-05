// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:game_scaffold_dart/game_scaffold_dart.dart';

// final firebaseAppProvider = FutureProvider((ref) => Firebase.initializeApp());
// final firebaseRoundClient =
//     Provider.autoDispose((ref) => FirebaseRoundClient(ref));
// final firebaseGameClient =
//     Provider.autoDispose((ref) => FirebaseGameClient(ref));

// const String firebaseServer = 'firebase';
// List<Override> firebaseOverrides() => [
//       GameProviders.roundClientFamily(firebaseServer)
//           .overrideWithProvider(firebaseRoundClient),
//       GameProviders.gameClientFamily(firebaseServer)
//           .overrideWithProvider(firebaseGameClient),
//     ];

// class FirebaseRoundClient extends RoundClient {
//   FirebaseRoundClient(this.ref);

//   final ProviderRef ref;
//   FirebaseFunctions get functions =>
//       FirebaseFunctions.instanceFor(app: ref.read(firebaseAppProvider).value);
//   FirebaseDatabase get firebaseDb =>
//       FirebaseDatabase.instanceFor(app: ref.read(firebaseAppProvider).value!);
//   @override
//   void dispose() {}

//   @override
//   Future<bool> exitGame(PlayerID playerID, GameCode code) async => true;

//   @override
//   Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code) => firebaseDb
//       .ref('games/$code/lobby')
//       .onValue
//       .map((v) => GameInfo.fromJson(v.snapshot.value! as Map<String, dynamic>));

//   @override
//   Stream<GameOrError<Game<Event>>> gameStream(
//           PlayerID playerID, GameCode code) =>
//       firebaseDb.ref('games/$code/game').onValue.map((v) =>
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
//     final result = await functions
//         .httpsCallable('startGame')
//         .call({'playerID': playerID, 'code': code});
//     return result.data as bool;
//   }
// }

// class FirebaseGameClient extends GameClient {
//   FirebaseGameClient(this.ref);

//   final ProviderRef ref;
//   FirebaseFunctions get functions =>
//       FirebaseFunctions.instanceFor(app: ref.read(firebaseAppProvider).value);

//   @override
//   Future<GameCode> createGame(PlayerID playerID, GameConfig config) async {
//     final result = await functions
//         .httpsCallable('createGame')
//         .call({'playerID': playerID, 'config': config.toJson()});
//     return result.data as GameCode;
//   }

//   @override
//   Future<bool> deleteGame(PlayerID playerID, GameCode code) async {
//     final result = await functions
//         .httpsCallable('deleteGame')
//         .call({'playerID': playerID, 'code': code});
//     return result.data as bool;
//   }

//   @override
//   void dispose() {}

//   @override
//   Future<IList<GameInfo>> getGames(PlayerID playerID) async {
//     final result =
//         await functions.httpsCallable('getGames').call({'playerID': playerID});
//     return (result.data as List)
//         .map((e) => GameInfo.fromJson(e as Map<String, dynamic>))
//         .toIList();
//   }
// }
