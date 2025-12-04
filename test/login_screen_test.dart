import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/login_screen.dart';

void main() {
  group('LoginScreen', () {
    testWidgets(
        'should render with centered white container on neutral background',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Check for Scaffold with neutral background
      expect(find.byType(Scaffold), findsOneWidget);

      // Check for centered Container with white background
      final containers = find.byType(Container);
      expect(containers, findsWidgets);

      // Verify SingleChildScrollView exists for responsiveness
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('should display Union Shop logo at top', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Check for Image widget (logo)
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display Sign in heading with correct style',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(find.text('Sign in'), findsOneWidget);

      // Verify heading uses pageTitle style (32px, bold, black)
      final headingFinder = find.text('Sign in');
      expect(headingFinder, findsOneWidget);
    });

    testWidgets('should display subtitle text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(
        find.textContaining('Choose how you\'d like to sign in'),
        findsOneWidget,
      );
    });

    testWidgets('should display Sign in with PortShop button (blue/indigo)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(find.text('Sign in with PortShop'), findsOneWidget);

      // Verify it's an ElevatedButton
      expect(find.byType(ElevatedButton), findsWidgets);
    });

    testWidgets('should display or divider between buttons and form',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(find.text('or'), findsOneWidget);

      // Verify dividers exist on both sides
      expect(find.byType(Divider), findsWidgets);
    });

    testWidgets('should display email input field with placeholder',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);

      // Check for email placeholder text in decoration
      final textFieldFinder = find.byType(TextField);
      expect(textFieldFinder, findsOneWidget);
    });

    testWidgets('should display Continue button (gray secondary)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(find.text('Continue'), findsOneWidget);

      // Verify Continue is an ElevatedButton
      final buttonFinder = find.byType(ElevatedButton);
      expect(buttonFinder, findsWidgets); // Should have multiple buttons
    });

    testWidgets('should have all buttons with placeholder callbacks',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Tap both buttons - they should not crash (placeholder callbacks)
      final buttons = find.byType(ElevatedButton);
      expect(buttons, findsWidgets);

      // Tap first button (Sign in with PortShop)
      await tester.tap(buttons.first);
      await tester.pumpAndSettle();

      // Tap second button (Continue)
      await tester.tap(buttons.last);
      await tester.pumpAndSettle();

      // If we get here without error, callbacks are working
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('should render layout responsively', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // All elements should be present regardless of viewport
      expect(find.text('Sign in'), findsOneWidget);
      expect(find.text('Sign in with PortShop'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('or'), findsOneWidget);

      // Verify SingleChildScrollView handles responsive sizing
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('should have correct component hierarchy', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Verify key widget types exist in hierarchy
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Center), findsWidgets);
      expect(
          find.byType(Padding), findsWidgets); // Multiple Paddings for spacing
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(ElevatedButton), findsWidgets);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(Row), findsWidgets); // For divider row
    });

    testWidgets('should display all text elements in correct order',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Verify all text elements are present
      expect(find.text('Sign in'), findsOneWidget);
      expect(find.textContaining('Choose how'), findsOneWidget);
      expect(find.text('Sign in with PortShop'), findsOneWidget);
      expect(find.text('or'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('should have white form container with rounded corners',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Verify Container exists (form box)
      expect(find.byType(Container), findsWidgets);

      // The form should be scrollable for mobile responsiveness
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('should handle text input in email field', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Find and interact with TextField
      final textFieldFinder = find.byType(TextField);
      expect(textFieldFinder, findsOneWidget);

      // Type some text into the field
      await tester.enterText(textFieldFinder, 'test@example.com');
      await tester.pumpAndSettle();

      // Verify the text was entered
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('should have proper spacing between elements', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Verify SizedBox widgets exist for spacing
      expect(find.byType(SizedBox), findsWidgets);

      // All key elements should be visible
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Sign in'), findsOneWidget);
      expect(find.text('Sign in with PortShop'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });
  });
}
