class Product {
  final String id;
  final String name;
  final double price;
  final List<String> images;
  final String description;
  final bool isSale;
  final double? salePrice;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.description,
    this.isSale = false,
    this.salePrice,
  }) {
    _validatePrices();
  }

  void _validatePrices() {
    if (isSale && salePrice != null && salePrice! >= price) {
      throw ArgumentError('Sale price must be less than regular price');
    }
  }
}
