import 'package:union_shop/models/product.dart';

enum CategoryType { all, popular, clothing, merchandise }

class Collection {
  final String id;
  final String name;
  final String description;
  final List<Product> products;
  final CategoryType categoryType;
  final String? image;

  Collection({
    required this.id,
    required this.name,
    required this.description,
    required this.products,
    required this.categoryType,
    this.image,
  });

  int get productCount => products.length;
