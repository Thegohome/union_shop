import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Collection Model Tests', () {
    // Test data
    final sampleProducts = [
      Product(
        id: '1',
        name: 'Purple Hoodie',
        price: 29.99,
        images: ['hoodie1.jpg'],
        description: 'Comfortable purple hoodie',
        isSale: false,
      ),
      Product(
        id: '2',
        name: 'Sale T-Shirt',
        price: 24.99,
        images: ['tshirt.jpg'],
        description: 'Classic t-shirt on sale',
        isSale: true,
        salePrice: 14.99,
      ),
      Product(
        id: '3',
        name: 'Premium Jacket',
        price: 59.99,
        images: ['jacket.jpg'],
        description: 'High quality jacket',
        isSale: false,
      ),
    ];

    // Constructor Tests
    group('Constructor Tests', () {
      test('Collection instantiates with all required properties', () {
        final collection = Collection(
          id: '1',
          name: 'Featured Products',
          description: 'Our featured collection',
          products: sampleProducts,
        );

        expect(collection.id, '1');
        expect(collection.name, 'Featured Products');
        expect(collection.description, 'Our featured collection');
        expect(collection.products, sampleProducts);
        expect(collection.image, null);
      });

      test('Collection instantiates with optional image property', () {
        final collection = Collection(
          id: '1',
          name: 'Sales',
          description: 'Sale items',
          products: sampleProducts,
          image: 'sales_banner.jpg',
        );

        expect(collection.image, 'sales_banner.jpg');
      });

      test('Collection instantiates with empty product list', () {
        final collection = Collection(
          id: '1',
          name: 'Empty Collection',
          description: 'No products yet',
          products: [],
        );

        expect(collection.products, isEmpty);
        expect(collection.productCount, 0);
      });
    });

    // Business Logic Tests
    group('Collection Business Logic Tests', () {
      test('productCount returns correct number of products', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test collection',
          products: sampleProducts,
        );

        expect(collection.productCount, 3);
      });

      test('searchProducts finds products by name', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test collection',
          products: sampleProducts,
        );

        final results = collection.searchProducts('hoodie');

        expect(results.length, 1);
        expect(results[0].name, 'Purple Hoodie');
      });

      test('searchProducts finds products by description', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test collection',
          products: sampleProducts,
        );

        final results = collection.searchProducts('quality');

        expect(results.length, 1);
        expect(results[0].name, 'Premium Jacket');
      });

      test('searchProducts is case-insensitive', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test collection',
          products: sampleProducts,
        );

        final results = collection.searchProducts('HOODIE');

        expect(results.length, 1);
        expect(results[0].name, 'Purple Hoodie');
      });

      test('searchProducts returns empty when no match', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test collection',
          products: sampleProducts,
        );

        final results = collection.searchProducts('nonexistent');

        expect(results, isEmpty);
      });
    });

    // toJson Tests
    group('toJson() Tests', () {
      test('toJson() converts Collection to correct Map structure', () {
        final collection = Collection(
          id: '1',
          name: 'Featured',
          description: 'Featured products',
          products: [sampleProducts[0]],
          image: 'featured.jpg',
        );

        final json = collection.toJson();

        expect(json['id'], '1');
        expect(json['name'], 'Featured');
        expect(json['description'], 'Featured products');
        expect(json['image'], 'featured.jpg');
        expect(json['products'], isA<List>());
        expect(json['products'].length, 1);
      });

      test('toJson() handles null image correctly', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test',
          products: [],
          image: null,
        );

        final json = collection.toJson();

        expect(json['image'], null);
      });
    });

    // fromJson Tests
    group('fromJson() Tests', () {
      test('fromJson() creates Collection from valid JSON', () {
        final json = {
          'id': '1',
          'name': 'Featured Products',
          'description': 'Our featured collection',
          'image': 'featured.jpg',
          'products': [
            {
              'id': '1',
              'name': 'Purple Hoodie',
              'price': 29.99,
              'images': ['hoodie1.jpg'],
              'description': 'Comfortable purple hoodie',
              'isSale': false,
              'salePrice': null,
              'options': null,
            }
          ],
        };

        final collection = Collection.fromJson(json);

        expect(collection.id, '1');
        expect(collection.name, 'Featured Products');
        expect(collection.description, 'Our featured collection');
        expect(collection.image, 'featured.jpg');
        expect(collection.products.length, 1);
        expect(collection.products[0].name, 'Purple Hoodie');
      });

      test('fromJson() handles missing image field', () {
        final json = {
          'id': '1',
          'name': 'Test',
          'description': 'Test',
          'products': [],
        };

        final collection = Collection.fromJson(json);

        expect(collection.image, null);
      });

      test('fromJson() deserializes multiple products correctly', () {
        final json = {
          'id': '1',
          'name': 'All Products',
          'description': 'Everything',
          'products': [
            {
              'id': '1',
              'name': 'Product 1',
              'price': 10.0,
              'images': [],
              'description': 'Product 1',
              'isSale': false,
            },
            {
              'id': '2',
              'name': 'Product 2',
              'price': 20.0,
              'images': [],
              'description': 'Product 2',
              'isSale': true,
              'salePrice': 15.0,
            }
          ],
        };

        final collection = Collection.fromJson(json);

        expect(collection.products.length, 2);
        expect(collection.products[0].name, 'Product 1');
        expect(collection.products[1].name, 'Product 2');
      });
    });

    // Round-trip Tests
    group('Round-trip Serialization Tests', () {
      test('Collection -> toJson -> fromJson preserves data', () {
        final original = Collection(
          id: '1',
          name: 'Featured',
          description: 'Featured products',
          products: [sampleProducts[0]],
          image: 'featured.jpg',
        );

        final json = original.toJson();
        final restored = Collection.fromJson(json);

        expect(restored.id, original.id);
        expect(restored.name, original.name);
        expect(restored.description, original.description);
        expect(restored.image, original.image);
        expect(restored.products.length, original.products.length);
      });

      test('Collection with multiple products round-trip preserves all data',
          () {
        final original = Collection(
          id: '2',
          name: 'Sales',
          description: 'Sale items',
          products: sampleProducts,
        );

        final json = original.toJson();
        final restored = Collection.fromJson(json);

        expect(restored.products.length, 3);
        expect(restored.products[0].name, sampleProducts[0].name);
        expect(restored.products[1].name, sampleProducts[1].name);
        expect(restored.products[2].name, sampleProducts[2].name);
      });
    });

    // Edge Cases Tests
    group('Edge Cases Tests', () {
      test('Collection with very large product list', () {
        final manyProducts = List.generate(
          1000,
          (i) => Product(
            id: '$i',
            name: 'Product $i',
            price: (i * 0.5) + 10.0,
            images: [],
            description: 'Product $i',
          ),
        );

        final collection = Collection(
          id: '1',
          name: 'Large Collection',
          description: 'Many products',
          products: manyProducts,
        );

        expect(collection.productCount, 1000);
      });

      test('searchProducts with empty query returns all products', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test',
          products: sampleProducts,
        );

        final results = collection.searchProducts('');

        expect(results.length, 3);
      });

      test('Collection with special characters in name and description', () {
        final collection = Collection(
          id: '1',
          name: 'Collection™ with © symbols',
          description: 'Description with "quotes" and \'apostrophes\'',
          products: [],
        );

        expect(collection.name, contains('™'));
        expect(collection.description, contains('"'));
      });
    });
  });
}
