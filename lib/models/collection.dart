class Collection {
  final String id;
  final String name;
  final String description;
  final List<String> productIds;
  final String? image;

  Collection({
    required this.id,
    required this.name,
    required this.description,
    required this.productIds,
    this.image,
  });

  int get productCount => productIds.length;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'productIds': productIds,
      'image': image,
    };
  }

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        productIds: json['productIds'] != null
            ? _parseProductIds(json['productIds'])
            : [],
        image: json['image'] as String?);
  }

  static List<String> _parseProductIds(dynamic productIdsData) {
    List idList = productIdsData as List;
    List<String> parsedIds = [];

    for (var id in idList) {
      parsedIds.add(id as String);
    }

    return parsedIds;
  }
}
