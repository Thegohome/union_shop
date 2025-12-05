import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Model Tests', () {
    // Test data
    final validProductData = {
      'id': '1',
      'name': 'Test Product',
      'price': 29.99,
      'images': ['image1.jpg', 'image2.jpg'],
      'description': 'A test product',
      'isSale': false,
      'salePrice': null,
      'options': null,
    };

    final saleProductData = {
      'id': '2',
      'name': 'Sale Product',
      'price': 50.00,
      'images': ['sale.jpg'],
      'description': 'A product on sale',
      'isSale': true,
      'salePrice': 39.99,
      'options': null,
    };

    final productWithOptionsData = {
      'id': '3',
      'name': 'Product with Options',
      'price': 19.99,
      'images': ['product.jpg'],
      'description': 'A product with variants',
      'isSale': false,
      'salePrice': null,
      'options': {
        'size': ['S', 'M', 'L', 'XL'],
        'color': ['red', 'blue', 'green'],
      },
    };

    // Constructor Tests
    group('Constructor Tests', () {
      test('Product instantiates with all required parameters', () {
        final product = Product(
          id: '1',
          name: 'Test Product',
          price: 29.99,
          images: ['image.jpg'],
          description: 'A test product',
        );

        expect(product.id, '1');
        expect(product.name, 'Test Product');
        expect(product.price, 29.99);
        expect(product.images, ['image.jpg']);
        expect(product.description, 'A test product');
        expect(product.isSale, false);
        expect(product.salePrice, null);
        expect(product.options, null);
      });

      test('Product instantiates with optional parameters', () {
        final options = {'size': ['S', 'M', 'L']};
        final product = Product(
          id: '2',
          name: 'Premium Product',
          price: 99.99,
          images: ['premium.jpg'],
          description: 'An expensive product',
          isSale: true,
          salePrice: 79.99,
          options: options,
        );

        expect(product.isSale, true);
        expect(product.salePrice, 79.99);
        expect(product.options, options);
      });

      test('Product has correct default values', () {
        final product = Product(
          id: '1',
          name: 'Test',
          price: 10.0,
          images: [],
          description: 'Test',
        );

        expect(product.isSale, false);
        expect(product.salePrice, null);
        expect(product.options, null);
      });
    });

    // Validation Tests
    group('Price Validation Tests', () {
      test('Constructor validates prices and throws on invalid sale price', () {
        expect(
          () => Product(
            id: '1',
            name: 'Invalid Product',
            price: 50.00,
            images: [],
            description: 'Test',
            isSale: true,
            salePrice: 60.00, // Sale price > regular price
          ),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('Constructor allows sale price equal to regular price (edge case)', () {
        expect(
          () => Product(
            id: '1',
            name: 'Edge Case Product',
            price: 50.00,
            images: [],
            description: 'Test',
            isSale: true,
            salePrice: 50.00, // Sale price = regular price
          ),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('Constructor allows valid sale price less than regular price', () {
        final product = Product(
          id: '1',
          name: 'Valid Sale Product',
          price: 50.00,
          images: [],
          description: 'Test',
          isSale: true,
          salePrice: 39.99,
        );

        expect(product.salePrice, 39.99);
        expect(product.isSale, true);
      });

      test('Constructor allows null sale price even when isSale is true', () {
        final product = Product(
          id: '1',
          name: 'No Sale Price',
          price: 50.00,
          images: [],
          description: 'Test',
          isSale: true,
          salePrice: null,
        );

        expect(product.salePrice, null);
      });

      test('Constructor does not validate when isSale is false', () {
        final product = Product(
          id: '1',
          name: 'Not on Sale',
          price: 50.00,
          images: [],
          description: 'Test',
          isSale: false,
          salePrice: 100.00, // Higher than regular price, but isSale is false
        );

        expect(product.salePrice, 100.00);
      });
    });

    // toJson Tests
    group('toJson() Tests', () {
      test('toJson() converts Product to correct Map structure', () {
        final product = Product(
          id: '1',
          name: 'Test Product',
          price: 29.99,
          images: ['image1.jpg', 'image2.jpg'],
          description: 'A test product',
          isSale: false,
          salePrice: null,
          options: null,
        );

        final json = product.toJson();

        expect(json['id'], '1');
        expect(json['name'], 'Test Product');
        expect(json['price'], 29.99);
        expect(json['images'], ['image1.jpg', 'image2.jpg']);
        expect(json['description'], 'A test product');
        expect(json['isSale'], false);
        expect(json['salePrice'], null);
        expect(json['options'], null);
      });

      test('toJson() includes all fields with sale price', () {
        final product = Product(
          id: '2',
          name: 'Sale Product',
          price: 50.00,
          images: ['sale.jpg'],
          description: 'On sale',
          isSale: true,
          salePrice: 39.99,
        );

        final json = product.toJson();

        expect(json['isSale'], true);
        expect(json['salePrice'], 39.99);
      });

      test('toJson() includes options when present', () {
        final options = {
          'size': ['S', 'M', 'L'],
          'color': ['red', 'blue'],
        };
        final product = Product(
          id: '3',
          name: 'Product with Options',
          price: 19.99,
          images: ['product.jpg'],
          description: 'Has variants',
          options: options,
        );

        final json = product.toJson();

        expect(json['options'], options);
      });

      test('toJson() returns Map<String, dynamic>', () {
        final product = Product(
          id: '1',
          name: 'Test',
          price: 10.0,
          images: [],
          description: 'Test',
        );

        final json = product.toJson();

        expect(json, isA<Map<String, dynamic>>());
      });
    });

    // fromJson Tests
    group('fromJson() Tests', () {
      test('fromJson() creates Product from valid JSON', () {
        final product = Product.fromJson(validProductData);

        expect(product.id, '1');
        expect(product.name, 'Test Product');
        expect(product.price, 29.99);
        expect(product.images, ['image1.jpg', 'image2.jpg']);
        expect(product.description, 'A test product');
        expect(product.isSale, false);
        expect(product.salePrice, null);
        expect(product.options, null);
      });

      test('fromJson() correctly handles sale products', () {
        final product = Product.fromJson(saleProductData);

        expect(product.id, '2');
        expect(product.isSale, true);
        expect(product.salePrice, 39.99);
        expect(product.price, 50.00);
      });

      test('fromJson() correctly parses options', () {
        final product = Product.fromJson(productWithOptionsData);

        expect(product.options, isNotNull);
        expect(product.options!['size'], ['S', 'M', 'L', 'XL']);
        expect(product.options!['color'], ['red', 'blue', 'green']);
      });

      test('fromJson() converts integer price to double', () {
        final jsonWithIntPrice = {
          'id': '1',
          'name': 'Test',
          'price': 25, // Integer
          'images': [],
          'description': 'Test',
          'isSale': false,
        };

        final product = Product.fromJson(jsonWithIntPrice);

        expect(product.price, 25.0);
        expect(product.price, isA<double>());
      });

      test('fromJson() converts integer sale price to double', () {
        final jsonWithIntSalePrice = {
          'id': '1',
          'name': 'Test',
          'price': 50.0,
          'images': [],
          'description': 'Test',
          'isSale': true,
          'salePrice': 40, // Integer
        };

        final product = Product.fromJson(jsonWithIntSalePrice);

        expect(product.salePrice, 40.0);
        expect(product.salePrice, isA<double>());
      });

      test('fromJson() handles missing isSale field (defaults to false)', () {
        final jsonWithoutISale = {
          'id': '1',
          'name': 'Test',
          'price': 10.0,
          'images': [],
          'description': 'Test',
        };

        final product = Product.fromJson(jsonWithoutISale);

        expect(product.isSale, false);
      });

      test('fromJson() handles null salePrice correctly', () {
        final jsonWithNullSalePrice = {
          'id': '1',
          'name': 'Test',
          'price': 10.0,
          'images': [],
          'description': 'Test',
          'isSale': true,
          'salePrice': null,
        };

        final product = Product.fromJson(jsonWithNullSalePrice);

        expect(product.salePrice, null);
      });

      test('fromJson() handles null options correctly', () {
        final jsonWithNullOptions = {
          'id': '1',
          'name': 'Test',
          'price': 10.0,
          'images': [],
          'description': 'Test',
          'options': null,
        };

        final product = Product.fromJson(jsonWithNullOptions);

        expect(product.options, null);
      });

      test('fromJson() validates prices through constructor', () {
        final invalidJson = {
          'id': '1',
          'name': 'Invalid',
          'price': 50.0,
          'images': [],
          'description': 'Test',
          'isSale': true,
          'salePrice': 60.0, // Invalid: sale price > regular price
        };

        expect(
          () => Product.fromJson(invalidJson),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    // Round-trip Tests (toJson -> fromJson)
    group('Round-trip Serialization Tests', () {
      test('Product -> toJson -> fromJson preserves data', () {
        final original = Product(
          id: '1',
          name: 'Test Product',
          price: 29.99,
          images: ['image1.jpg', 'image2.jpg'],
          description: 'A test product',
          isSale: false,
        );

        final json = original.toJson();
        final restored = Product.fromJson(json);

        expect(restored.id, original.id);
        expect(restored.name, original.name);
        expect(restored.price, original.price);
        expect(restored.images, original.images);
        expect(restored.description, original.description);
        expect(restored.isSale, original.isSale);
      });

      test('Sale product round-trip preserves all data', () {
        final original = Product(
          id: '2',
          name: 'Sale Product',
          price: 50.00,
          images: ['sale.jpg'],
          description: 'On sale',
          isSale: true,
          salePrice: 39.99,
        );

        final json = original.toJson();
        final restored = Product.fromJson(json);

        expect(restored.isSale, original.isSale);
        expect(restored.salePrice, original.salePrice);
      });

      test('Product with options round-trip preserves options', () {
        final options = {
          'size': ['S', 'M', 'L'],
          'color': ['red', 'blue'],
        };
        final original = Product(
          id: '3',
          name: 'Variant Product',
          price: 19.99,
          images: ['product.jpg'],
          description: 'With options',
          options: options,
        );

        final json = original.toJson();
        final restored = Product.fromJson(json);

        expect(restored.options, original.options);
      });
    });

    // Edge Cases Tests
    group('Edge Cases Tests', () {
      test('Product handles empty images list', () {
        final product = Product(
          id: '1',
          name: 'No Images',
          price: 10.0,
          images: [],
          description: 'Test',
        );

        expect(product.images, isEmpty);
        expect(product.images, isA<List<String>>());
      });

      test('Product handles empty description', () {
        final product = Product(
          id: '1',
          name: 'Test',
          price: 10.0,
          images: [],
          description: '',
        );

        expect(product.description, '');
      });

      test('Product handles very large price', () {
        final product = Product(
          id: '1',
          name: 'Expensive',
          price: 999999.99,
          images: [],
          description: 'Very expensive',
        );

        expect(product.price, 999999.99);
      });

      test('Product handles very small price', () {
        final product = Product(
          id: '1',
          name: 'Cheap',
          price: 0.01,
          images: [],
          description: 'Very cheap',
        );

        expect(product.price, 0.01);
      });

      test('Product handles zero price', () {
        final product = Product(
          id: '1',
          name: 'Free',
          price: 0.0,
          images: [],
          description: 'Free product',
        );

        expect(product.price, 0.0);
      });

      test('Product handles many images', () {
        final manyImages = List.generate(100, (i) => 'image$i.jpg');
        final product = Product(
          id: '1',
          name: 'Many Images',
          price: 10.0,
          images: manyImages,
          description: 'Lots of images',
        );

        expect(product.images.length, 100);
      });

      test('Product handles special characters in name', () {
        final product = Product(
          id: '1',
          name: 'Product with special chars',
          price: 10.0,
          images: [],
          description: 'Test description with numbers 123',
        );

        expect(product.name, contains('special'));
        expect(product.description, contains('123'));
      });
    });

    // _parseOptions Tests
    group('_parseOptions() Tests', () {
      test('_parseOptions returns null for null input', () {
        final result = Product.fromJson({
          'id': '1',
          'name': 'Test',
          'price': 10.0,
          'images': [],
          'description': 'Test',
          'options': null,
        }).options;

        expect(result, null);
      });

      test('_parseOptions correctly parses single option', () {
        final json = {
          'id': '1',
          'name': 'Test',
          'price': 10.0,
          'images': [],
          'description': 'Test',
          'options': {
            'size': ['S', 'M', 'L'],
          },
        };

        final product = Product.fromJson(json);

        expect(product.options, isNotNull);
        expect(product.options!.length, 1);
        expect(product.options!['size'], ['S', 'M', 'L']);
      });

      test('_parseOptions correctly parses multiple options', () {
        final json = {
          'id': '1',
          'name': 'Test',
          'price': 10.0,
          'images': [],
          'description': 'Test',
          'options': {
            'size': ['S', 'M', 'L', 'XL'],
            'color': ['red', 'blue', 'green', 'black'],
            'material': ['cotton', 'polyester'],
          },
        };

        final product = Product.fromJson(json);

        expect(product.options!.length, 3);
        expect(product.options!.containsKey('size'), true);
        expect(product.options!.containsKey('color'), true);
        expect(product.options!.containsKey('material'), true);
      });

      test('_parseOptions preserves option order', () {
        final json = {
          'id': '1',
          'name': 'Test',
          'price': 10.0,
          'images': [],
          'description': 'Test',
          'options': {
            'size': ['S', 'M', 'L'],
            'color': ['red', 'blue'],
          },
        };

        final product = Product.fromJson(json);
        final keys = product.options!.keys.toList();

        expect(keys.length, 2);
        expect(keys[0], 'size');
        expect(keys[1], 'color');
      });
    });
  });
}
