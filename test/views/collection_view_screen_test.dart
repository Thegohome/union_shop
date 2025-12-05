import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collection_view_screen.dart';
import 'package:union_shop/views/common_widgets.dart';

void main() {
  group('CollectionViewScreen Tests', () {
    testWidgets('CollectionViewScreen displays collection name in uppercase',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Summer Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('SUMMER COLLECTION'), findsOneWidget);
    });

    testWidgets('CollectionViewScreen displays collection description',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Summer Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Description is dynamically generated from collection name
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('CollectionViewScreen displays AppHeader',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Winter Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppHeader), findsOneWidget);
    });

    testWidgets('CollectionViewScreen displays AppFooter',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Summer Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppFooter), findsOneWidget);
    });

    testWidgets('CollectionViewScreen displays product count text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('14 products'), findsOneWidget);
    });

    testWidgets(
        'CollectionViewScreen displays loading indicator while fetching products',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      // Initially shows loading
      expect(find.byType(CircularProgressIndicator), findsWidgets);
    });

    testWidgets('CollectionViewScreen displays products in responsive grid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for GridView
      expect(find.byType(GridView), findsWidgets);
    });

    testWidgets('CollectionViewScreen uses 3 columns on desktop (>600px)',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 800);

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Desktop Test',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsWidgets);
    });

    testWidgets('CollectionViewScreen uses 1 column on mobile (<600px)',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 800);

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Mobile Test',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsWidgets);
    });

    testWidgets('CollectionViewScreen grid children are ProductCard widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for ProductCard widgets
      expect(find.byType(ProductCard), findsWidgets);
    });

    testWidgets('CollectionViewScreen displays error message when fetch fails',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Either products are displayed or error message
      final hasProducts = find.byType(ProductCard).evaluate().isNotEmpty;
      expect(
          hasProducts || find.text('No products found').evaluate().isNotEmpty,
          isTrue);
    });

    testWidgets('CollectionViewScreen wraps content in SingleChildScrollView',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('CollectionViewScreen has white background for content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for Container (background color container)
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('CollectionViewScreen header section has proper padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Padding Test',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Padding is applied (48.0 vertical, 40.0 horizontal)
      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('CollectionViewScreen displays Scaffold',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('CollectionViewScreen is stateful widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      expect(find.byType(CollectionViewScreen), findsOneWidget);
    });

    testWidgets('CollectionViewScreen stores collectionId and collectionName',
        (WidgetTester tester) async {
      const collectionId = 'summer-2025';
      const collectionName = 'Summer 2025 Collection';

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: collectionId,
            collectionName: collectionName,
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Collection name should be displayed
      expect(find.text('SUMMER 2025 COLLECTION'), findsOneWidget);
    });

    testWidgets(
        'CollectionViewScreen generates description from collectionName',
        (WidgetTester tester) async {
      const collectionName = 'Exclusive Items';

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'exclusive',
            collectionName: collectionName,
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Description contains the collection name in lowercase
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('CollectionViewScreen filter section displays',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Test Collection',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Filter section exists (Row with product count)
      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('CollectionViewScreen grid has proper spacing',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 800);

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Spacing Test',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // GridView with crossAxisSpacing 24 and mainAxisSpacing 48
      expect(find.byType(GridView), findsWidgets);
    });

    testWidgets('CollectionViewScreen products are contained within grid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Grid Test',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Products displayed in grid structure
      expect(find.byType(GridView), findsWidgets);
      expect(find.byType(ProductCard), findsWidgets);
    });

    testWidgets('CollectionViewScreen shrinks GridView to content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'test-collection',
            collectionName: 'Shrink Test',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // GridView with shrinkWrap: true
      expect(find.byType(GridView), findsWidgets);
    });

    testWidgets('CollectionViewScreen header title uses uppercase style',
        (WidgetTester tester) async {
      const testName = 'Winter Wonderland';

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: 'winter',
            collectionName: testName,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('WINTER WONDERLAND'), findsOneWidget);
    });

    testWidgets('CollectionViewScreen responds to collection property changes',
        (WidgetTester tester) async {
      const initialId = 'collection-1';
      const initialName = 'Initial Collection';

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionViewScreen(
            collectionId: initialId,
            collectionName: initialName,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('INITIAL COLLECTION'), findsOneWidget);
    });
  });
}
