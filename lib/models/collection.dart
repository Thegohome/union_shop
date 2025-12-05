import 'package:union_shop/models/product.dart';

class Collection {
  final String id;
  final String name;
  final String description;
  final List<Product> products;
  final String? image;

  Collection({
    required this.id,
    required this.name,
    required this.description,
    required this.products,
    this.image,
  });

  int get productCount => products.length;
