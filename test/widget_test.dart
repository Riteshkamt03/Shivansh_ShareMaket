import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shivansh_app/main.dart';

void main() {
  testWidgets('Login page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the Login page is displayed by finding the text field and button.
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextField),
        findsNWidgets(2)); // Username and Password fields
    expect(find.byType(ElevatedButton), findsOneWidget); // Login button

    // Enter text into the username and password fields.
    await tester.enterText(find.byType(TextField).at(0), 'testuser');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

    // Tap the login button and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the navigation occurs (mocking the actual behavior might be needed here).
    // Here, we're just verifying the login button interaction, which typically would lead to another screen.

    // Since we don't have actual navigation or state management in place in the test environment,
    // you might need to mock or use integration tests to verify actual navigation.
    // This example assumes no navigation, just ensuring the button press event works.
    expect(find.text('Login'),
        findsOneWidget); // After tapping, it should still find 'Login'
  });
}
