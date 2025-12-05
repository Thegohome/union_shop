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

  /// Generates a unique ID for this product variant based on selected options.
  /// 
  /// If no options are provided, returns the regular product id.
  /// If options are provided, returns format: [id]++[option1Index][option2Index]...
  /// 
  /// Example: "hoodie++20" means large (index 2) + blue (index 0)
  String getUniqueId(Map<String, int> selectedOptions) {
    // If no options selected or product has no options, return regular id
    if (selectedOptions.isEmpty || options == null || options!.isEmpty) {
      return id;
    }

    String variantSuffix = '';

    // Build the suffix in order of available options
    for (String optionKey in options!.keys) {
      if (selectedOptions.containsKey(optionKey)) {
        int selectedIndex = selectedOptions[optionKey]!;
        variantSuffix += selectedIndex.toString();
      }
    }

    // Return format: [id]++[indices]
    return '$id++$variantSuffix';
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
            : null,
        options: json['options'] != null ? _parseOptions(json['options']) : null);
  }

  static Map<String, List<String>>? _parseOptions(dynamic optionsData) {
    if (optionsData == null) return null;
    
    return Map<String, List<String>>.from(
      (optionsData as Map).map(
        (key, value) => MapEntry(key, List<String>.from(value as List)),
      ),
    );
  }
}
