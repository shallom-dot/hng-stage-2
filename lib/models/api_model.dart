import 'package:e_hub/models/products_model.dart';

class Api {
  final int page;
  final int size;
  final int total;
  final List<Product> items;

  Api({
    required this.page,
    required this.size,
    required this.total,
    required this.items,
  });

  factory Api.fromJson(Map<String, dynamic> json) {
    var productList = json['items'] as List;
    List<Product> products = productList.map((i) => Product.fromJson(i)).toList();

    return Api(
      page: json['page'],
      size: json['size'],
      total: json['total'],
      items: products,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'size': size,
      'total': total,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}