import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:union_shop/models/product.dart';

class ProductRepository {
  static final ProductRepository _instance = ProductRepository._internal();
  late List<Product> _products;
  bool _isInitialized = false;

  factory ProductRepository() {
    return _instance;
  }

  ProductRepository._internal();

  /// Initialize repository by loading products from JSON asset
  Future<void> initialize() async {
    if (_isInitialized) return;

    await _loadProductsFromJson();
    _isInitialized = true;
  }

  /// Load products from assets/data/products.json
  Future<void> _loadProductsFromJson() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/products.json');
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      final productsList = jsonData['products'] as List;

      _products = productsList
          .map((product) => Product.fromJson(product as Map<String, dynamic>))
          .toList();
    } catch (error) {
      throw Exception('Failed to load products: $error');
    }
  }

  /// Get all products
  Future<List<Product>> getAll() async {
    if (!_isInitialized) {
      await initialize();
    }
    return _products;
  }

  /// Get product by ID
  Future<Product?> getById(String id) async {
    if (!_isInitialized) {
      await initialize();
    }

    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (error) {
      return null;
    }
  }

  /// Search products by name or description
  Future<List<Product>> search(String query) async {
    if (!_isInitialized) {
      await initialize();
    }

    if (query.isEmpty) {
      return _products;
    }

    final lowerQuery = query.toLowerCase();
    List<Product> results = [];

    for (Product product in _products) {
      String productName = product.name.toLowerCase();
      String productDescription = product.description.toLowerCase();
      bool nameMatch = productName.contains(lowerQuery);
      bool descriptionMatch = productDescription.contains(lowerQuery);

      if (nameMatch || descriptionMatch) {
        results.add(product);
      }
    }

    return results;
  }

  /// Get products by a list of IDs
  Future<List<Product>> getProductsByIds(List<String> ids) async {
    if (!_isInitialized) {
      await initialize();
    }

    List<Product> results = [];

    for (String id in ids) {
      final product = _products.firstWhereOrNull((product) => product.id == id);
      if (product != null) {
        results.add(product);
      }
    }

    return results;
  }
}

extension FirstWhereOrNull<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (error) {
      return null;
    }
  }
}
