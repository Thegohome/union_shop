import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/product_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ProductRepository Integration Tests', () {
    test('initialize loads products from JSON', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo.getAll();
      expect(products, isNotEmpty);
      expect(products.length, greaterThan(0));
    });

    test('initialize can be called multiple times safely', () async {
      final repo = ProductRepository();
      await repo.initialize();
      await repo.initialize();

      final products = await repo.getAll();
      expect(products, isNotEmpty);
    });

    test('getAll returns list of products', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo.getAll();
      expect(products, isNotEmpty);
      expect(products.length, equals(5));
    });

    test('getAll returns consistent data on multiple calls', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products1 = await repo.getAll();
      final products2 = await repo.getAll();

      expect(products1.length, equals(products2.length));
      expect(products1[0].id, equals(products2[0].id));
    });

    test('products have required properties', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo.getAll();
      for (final product in products) {
        expect(product.id, isNotEmpty);
        expect(product.name, isNotEmpty);
        expect(product.price, greaterThan(0));
        expect(product.images, isNotEmpty);
      }
    });

    test('getById returns correct product when id exists', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final product = await repo.getById('hoodie-001');
      expect(product, isNotNull);
      expect(product!.id, equals('hoodie-001'));
      expect(product.name, isNotEmpty);
    });

    test('getById returns null when id does not exist', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final product = await repo.getById('non-existent-id');
      expect(product, isNull);
    });

    test('getById is case-sensitive', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final product = await repo.getById('HOODIE-001');
      expect(product, isNull);
    });

    test('search returns all products when query is empty', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final results = await repo.search('');
      final all = await repo.getAll();
      expect(results.length, equals(all.length));
    });

    test('search finds products by name', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final results = await repo.search('hoodie');
      expect(results, isNotEmpty);
      expect(results[0].name.toLowerCase().contains('hoodie'), isTrue);
    });

    test('search is case-insensitive', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final resultsLower = await repo.search('hoodie');
      final resultsUpper = await repo.search('HOODIE');
      expect(resultsLower.length, equals(resultsUpper.length));
    });

    test('search returns empty when no matches found', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final results = await repo.search('nonexistentproduct12345');
      expect(results, isEmpty);
    });

    test('search finds products by description', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final results = await repo.search('comfortable');
      expect(results, isNotEmpty);
    });

    test('search returns only matching products', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final results = await repo.search('tshirt');
      for (final product in results) {
        bool matches = product.name.toLowerCase().contains('tshirt') ||
            product.description.toLowerCase().contains('tshirt');
        expect(matches, isTrue);
      }
    });

    test('getProductsByIds returns correct products', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products =
          await repo.getProductsByIds(['hoodie-001', 'tshirt-001']);
      expect(products.length, equals(2));
      expect(products[0].id, equals('hoodie-001'));
      expect(products[1].id, equals('tshirt-001'));
    });

    test('getProductsByIds handles empty list', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo.getProductsByIds([]);
      expect(products, isEmpty);
    });

    test('getProductsByIds skips non-existent ids', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo
          .getProductsByIds(['hoodie-001', 'non-existent', 'tshirt-001']);
      expect(products.length, equals(2));
      expect(products[0].id, equals('hoodie-001'));
    });

    test('getProductsByIds preserves order of ids', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products =
          await repo.getProductsByIds(['tshirt-001', 'hoodie-001']);
      expect(products[0].id, equals('tshirt-001'));
      expect(products[1].id, equals('hoodie-001'));
    });

    test('getProductsByIds handles duplicate ids', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo
          .getProductsByIds(['hoodie-001', 'hoodie-001', 'tshirt-001']);
      expect(products.length, equals(3));
      expect(products[0].id, equals('hoodie-001'));
      expect(products[1].id, equals('hoodie-001'));
    });

    test('all products have valid price', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo.getAll();
      for (final product in products) {
        expect(product.price, greaterThan(0));
        expect(product.price.isFinite, isTrue);
      }
    });

    test('sale products have valid sale price', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo.getAll();
      for (final product in products) {
        if (product.isSale) {
          expect(product.salePrice, isNotNull);
          expect(product.salePrice!, greaterThan(0));
          expect(product.salePrice!, lessThan(product.price));
        }
      }
    });

    test('all products have at least one image', () async {
      final repo = ProductRepository();
      await repo.initialize();

      final products = await repo.getAll();
      for (final product in products) {
        expect(product.images, isNotEmpty);
        expect(product.images[0], isNotEmpty);
      }
    });
  });
}
