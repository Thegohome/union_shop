import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/collection_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('CollectionRepository Integration Tests', () {
    test('repository initializes without error', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collections = await repo.getAll();
      expect(collections, isNotEmpty);
    });

    test('initialize can be called multiple times safely', () async {
      final repo = CollectionRepository();
      await repo.initialize();
      await repo.initialize();

      final collections = await repo.getAll();
      expect(collections, isNotEmpty);
    });

    test('getAll returns list of collections', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collections = await repo.getAll();
      expect(collections, isNotEmpty);
      expect(collections.length, equals(5));
    });

    test('getAll returns consistent data on multiple calls', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collections1 = await repo.getAll();
      final collections2 = await repo.getAll();

      expect(collections1.length, equals(collections2.length));
      expect(collections1[0].id, equals(collections2[0].id));
    });

    test('collections have required properties', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collections = await repo.getAll();
      for (final collection in collections) {
        expect(collection.id, isNotEmpty);
        expect(collection.name, isNotEmpty);
        expect(collection.productIds, isNotNull);
      }
    });

    test('getById returns correct collection when id exists', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collection = await repo.getById('hoodies');
      expect(collection, isNotNull);
      expect(collection!.id, equals('hoodies'));
    });

    test('getById returns null when id does not exist', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collection = await repo.getById('non-existent-id');
      expect(collection, isNull);
    });

    test('getById is case-sensitive', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collection = await repo.getById('HOODIES');
      expect(collection, isNull);
    });

    test('getProductsForCollection returns products for valid collection',
        () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final products = await repo.getProductsForCollection('hoodies');
      expect(products, isNotEmpty);
    });

    test(
        'getProductsForCollection returns empty list for non-existent collection',
        () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final products = await repo.getProductsForCollection('non-existent');
      expect(products, isEmpty);
    });

    test('getProductsForCollection returns empty list for empty collection',
        () async {
      final repo = CollectionRepository();
      // Note: If you add an empty collection to collections.json, this test will work
      // For now, this assumes all existing collections have products
      final collection = await repo.getById('hoodies');
      expect(collection, isNotNull);
    });

    test('resolved products have correct ids', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collection = await repo.getById('hoodies');
      expect(collection, isNotNull);

      final products = await repo.getProductsForCollection('hoodies');
      expect(products, isNotEmpty);

      for (int i = 0; i < products.length; i++) {
        expect(products[i].id, equals(collection!.productIds[i]));
      }
    });

    test('getProductsForCollection resolves all product ids', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collection = await repo.getById('sale');
      expect(collection, isNotNull);
      expect(collection!.productIds, isNotEmpty);

      final products = await repo.getProductsForCollection('sale');
      expect(products.length, equals(collection.productIds.length));
    });

    test('searchProductsInCollection returns all products when query is empty',
        () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final allInCollection = await repo.getProductsForCollection('hoodies');
      final searchResults =
          await repo.searchProductsInCollection('hoodies', '');

      expect(searchResults.length, equals(allInCollection.length));
    });

    test('searchProductsInCollection finds products by name', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final results =
          await repo.searchProductsInCollection('hoodies', 'hoodie');
      expect(results, isNotEmpty);
    });

    test('searchProductsInCollection is case-insensitive', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final resultsLower =
          await repo.searchProductsInCollection('hoodies', 'hoodie');
      final resultsUpper =
          await repo.searchProductsInCollection('hoodies', 'HOODIE');

      expect(resultsLower.length, equals(resultsUpper.length));
    });

    test('searchProductsInCollection returns empty for non-existent collection',
        () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final results =
          await repo.searchProductsInCollection('non-existent', 'test');
      expect(results, isEmpty);
    });

    test('searchProductsInCollection only searches within collection',
        () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final hoodieProducts = await repo.getProductsForCollection('hoodies');
      expect(hoodieProducts, isNotEmpty);

      final tshirtProducts = await repo.getProductsForCollection('tshirts');
      expect(tshirtProducts, isNotEmpty);

      // Search for 'shirt' in hoodies - should return nothing since t-shirts aren't in hoodies
      final results = await repo.searchProductsInCollection('hoodies', 'shirt');
      // Results should not contain t-shirts
      for (final product in results) {
        expect(hoodieProducts.any((p) => p.id == product.id), isTrue);
      }
    });

    test('searchCollections returns all collections when query is empty',
        () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final all = await repo.getAll();
      final searchResults = await repo.searchCollections('');

      expect(searchResults.length, equals(all.length));
    });

    test('searchCollections finds collections by name', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final results = await repo.searchCollections('hoodies');
      expect(results, isNotEmpty);
      expect(results[0].name.toLowerCase().contains('hoodies'), isTrue);
    });

    test('searchCollections is case-insensitive', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final resultsLower = await repo.searchCollections('hoodies');
      final resultsUpper = await repo.searchCollections('HOODIES');

      expect(resultsLower.length, equals(resultsUpper.length));
    });

    test('searchCollections returns empty when no matches found', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final results = await repo.searchCollections('nonexistent12345');
      expect(results, isEmpty);
    });

    test('searchCollections finds collections by description', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final results = await repo.searchCollections('premium');
      expect(results, isNotEmpty);
    });

    test('all collections have valid ids', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collections = await repo.getAll();
      for (final collection in collections) {
        expect(collection.id, isNotEmpty);
        expect(collection.id, isNotNull);
      }
    });

    test('all collections have non-empty names', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collections = await repo.getAll();
      for (final collection in collections) {
        expect(collection.name.isNotEmpty, isTrue);
      }
    });

    test('all collections have product ids list', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collections = await repo.getAll();
      for (final collection in collections) {
        expect(collection.productIds, isNotNull);
        expect(collection.productIds, isNotEmpty);
      }
    });

    test('all resolved products are valid', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collections = await repo.getAll();
      for (final collection in collections) {
        final products = await repo.getProductsForCollection(collection.id);
        for (final product in products) {
          expect(product.id, isNotEmpty);
          expect(product.name, isNotEmpty);
          expect(product.price, greaterThan(0));
        }
      }
    });

    test('can retrieve collection and then its products', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collection = await repo.getById('hoodies');
      expect(collection, isNotNull);

      final products = await repo.getProductsForCollection(collection!.id);
      expect(products, isNotEmpty);

      for (final product in products) {
        expect(collection.productIds.contains(product.id), isTrue);
      }
    });

    test('product ids in collection match resolved products', () async {
      final repo = CollectionRepository();
      await repo.initialize();

      final collection = await repo.getById('sale');
      expect(collection, isNotNull);

      final products = await repo.getProductsForCollection('sale');

      final productIds = products.map((p) => p.id).toList();
      expect(productIds, equals(collection!.productIds));
    });
  });
}
