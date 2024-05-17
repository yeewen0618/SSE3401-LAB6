import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sse3401_lab5/main.dart' as app;

void main() {
  group('app test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('full app test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final contactTextField = find.byType(TextField).first;
      await tester.enterText(contactTextField, "11113628550");
      await tester.pumpAndSettle();

      final myCheckbox = find.byKey(Key('myCheckbox'));
      await tester.tap(myCheckbox);
      await tester.pumpAndSettle();

      final getCodeButton = find.byKey(Key('getCode'));
      await tester.tap(getCodeButton);
      await tester.pumpAndSettle();

      final otpTextField = find.byKey(Key('otp'));
      await tester.enterText(otpTextField, '123456');
      await tester.pumpAndSettle();

      final activateButton = find.byKey(Key('activate'));
      await tester.tap(activateButton);
      await tester.pumpAndSettle();

      final factory1 = find.byKey(Key('factory1'));
      final factory2 = find.byKey(Key('factory2'));

      expect(find.byKey(Key('factory1')), findsOneWidget);
      expect(find.byKey(Key('factory2')), findsOneWidget);
      expect(find.byKey(Key('factory3')), findsOneWidget);

      await tester.tap(factory1);
      await tester.pumpAndSettle();

      await tester.tap(factory2);
      await tester.pumpAndSettle();

      final personButton = find.byKey(Key('person'));
      await tester.tap(personButton);
      await tester.pumpAndSettle();

      final addButton = find.byKey(Key('add'));
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      final userTextField = find.byKey(Key('userName'));
      await tester.enterText(userTextField, "yeewen");
      await tester.pumpAndSettle();

      final phoneTextField = find.byKey(Key('phoneNumber'));
      await tester.enterText(phoneTextField, "01111362855");
      await tester.pumpAndSettle();

      final submitButton = find.byKey(Key('submit'));
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      final homeButton = find.byKey(Key('home'));
      await tester.tap(homeButton);
      await tester.pumpAndSettle();

      final settingsButton = find.byKey(Key('settings'));
      await tester.tap(settingsButton);
      await tester.pumpAndSettle();
    });
  });
}
