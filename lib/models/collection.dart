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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'products': products.map((product) => product.toJson()).toList(),
      'image': image,
    };
  }
  
  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        products:
            json['products'] != null ? _parseProducts(json['products']) : [],
        image: json['image'] as String?);
  }

  static List<Product> _parseProducts(dynamic productsData) {
    List productList = productsData as List;
    List<Product> parsedProducts = [];

    for (var productData in productList) {
      Map<String, dynamic> productMap = productData as Map<String, dynamic>;
      Product product = Product.fromJson(productMap);
      parsedProducts.add(product);
    }

    return parsedProducts;
  }
  
  // for search later on
  List<Product> searchProducts(String query) {
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

}


