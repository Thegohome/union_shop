class Product {
  final String id;
  final String name;
  final double price;
  final List<String> images;
  final String description;
  final bool isSale;
  final double? salePrice;
  final Map<String, List<String>>? options;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.description,
    this.isSale = false,
    this.salePrice,
    this.options
  }) {
    _validatePrices();
  }

  void _validatePrices() {
    if (isSale && salePrice != null && salePrice! >= price) {
      throw ArgumentError('Sale price must be less than regular price');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'images': images,
      'description': description,
      'isSale': isSale,
      'salePrice': salePrice,
      'options': options,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) { // this is not a method
    return Product(
        id: json['id'] as String,
        name: json['name'] as String,
        price: (json['price'] as num).toDouble(),
        images: List<String>.from(json['images'] as List),
        description: json['description'] as String,
        isSale: json['isSale'] as bool? ?? false,
        salePrice: json['salePrice'] != null
            ? (json['salePrice'] as num).toDouble()
            : null);
  }
}
