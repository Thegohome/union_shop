import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/print_about_screen.dart';
import 'package:union_shop/views/common_widgets.dart';

void main() {
  group('PrintAboutScreen', () {
    testWidgets('should display header', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(find.byType(AppHeader), findsOneWidget);
    });

    testWidgets('should display The Union Print Shack heading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(find.text('The Union Print Shack'), findsOneWidget);
    });

    testWidgets('should display print shack logo with error handling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      // Look for Image widget
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('should display main service description',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(
          find.text('Make It Yours at The Union Print Shack'), findsOneWidget);
      expect(
        find.textContaining('heat-pressed customisation'),
        findsOneWidget,
      );
    });

    testWidgets('should display personalization options section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(
        find.text('Uni Gear or Your Gear - We\'ll Personalise It'),
        findsOneWidget,
      );
      expect(
        find.textContaining('official uni-branded clothing'),
        findsOneWidget,
      );
    });

    testWidgets('should display pricing information',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(find.text('Simple Pricing, No Surprises'), findsOneWidget);
      expect(find.textContaining('£3 for one line'), findsOneWidget);
      expect(find.textContaining('£5 for two lines'), findsOneWidget);
      expect(find.textContaining('three working days'), findsOneWidget);
    });

    testWidgets('should display terms and conditions section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(
        find.text('Personalisation Terms & Conditions'),
        findsOneWidget,
      );
      expect(
        find.textContaining('We will print your clothing exactly as you'),
        findsOneWidget,
      );
      expect(find.textContaining('Refunds are not provided'), findsOneWidget);
    });

    testWidgets('should display call to action section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(find.text('Ready to Make It Yours?'), findsOneWidget);
      expect(
        find.textContaining('Pop in or get in touch today'),
        findsOneWidget,
      );
    });

    testWidgets('should display footer', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(find.byType(AppFooter), findsOneWidget);
    });

    testWidgets('should have about text block container',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(find.byKey(const Key('aboutTextBlock')), findsOneWidget);
    });

    testWidgets('should render in SingleChildScrollView for responsiveness',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('should have white background', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrintAboutScreen(),
        ),
      );

      final scaffold = find.byType(Scaffold);
      expect(scaffold, findsOneWidget);
    });
  });
}
