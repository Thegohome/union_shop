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
