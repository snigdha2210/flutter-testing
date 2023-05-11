import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter/main.dart';

void main() {
  testWidgets(
      'Username and Password error occur when we enter nothing for Username and Password',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(const MyApp());

    final usernameField = find.ancestor(
      of: find.text('Username'),
      matching: find.byType(TextFormField),
    );
    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFormField),
    );
    print('BEFORE');
    print(passwordField);
    print(usernameField);

    // Enter 'username' and 'password' into the Username and Password TextFormFields.
    await tester.enterText(usernameField, '');
    await tester.pumpAndSettle();
    await tester.enterText(passwordField, '');
    await tester.pumpAndSettle();
    print('AFTER');
    print(passwordField);
    print(usernameField);

    // Tap the Login Button.
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Expect to find the item on screen.
    expect(find.text('Username is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });

  testWidgets('No error occurs when we enter both Username and Password',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find Password TextFormField.
    final usernameField = find.ancestor(
      of: find.text('Username'),
      matching: find.byType(TextFormField),
    );
    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFormField),
    );

    print('BEFORE');
    print(passwordField);
    print(usernameField);
    // Enter 'username' and 'password' into the Username and Password TextFormFields.
    await tester.enterText(usernameField, 'username');
    await tester.pumpAndSettle();
    await tester.enterText(passwordField, 'password');
    await tester.pumpAndSettle();

    print('AFTER');
    print(passwordField);
    print(usernameField);
    // Tap the Login Button.
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Expect to find the item on screen.
    expect(find.text('Username is required'), findsNothing);
    expect(find.text('Password is required'), findsNothing);
  });

  // tearDown(() {
  //   print('Shared tearDown');
  // });
  // setUp(() {
  //   print('Shared setup');
  // });

  testWidgets('Username error occurs when we enter nothing for Username',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find Password TextFormField.
    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFormField),
    );
    final usernameField = find.ancestor(
      of: find.text('Username'),
      matching: find.byType(TextFormField),
    );

    // Enter 'password' into the Password TextFormField.
    await tester.enterText(passwordField, 'password');
    await tester.pumpAndSettle();
    await tester.enterText(usernameField, '');
    await tester.pumpAndSettle();

    // Tap the Login Button.
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Expect to find the item on screen.
    expect(find.text('Username is required'), findsOneWidget);
    expect(find.text('Password is required'), findsNothing);
  });

  testWidgets('Password error occurs when we enter nothing for Password',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find Password TextFormField.
    final usernameField = find.ancestor(
      of: find.text('Username'),
      matching: find.byType(TextFormField),
    );
    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFormField),
    );

    // Enter 'username' into the username TextFormField.
    await tester.enterText(usernameField, 'username');
    await tester.pumpAndSettle();
    await tester.enterText(passwordField, '');
    await tester.pumpAndSettle();

    // Tap the Login Button.
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Expect to find the item on screen.
    expect(find.text('Password is required'), findsOneWidget);
    expect(find.text('Username is required'), findsNothing);
  });
}
