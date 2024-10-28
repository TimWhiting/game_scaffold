import 'dart:async';

import 'package:macros/macros.dart';
import 'game.dart';

// Extensions on Game
// Annotated on a class implementing Game<GameAction> and annotated with freezed
// void start(IList<Player> players);
//   calling augmented.start();
//   but setting up some basic things tracking the generic player state
// final GameType type;
// final GameStatus status;
// final int round;
// final DateTime time;
// final Rewards rewards;
// final IList<Player> players; // Generic info about players
// final IList<PlayerID> readyPlayers; // For between rounds
// 
// Registers the game, events, serialization, next functions with the game registry
// static register();
//
// augments next(action)
//   if betweenRounds && readyNextRound event add player to ready
//   check if game is over, or round is over if so return
//   augmented.super()
//   and after the action, 
//     if an error, return playererror with playerId of the action
//     update the time,
//     check if round is over, if so go to betweenRounds
//
// augments nextRound() 
//   check if game is over if so return
//   otherwise 
//     ensure everyone is ready
//     augmented.super()
//     calculate and integrate rewards
//     reset the ready players
macro class GameGenerics implements ClassDeclarationsMacro {
  const GameGenerics({required this.type, required this.name});
  final GameType type;
  final GameName name;

  @override
  FutureOr<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) {
    // TODO: implement buildDeclarationsForClass
    // throw UnimplementedError();
  }
  
} 

extension on String {
  String capitalize() => this[0].toUpperCase() + this.substring(1);
}
macro class PlayerGenerics implements ClassTypesMacro, ClassDeclarationsMacro, ClassDefinitionMacro {
  const PlayerGenerics();
  
  @override
  FutureOr<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) {
    
  }
  
  @override
  FutureOr<void> buildDefinitionForClass(ClassDeclaration clazz, TypeDefinitionBuilder builder) {
    builder.buildConstructor(
      
    );
  }
  
  @override
  FutureOr<void> buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder) {}
}
// Adds readyNextRound event 
// Add playerID to all events
macro class EventGenerics implements ClassTypesMacro, ClassDeclarationsMacro, ClassDefinitionMacro {
  const EventGenerics({required this.type});
  final GameType type;
  
  @override
  FutureOr<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    builder.declareInType(DeclarationCode.fromParts([
        'factory ${type}Event.readyNextRound({required PlayerID playerID}) = ${type}ReadyNextRound;'
    ]));
  }
  
  @override
  FutureOr<void> buildDefinitionForClass(ClassDeclaration clazz, TypeDefinitionBuilder builder) async {
    // builder.buildConstructor(clazz.identifier);
    final constr = await builder.constructorsOf(clazz);
    for (final c in constr) {
      if (c.identifier.name == '' || c.identifier.name == 'readyNextRound') continue;
      final constrBuilder = await builder.buildConstructor(c.identifier);
      constrBuilder.augment(
          body: FunctionBodyCode.fromParts([
          ' => ',
          c.definingType.name + c.identifier.name.capitalize(),
          '('
          , ...[for (final np in c.namedParameters) ...[np.name, ':', np.name, ',']],
          ');'
        ]));
      
    }
  }
  
  @override
  FutureOr<void> buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder) async {
     builder.declareType('ReadyNextRound', DeclarationCode.fromParts([
        'final class ${type}ReadyNextRound extends ${clazz.identifier.name} {\n'
        ,'  ${type}ReadyNextRound({required this.playerID});\n'
        ,'  final PlayerID playerID;\n'
        ,'  final GameType type = "$type";\n'
        ,'  JsonMap toJson(){\n'
        ,'    return {"type": "$type", "eventType": "${type}ReadyNextRound", "playerID": playerID};\n'
        ,'  }\n'
        ,'}\n'
    ]));

    // for (final c in constr){
    //   builder.declareType(DeclarationCode.fromParts([
    //     'final class ', (c.identifier.name == '') ? c.definingType.name + 'Basic' : c.identifier.name, ' {\n',
    //     for (final p in c.namedParameters) ...[
    //       '  final ', p.type.code, ' ', p.name, ';\n'
    //     ],
    //     '  ', c.identifier.name,
    //     '({',
    //     for (final p in c.namedParameters) ...[
    //       'required this.', p.name, ','
    //     ],
    //     '});\n'
    //     ,'}\n'
    //   ]));
    // }
  }
}

/// Represents a generic game, with common fields that can be manipulated by
/// common [GenericEvent]s
///
/// Includes
/// * List of [players]
/// * The [time] of the last game update
/// * The current [status]
/// * The current [round]
// class GenericGame with _$GenericGame {
//   const factory GenericGame({
//     required DateTime time,
//     required GameStatus status,
//     required int round,
//     @Default(IListConst([])) IList<Player> players,
//     @Default(IListConst([])) IList<PlayerID> readyPlayers,
//   }) = _GenericGame;
//   const GenericGame._();

//   factory GenericGame.fromJson(Map<String, dynamic> map) =>
//       _$GenericGameFromJson(map);

//   /// Creates a default initialized game with [players]
//   factory GenericGame.start(IList<Player> players) => GenericGame(
//         players: players,
//         readyPlayers: <PlayerID>[].lock,
//         time: DateTime.now(),
//         status: GameStatus.started,
//         round: 0,
//       );

//   /// Gets whether the game is over
//   bool get gameOver => status == GameStatus.finished;

//   /// Gets whether the round is over
//   bool get roundOver => status == GameStatus.betweenRounds;

//   /// Returns a copy of the [GenericGame] with the time updated to the current time
//   GenericGame updateTime() => copyWith(time: DateTime.now());

//   /// Returns a copy of the [GenericGame] with the [round] incremented,
//   /// [status] set to [GameStatus.started]
//   GenericGame finishRound() =>
//       copyWith(round: round + 1, status: GameStatus.started);

//   /// Returns a copy of the [GenericGame] with the [status] updated to [status]
//   GenericGame updateStatus(GameStatus status) => copyWith(status: status);

//   /// Shuffles the player list
//   GenericGame shufflePlayers() => copyWith(players: players.shuffle());

//   /// Clears the list of ready players
//   GenericGame clearReadyPlayers() => copyWith(readyPlayers: <PlayerID>[].lock);

//   /// Adds a ready player to the list
//   GenericGame addReadyPlayer(PlayerID player) =>
//       copyWith(readyPlayers: readyPlayers.add(player));
// }
