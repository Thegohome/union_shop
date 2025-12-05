import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/repositories/product_repository.dart';

class CollectionRepository {
  static final CollectionRepository _instance =
      CollectionRepository._internal();
  late List<Collection> _collections;
  late ProductRepository _productRepository;
  bool _isInitialized = false;

  factory CollectionRepository() {
    return _instance;
  }

  CollectionRepository._internal() {
    _productRepository = ProductRepository();
  }

  /// Initialize repository by loading collections from JSON asset
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Ensure ProductRepository is initialized first
    await _productRepository.initialize();
    await _loadCollectionsFromJson();
    _isInitialized = true;
  }

  /// Load collections from assets/data/collections.json
  Future<void> _loadCollectionsFromJson() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/collections.json');
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      final collectionsList = jsonData['collections'] as List;

      List<Collection> parsedCollections = [];
      for (dynamic collectionItem in collectionsList) {
        Map<String, dynamic> collectionJson =
            collectionItem as Map<String, dynamic>;
        Collection collection = Collection.fromJson(collectionJson);
        parsedCollections.add(collection);
      }
      _collections = parsedCollections;
    } catch (error) {
      throw Exception('Failed to load collections: $error');
    }
  }

  /// Get all collections
  Future<List<Collection>> getAll() async {
    if (!_isInitialized) {
      await initialize();
    }
    return _collections;
  }

  /// Get collection by ID
  Future<Collection?> getById(String id) async {
    if (!_isInitialized) {
      await initialize();
    }

    try {
      return _collections.firstWhere((collection) => collection.id == id);
    } catch (error) {
      return null;
    }
  }

  /// Get products for a specific collection (resolves product IDs to actual products)
  Future<List<Product>> getProductsForCollection(String collectionId) async {
    if (!_isInitialized) {
      await initialize();
    }

    final collection = await getById(collectionId);
    if (collection == null) {
      return [];
    }

    return _resolveProductIds(collection.productIds);
  }

  /// Resolve product IDs to actual Product objects
  Future<List<Product>> _resolveProductIds(List<String> productIds) async {
    return _productRepository.getProductsByIds(productIds);
  }

  /// Search products within a specific collection
  Future<List<Product>> searchProductsInCollection(
      String collectionId, String query) async {
    if (!_isInitialized) {
      await initialize();
    }

    final products = await getProductsForCollection(collectionId);

    if (query.isEmpty) {
      return products;
    }

    final lowerQuery = query.toLowerCase();
    List<Product> results = [];

    for (Product product in products) {
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

  /// Search collections by name or description
  Future<List<Collection>> searchCollections(String query) async {
    if (!_isInitialized) {
      await initialize();
    }

    if (query.isEmpty) {
      return _collections;
    }

    final lowerQuery = query.toLowerCase();
    List<Collection> results = [];

    for (Collection collection in _collections) {
      String collectionName = collection.name.toLowerCase();
      String collectionDescription = collection.description.toLowerCase();
      bool nameMatch = collectionName.contains(lowerQuery);
      bool descriptionMatch = collectionDescription.contains(lowerQuery);

      if (nameMatch || descriptionMatch) {
        results.add(collection);
      }
    }

    return results;
  }
}
