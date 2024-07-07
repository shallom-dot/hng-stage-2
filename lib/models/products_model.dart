class Product {
  final String name;
  final String description;
  final String? productImage;
  final double sellingPrice;

  Product({
    required this.name,
    required this.description,
    required this.productImage,
    required this.sellingPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Extract the first photo URL if available
    String? photoUrl;
    if (json['photos'] != null && (json['photos'] as List).isNotEmpty) {
      photoUrl = json['photos'][0]['url'];
    } else {
      photoUrl = ''; // Default to an empty string if no photo is available
    }

    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      productImage: photoUrl,
      sellingPrice: json['selling_price'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'productImage': productImage,
      'sellingPrice': sellingPrice,
    };
  }
}
