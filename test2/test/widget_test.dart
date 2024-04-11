import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test2/main.dart';

void main() {
  testWidgets('SimpleLoginScreen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: SimpleLoginScreen()));

    // Find the email and password text fields
    expect(find.byKey(const Key('email_field')), findsOneWidget);
    expect(find.byKey(const Key('password_field')), findsOneWidget);

    // Verify that the login button is present
    expect(find.text('Log In'), findsOneWidget);

    // Enter some text in the email field
    await tester.enterText(find.byKey(const Key('email_field')), 'test@example.com');

    // Enter some text in the password field
    await tester.enterText(find.byKey(const Key('password_field')), 'password123');

    // Tap the login button
    await tester.tap(find.text('Log In'));

    // Wait for the UI to react
    await tester.pump();

    // You can add more assertions here based on the expected behavior after login button tap
  });
}
