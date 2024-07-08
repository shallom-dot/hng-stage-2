
import 'dart:convert';
import 'package:e_hub/models/products_model.dart';
import 'package:http/http.dart' as http;


class ProductServices {
  final String apiUrl;
  final String apiKey;
  final String organizationId;
  final String appId;

  ProductServices({
    required this.apiUrl,
    required this.apiKey,
    required this.organizationId,
    required this.appId,
  });

  Future<List<Product>> getProducts({
    int page = 1,
    int size = 10,
  }) async {
    final queryParams = {
      'organization_id': organizationId,
      'Appid': appId,
      'Apikey': apiKey,
      'page': page.toString(),
      'size': size.toString(),
    };

    final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> items = data['items'];
      return items.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to retrieve products');
    }
  }
}
