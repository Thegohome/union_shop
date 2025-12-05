import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collection.dart';

void main() {
  group('Collection Model Tests', () {
    // Test data
    final sampleProductIds = ['1', '2', '3'];

    // Constructor Tests
    group('Constructor Tests', () {
      test('Collection instantiates with all required properties', () {
        final collection = Collection(
          id: '1',
          name: 'Featured Products',
          description: 'Our featured collection',
          productIds: sampleProductIds,
        );

        expect(collection.id, '1');
        expect(collection.name, 'Featured Products');
        expect(collection.description, 'Our featured collection');
        expect(collection.productIds, sampleProductIds);
        expect(collection.image, null);
      });

      test('Collection instantiates with optional image property', () {
        final collection = Collection(
          id: '1',
          name: 'Sales',
          description: 'Sale items',
          productIds: sampleProductIds,
          image: 'sales_banner.jpg',
        );

        expect(collection.image, 'sales_banner.jpg');
      });

      test('Collection instantiates with empty product id list', () {
        final collection = Collection(
          id: '1',
          name: 'Empty Collection',
          description: 'No products yet',
          productIds: [],
        );

        expect(collection.productIds, isEmpty);
        expect(collection.productCount, 0);
      });
    });

    // Business Logic Tests
    group('Collection Business Logic Tests', () {
      test('productCount returns correct number of product ids', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test collection',
          productIds: sampleProductIds,
        );

        expect(collection.productCount, 3);
      });

      test('productCount returns 0 for empty collection', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test collection',
          productIds: [],
        );

        expect(collection.productCount, 0);
      });

      test('productCount returns 1 for single product', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test collection',
          productIds: ['1'],
        );

        expect(collection.productCount, 1);
      });
    });

    // toJson Tests
    group('toJson() Tests', () {
      test('toJson() converts Collection to correct Map structure', () {
        final collection = Collection(
          id: '1',
          name: 'Featured',
          description: 'Featured products',
          productIds: ['1'],
          image: 'featured.jpg',
        );

        final json = collection.toJson();

        expect(json['id'], '1');
        expect(json['name'], 'Featured');
        expect(json['description'], 'Featured products');
        expect(json['image'], 'featured.jpg');
        expect(json['productIds'], isA<List>());
        expect(json['productIds'].length, 1);
        expect(json['productIds'][0], '1');
      });

      test('toJson() handles null image correctly', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test',
          productIds: [],
          image: null,
        );

        final json = collection.toJson();

        expect(json['image'], null);
      });

      test('toJson() handles multiple product ids', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test',
          productIds: ['1', '2', '3', '4', '5'],
        );

        final json = collection.toJson();

        expect(json['productIds'].length, 5);
        expect(json['productIds'], ['1', '2', '3', '4', '5']);
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
          'productIds': ['1', '2'],
        };

        final collection = Collection.fromJson(json);

        expect(collection.id, '1');
        expect(collection.name, 'Featured Products');
        expect(collection.description, 'Our featured collection');
        expect(collection.image, 'featured.jpg');
        expect(collection.productIds.length, 2);
        expect(collection.productIds[0], '1');
        expect(collection.productIds[1], '2');
      });

      test('fromJson() handles missing image field', () {
        final json = {
          'id': '1',
          'name': 'Test',
          'description': 'Test',
          'productIds': [],
        };

        final collection = Collection.fromJson(json);

        expect(collection.image, null);
      });

      test('fromJson() deserializes multiple product ids correctly', () {
        final json = {
          'id': '1',
          'name': 'All Products',
          'description': 'Everything',
          'productIds': ['prod1', 'prod2', 'prod3'],
        };

        final collection = Collection.fromJson(json);

        expect(collection.productIds.length, 3);
        expect(collection.productIds[0], 'prod1');
        expect(collection.productIds[1], 'prod2');
        expect(collection.productIds[2], 'prod3');
      });

      test('fromJson() handles null productIds field', () {
        final json = {
          'id': '1',
          'name': 'Test',
          'description': 'Test',
          'productIds': null,
        };

        final collection = Collection.fromJson(json);

        expect(collection.productIds, isEmpty);
      });

      test('fromJson() handles missing productIds field', () {
        final json = {
          'id': '1',
          'name': 'Test',
          'description': 'Test',
        };

        final collection = Collection.fromJson(json);

        expect(collection.productIds, isEmpty);
      });
    });

    // Round-trip Tests
    group('Round-trip Serialization Tests', () {
      test('Collection -> toJson -> fromJson preserves data', () {
        final original = Collection(
          id: '1',
          name: 'Featured',
          description: 'Featured products',
          productIds: ['1'],
          image: 'featured.jpg',
        );

        final json = original.toJson();
        final restored = Collection.fromJson(json);

        expect(restored.id, original.id);
        expect(restored.name, original.name);
        expect(restored.description, original.description);
        expect(restored.image, original.image);
        expect(restored.productIds, original.productIds);
      });

      test('Collection with multiple product ids round-trip preserves all data',
          () {
        final original = Collection(
          id: '2',
          name: 'Sales',
          description: 'Sale items',
          productIds: ['1', '2', '3', '4', '5'],
        );

        final json = original.toJson();
        final restored = Collection.fromJson(json);

        expect(restored.productIds.length, 5);
        expect(restored.productIds, original.productIds);
      });

      test('Collection without image round-trip works correctly', () {
        final original = Collection(
          id: '3',
          name: 'Test Collection',
          description: 'No image',
          productIds: ['a', 'b', 'c'],
        );

        final json = original.toJson();
        final restored = Collection.fromJson(json);

        expect(restored.image, null);
        expect(restored.productIds, original.productIds);
      });
    });

    // Edge Cases Tests
    group('Edge Cases Tests', () {
      test('Collection with very large product id list', () {
        final manyIds = List.generate(1000, (i) => 'product_$i');

        final collection = Collection(
          id: '1',
          name: 'Large Collection',
          description: 'Many products',
          productIds: manyIds,
        );

        expect(collection.productCount, 1000);
      });

      test('Collection with special characters in product ids', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test',
          productIds: ['prod-001', 'prod_002', 'prod.003'],
        );

        expect(collection.productIds[0], 'prod-001');
        expect(collection.productIds[1], 'prod_002');
        expect(collection.productIds[2], 'prod.003');
      });

      test('Collection with special characters in name and description', () {
        final collection = Collection(
          id: '1',
          name: 'Collection™ with © symbols',
          description: 'Description with "quotes" and \'apostrophes\'',
          productIds: [],
        );

        expect(collection.name, contains('™'));
        expect(collection.description, contains('"'));
      });

      test('Collection with duplicate product ids', () {
        final collection = Collection(
          id: '1',
          name: 'Test',
          description: 'Test',
          productIds: ['1', '1', '2', '2', '3'],
        );

        expect(collection.productCount, 5); // Counts duplicates as given
      });
    });
  });
}
