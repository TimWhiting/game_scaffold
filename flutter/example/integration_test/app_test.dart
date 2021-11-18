// This is a basic Flutter integration test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:example/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

const p1Create = Key('Create Game Button 0');

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  String getGameId(WidgetTester tester) {
    final text = tester.widget<Text>(find.textContaining('gameId:'));
    final codestart = text.data!.indexOf('gameId:') + 'gameId:'.length + 1;
    return text.data!.substring(codestart, codestart + 4);
  }

  testWidgets('Playing Tic Tac Toe Works', (tester) async {
    app.main();
    // Create a Game
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(p1Create));
    await tester.pumpAndSettle();
    // Get the Game ID
    final gameId = getGameId(tester);
    await tester.enterText(find.byType(TextField), gameId);
    await tester.pumpAndSettle();
    // 2nd Player Join Game
    await tester.tap(find.text('Join Game'));
    await tester.pumpAndSettle();
    for (var i = 0; i < 5; i++) {
      final playerId = i % 2;
      final row = i % 2;
      final col = i % 3;
      await tester.tap(find.byKey(Key('$playerId square $row $col')));
      await tester.pumpAndSettle();
    }
    expect(find.textContaining('BetweenRounds'), findsNWidgets(2));
    await tester.tap(find.text('Next Round').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next Round').first);
    await tester.pumpAndSettle();
    for (var i = 0; i < 5; i++) {
      final playerId = (i + 1) % 2;
      final row = i % 2;
      final col = i % 3;
      await tester.tap(find.byKey(Key('$playerId square $row $col')));
      await tester.pumpAndSettle();
    }
    expect(find.textContaining('BetweenRounds'), findsNWidgets(2));
    await tester.tap(find.text('Next Round').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next Round').first);
    await tester.pumpAndSettle();
    for (var i = 0; i < 5; i++) {
      final playerId = i % 2;
      final row = i % 2;
      final col = i % 3;
      await tester.tap(find.byKey(Key('$playerId square $row $col')));
      await tester.pumpAndSettle();
    }
    expect(find.textContaining('Finished'), findsNWidgets(2));
  });
}
