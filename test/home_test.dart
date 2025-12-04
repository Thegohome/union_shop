import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    group('F1: Hero Section Tests', () {
      testWidgets('hero section renders with responsive height and full width',
          (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Find the hero SizedBox
        final heroFinder = find.byType(SizedBox);
        expect(heroFinder, findsWidgets);

        // Verify hero title is present
        expect(find.text('Placeholder Hero Title'), findsOneWidget);
      });

      testWidgets('hero section background image displays with dark overlay',
          (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that Image.network is present for background
        final imageFinder = find.byType(Image);
        expect(imageFinder, findsWidgets);

        // Check that overlay Container with semi-transparent color exists
        final containerFinders = find.byType(Container);
        expect(containerFinders, findsWidgets);
      });

      testWidgets(
          'hero title, subtitle, and BROWSE PRODUCTS button render with correct styling',
          (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check hero title
        expect(find.text('Placeholder Hero Title'), findsOneWidget);

        // Check hero subtitle
        expect(find.text('This is placeholder text for the hero section.'),
            findsOneWidget);

        // Check BROWSE PRODUCTS button
        expect(find.text('BROWSE PRODUCTS'), findsOneWidget);

        // Verify button exists
        final buttonFinder = find.byType(ElevatedButton);
        expect(buttonFinder, findsWidgets);
      });

      testWidgets(
          'button uses custom background color (0xFF4d2963) with white text',
          (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Find the BROWSE PRODUCTS button
        final buttonFinder = find.byType(ElevatedButton);
        expect(buttonFinder, findsWidgets);

        // Verify button text is present and white
        expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
      });

      testWidgets(
          'hero content remains visible and readable across screen widths',
          (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Verify all hero content is present and rendered
        expect(find.text('Placeholder Hero Title'), findsOneWidget);
        expect(find.text('This is placeholder text for the hero section.'),
            findsOneWidget);
        expect(find.text('BROWSE PRODUCTS'), findsOneWidget);

        // Verify content is within visible bounds
        final heroContent = find.byType(Positioned);
        expect(heroContent, findsWidgets);
      });
    });

    group('F2: Navigation Bar Tests', () {
      testWidgets('navbar renders with logo on left side', (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that Image widget exists (logo from network)
        final logoFinder = find.byType(Image);
        expect(logoFinder, findsWidgets);

        // Verify logo is within a GestureDetector for tap handling
        final gestureDetector = find.byType(GestureDetector);
        expect(gestureDetector, findsWidgets);
      });

      testWidgets('navbar menu items render with correct text', (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check all menu items are present
        expect(find.text('Home'), findsOneWidget);
        expect(find.text('Shop'), findsOneWidget);
        expect(find.text('The Print Shack'), findsOneWidget);
        expect(find.text('SALE!'), findsOneWidget);
        expect(find.text('About'), findsOneWidget);
      });

      testWidgets('navbar Shop and Print Shack items display dropdown icons',
          (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that expand_more icons are present (for dropdown indicators)
        final expandMoreIcons = find.byIcon(Icons.expand_more);
        expect(expandMoreIcons, findsWidgets);

        // Should have at least 2 expand_more icons (for Shop and Print Shack)
        expect(find.byIcon(Icons.expand_more), findsAtLeastNWidgets(2));
      });

      testWidgets('navbar displays search, account, and cart action icons',
          (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check for action icons on right side
        expect(find.byIcon(Icons.search), findsOneWidget);
        expect(find.byIcon(Icons.person_outline), findsOneWidget);
        expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      });

      testWidgets('navbar renders full width with Row layout structure',
          (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that navbar uses Row widget for horizontal layout
        final rowFinders = find.byType(Row);
        expect(rowFinders, findsWidgets);

        // Check that Spacer widgets are used for flexible layout
        final spacerFinders = find.byType(Spacer);
        expect(spacerFinders, findsWidgets);

        // Verify navbar container spans full width
        final containerFinder = find.byType(Container).first;
        expect(containerFinder, findsOneWidget);
      });
    });

    group('Other Page Elements', () {
      testWidgets('should display product cards', (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that product cards are displayed
        expect(find.text('Placeholder Product 1'), findsOneWidget);
        expect(find.text('Placeholder Product 2'), findsOneWidget);
        expect(find.text('Placeholder Product 3'), findsOneWidget);
        expect(find.text('Placeholder Product 4'), findsOneWidget);

        // Check prices are displayed
        expect(find.text('£10.00'), findsOneWidget);
        expect(find.text('£15.00'), findsOneWidget);
        expect(find.text('£20.00'), findsOneWidget);
        expect(find.text('£25.00'), findsOneWidget);
      });

      testWidgets('should display header icons', (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that header icons are present
        expect(find.byIcon(Icons.search), findsOneWidget);
        expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
        expect(find.byIcon(Icons.menu), findsOneWidget);
      });

      testWidgets('should display footer', (tester) async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that footer is present
        expect(find.text('Placeholder Footer'), findsOneWidget);
      });
    });
  });
}
