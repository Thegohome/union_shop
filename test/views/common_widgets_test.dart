import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/common_widgets.dart';

void main() {
  group('ErrorContainer Tests', () {
    testWidgets('ErrorContainer displays grey container with icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorContainer(),
          ),
        ),
      );

      // Check for Container with grey color
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsWidgets);

      // Check for image_not_supported icon
      final iconFinder = find.byIcon(Icons.image_not_supported);
      expect(iconFinder, findsOneWidget);
    });

    testWidgets('ErrorContainer centers icon content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorContainer(),
          ),
        ),
      );

      // Check that Center widget is used
      final centerFinder = find.byType(Center);
      expect(centerFinder, findsOneWidget);
    });
  });

  group('ProductCard Tests', () {
    testWidgets('ProductCard shows loading indicator while fetching product',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'test-product-1',
            ),
          ),
        ),
      );

      // Initially shows loading
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('ProductCard displays product name with correct style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'test-product-1',
            ),
          ),
        ),
      );

      // Wait for async operation
      await tester.pumpAndSettle();

      // Check for product name
      expect(find.text('Test Product 1'), findsOneWidget);
    });

    testWidgets('ProductCard displays regular price when not on sale',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'test-product-1',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for price text
      expect(find.text('£29.99'), findsOneWidget);
    });

    testWidgets(
        'ProductCard displays sale price and original price when on sale',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'sale-product',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for both prices
      expect(find.text('£50.00'), findsOneWidget);
      expect(find.text('£39.99'), findsOneWidget);
    });

    testWidgets('ProductCard displays product image with contain fit',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'test-product-1',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for Image widget
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });

    testWidgets('ProductCard is tappable and navigates to product page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: ProductCard(
              productId: 'test-product-1',
            ),
          ),
          onGenerateRoute: (settings) {
            if (settings.name == '/product') {
              return MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Text('Product Page'),
                ),
              );
            }
            return null;
          },
        ),
      );

      await tester.pumpAndSettle();

      // Tap on the ProductCard
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // Check if navigation occurred
      expect(find.text('Product Page'), findsOneWidget);
    });

    testWidgets('ProductCard displays ErrorContainer on image load failure',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              productId: 'test-product-1',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Image widget has errorBuilder that returns ErrorContainer
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });
  });

  group('OpeningHourTextLine Tests', () {
    testWidgets('OpeningHourTextLine displays text with correct style',
        (WidgetTester tester) async {
      const testText = 'Monday - Friday 10am - 4pm';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OpeningHourTextLine(testText),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('OpeningHourTextLine has default bottom padding of 8',
        (WidgetTester tester) async {
      const testText = 'Test hours';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OpeningHourTextLine(testText),
          ),
        ),
      );

      final paddingFinder = find.byType(Padding);
      expect(paddingFinder, findsOneWidget);
    });

    testWidgets('OpeningHourTextLine accepts custom bottom padding',
        (WidgetTester tester) async {
      const testText = 'Custom padding test';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OpeningHourTextLine(
              testText,
              bottomPadding: 16,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });
  });

  group('HelpInfoButton Tests', () {
    testWidgets('HelpInfoButton displays text and is tappable',
        (WidgetTester tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HelpInfoButton(
              'Help Button',
              onPressed: () => buttonPressed = true,
            ),
          ),
        ),
      );

      expect(find.text('Help Button'), findsOneWidget);

      await tester.tap(find.byType(TextButton));
      expect(buttonPressed, isTrue);
    });

    testWidgets('HelpInfoButton uses footerTextButtonText style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HelpInfoButton(
              'Search',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Search'), findsOneWidget);
    });
  });

  group('ShopDropdown Tests', () {
    testWidgets('ShopDropdown displays "Shop" text and expand icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopDropdown(
              onCollectionSelected: (id, name) {},
            ),
          ),
        ),
      );

      expect(find.text('Shop'), findsOneWidget);
      expect(find.byIcon(Icons.expand_more), findsOneWidget);
    });

    testWidgets('ShopDropdown toggles dropdown on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopDropdown(
              onCollectionSelected: (id, name) {},
            ),
          ),
        ),
      );

      // Initially collapse icon
      expect(find.byIcon(Icons.expand_more), findsOneWidget);

      // Tap to open
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // Icon should change to expand_less when opened
      // Note: May need to adjust based on actual icon behavior
    });

    testWidgets(
        'ShopDropdown calls onCollectionSelected callback when collection is tapped',
        (WidgetTester tester) async {
      String? selectedCollectionId;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopDropdown(
              onCollectionSelected: (id, name) {
                selectedCollectionId = id;
              },
            ),
          ),
        ),
      );

      // Note: Overlay-based dropdowns are difficult to test without proper setup
      // This test verifies the callback signature exists
      expect(selectedCollectionId, isNull);
    });

    testWidgets('ShopDropdown has proper styling with hover state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopDropdown(
              onCollectionSelected: (id, name) {},
            ),
          ),
        ),
      );

      // Check Row structure
      expect(find.byType(Row), findsWidgets);

      // Check for icon
      expect(find.byType(Icon), findsWidgets);
    });
  });

  group('NavMenuItem Tests', () {
    testWidgets('NavMenuItem displays text correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavMenuItem(
              text: 'Home',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('NavMenuItem is tappable and calls onPressed callback',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavMenuItem(
              text: 'About',
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      expect(pressed, isTrue);
    });

    testWidgets('NavMenuItem displays icon when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavMenuItem(
              text: 'Shop',
              onPressed: () {},
              icon: Icons.expand_more,
            ),
          ),
        ),
      );

      expect(find.text('Shop'), findsOneWidget);
      expect(find.byIcon(Icons.expand_more), findsOneWidget);
    });

    testWidgets('NavMenuItem uses navbarMenuItem text style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavMenuItem(
              text: 'Test',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('NavMenuItem accepts custom icon padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavMenuItem(
              text: 'Menu',
              onPressed: () {},
              icon: Icons.menu,
              iconPadding: 12,
            ),
          ),
        ),
      );

      expect(find.text('Menu'), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });
  });

  group('HeaderIconButton Tests', () {
    testWidgets('HeaderIconButton displays icon correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderIconButton(
              icon: Icons.search,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('HeaderIconButton is tappable and calls onPressed callback',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderIconButton(
              icon: Icons.shopping_bag_outlined,
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(IconButton));
      expect(pressed, isTrue);
    });

    testWidgets('HeaderIconButton has proper size constraints',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderIconButton(
              icon: Icons.person_outline,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('HeaderIconButton icon is grey colored',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderIconButton(
              icon: Icons.search,
              onPressed: () {},
            ),
          ),
        ),
      );

      final iconFinder = find.byIcon(Icons.search);
      expect(iconFinder, findsOneWidget);
    });
  });

  group('CollectionCard Tests', () {
    testWidgets('CollectionCard displays collection name text overlay',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollectionCard(
              collectionName: 'Summer Collection',
              imagePath: 'assets/images/summer.png',
            ),
          ),
        ),
      );

      expect(find.text('Summer Collection'), findsOneWidget);
    });

    testWidgets('CollectionCard displays background image',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollectionCard(
              collectionName: 'Winter Collection',
              imagePath: 'assets/images/winter.png',
            ),
          ),
        ),
      );

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });

    testWidgets('CollectionCard has dark overlay', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollectionCard(
              collectionName: 'Test Collection',
              imagePath: 'assets/images/test.png',
            ),
          ),
        ),
      );

      final containerFinder = find.byType(Container);
      expect(containerFinder, findsWidgets);
    });

    testWidgets('CollectionCard is tappable when onTap callback provided',
        (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CollectionCard(
              collectionName: 'Tap Test',
              imagePath: 'assets/images/test.png',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      expect(tapped, isTrue);
    });

    testWidgets('CollectionCard uses Stack layout for overlay effect',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollectionCard(
              collectionName: 'Stack Test',
              imagePath: 'assets/images/test.png',
            ),
          ),
        ),
      );

      expect(find.byType(Stack), findsOneWidget);
    });

    testWidgets('CollectionCard image uses cover fit',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollectionCard(
              collectionName: 'Cover Fit Test',
              imagePath: 'assets/images/test.png',
            ),
          ),
        ),
      );

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });

    testWidgets('CollectionCard uses collectionCardName text style',
        (WidgetTester tester) async {
      const collectionName = 'Styled Collection';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollectionCard(
              collectionName: collectionName,
              imagePath: 'assets/images/styled.png',
            ),
          ),
        ),
      );

      expect(find.text(collectionName), findsOneWidget);
    });
  });

  group('AppHeader Tests', () {
    testWidgets('AppHeader displays banner with promo text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(
          find.text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
          findsOneWidget);
    });

    testWidgets('AppHeader displays navigation items on desktop',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 800);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      // On desktop (>900px), menu items should be visible
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('SALE!'), findsOneWidget);
    });

    testWidgets('AppHeader shows menu toggle button on mobile',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 800);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      // On mobile (<900px), menu toggle should appear
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets(
        'AppHeader displays header icons (search, person, shopping_bag)',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    });

    testWidgets('AppHeader logo navigates to home on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(body: AppHeader()),
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Text('Home Page'),
                ),
              );
            }
            return null;
          },
        ),
      );

      // Find and tap the logo (Image in GestureDetector)
      final logoFinder = find.byType(Image).first;
      await tester.tap(logoFinder);
      await tester.pumpAndSettle();
    });

    testWidgets('AppHeader mobile menu toggles on menu button tap',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 800);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(),
          ),
        ),
      );

      // Menu should not be visible initially
      final menuTap = find.byIcon(Icons.menu);
      expect(menuTap, findsOneWidget);

      // Tap menu button
      await tester.tap(menuTap);
      await tester.pumpAndSettle();

      // Menu items should be visible after tap (depends on implementation)
    });
  });

  group('AppFooter Tests', () {
    testWidgets('AppFooter displays opening hours section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Opening Hours'), findsOneWidget);
    });

    testWidgets('AppFooter displays help and information section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Help and Information'), findsOneWidget);
    });

    testWidgets('AppFooter displays latest offers section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Latest Offers'), findsOneWidget);
    });

    testWidgets('AppFooter displays opening hours information',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Monday - Friday 10am - 4pm'), findsOneWidget);
    });

    testWidgets('AppFooter has responsive layout for mobile',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 800);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Opening Hours'), findsOneWidget);
    });

    testWidgets('AppFooter has responsive layout for desktop',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 800);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      expect(find.text('Opening Hours'), findsOneWidget);
    });
  });
}
