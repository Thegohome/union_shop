import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/about_screen.dart';

void main() {
  group('AboutScreen', () {
    testWidgets('should display header', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('should display About Us heading', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.text('About Us'), findsOneWidget);
    });

    testWidgets('should display about text block', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.byKey(const Key('aboutTextBlock')), findsOneWidget);
      expect(
        find.textContaining('Welcome to the Union Shop'),
        findsOneWidget,
      );
      expect(
        find.textContaining('hello@upsu.net'),
        findsOneWidget,
      );
    });

    testWidgets('should display footer', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutScreen(),
        ),
      );

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);
    });
  });
}
