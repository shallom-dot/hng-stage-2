// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // // import 'package:shopping_app/utilities/keys.dart';

// // // class ProductServices {
// // //   final String apiUrl;
// // //   final String apiKey;
// // //   final String organizationId;
// // //   final String appId;

// // //   ProductServices({
// // //     required this.apiUrl,
// // //     required this.apiKey,
// // //     required this.organizationId,
// // //     required this.appId,
// // //   });

// // //   Future<Api> getService() async {
// // //     final response = await http.get(Uri.parse(
// // //         '$apiUrl?organization_id=$organizationId&AppId=$appId&Apikey=$apiKey'));
// // //     // ignore: avoid_print
// // //     print('Response: ${response.body}');
// // //     if (response.statusCode == 200) {
// // //       return Api.fromJson(jsonDecode(response.body));
// // //     } else {
// // //       throw Exception('Failed to retrieve products');
// // //     }
// // //   }
// // // }

// // // class Api {
// // //   final List<String> imageUrls;

// // //   Api({required this.imageUrls});

// // //   factory Api.fromJson(Map<String, dynamic> json) {
// // //     List<String> parsedImageUrls = [];
// // //     if (json['images'] != null) {
// // //       for (var imageUrl in json['images']) {
// // //         parsedImageUrls.add('https://api.timbu.cloud/images/$imageUrl');
// // //       }
// // //     }
// // //     return Api(imageUrls: parsedImageUrls);
// // //   }
// // // }

// // // // Example usage
// // // void fetchData() async {
// // //   // ignore: prefer_typing_uninitialized_variables
// // //   var organizationId;
// // //   // ignore: prefer_typing_uninitialized_variables
// // //   var appId;
// // //   ProductServices productServices = ProductServices(
// // //     apiUrl: apiUrl,
// // //     apiKey: apiKey,
// // //     organizationId: organizationId,
// // //     appId: appId,
// // //   );

// // //   try {
// // //     Api apiData = await productServices.getService();
// // //     for (String imageUrl in apiData.imageUrls) {
// // //       // ignore: avoid_print
// // //       print(imageUrl); // This will print the full image URL.
// // //     }
// // //   } catch (e) {
// // //     // ignore: avoid_print
// // //     print(e);
// // //   }
// // // }

// // // void main() {
// // //   fetchData();
// // // }



// // import 'dart:convert';
// // import 'package:e_hub/models/api_model.dart';
// // import 'package:e_hub/utilities/keys.dart';
// // import 'package:http/http.dart' as http;
// //  // Import the keys

// // class ProductServices {
// //   final String apiUrl;
// //   final String apiKey;
// //   final String organizationId;
// //   final String appId;

// //   ProductServices({
// //     required this.apiUrl,
// //     required this.apiKey,
// //     required this.organizationId,
// //     required this.appId,
// //   });

// //   Future<Api> getService() async {
// //     final response = await http.get(Uri.parse(
// //         '$apiUrl?organization_id=$organizationId&AppId=$appId&Apikey=$apiKey'));
// //     print('Response: ${response.body}');
// //     if (response.statusCode == 200) {
// //       return Api.fromJson(jsonDecode(response.body));
// //     } else {
// //       throw Exception('Failed to retrieve products');
// //     }
// //   }
// // }


// // // Example usage
// // void fetchData() async {
// //   var appId;
// //   var organizationId;
// //   ProductServices productServices = ProductServices(
// //     apiUrl: apiUrl,
// //     apiKey: apiKey,
// //     organizationId: organizationId,
// //     appId: appId,
// //   );

// //   try {
// //     Api apiData = await productServices.getService();
// //     for (String imageUrl in apiData.imageUrls) {
// //       print(imageUrl); // This will print the full image URL.
// //     }
// //   } catch (e) {
// //     print(e);
// //   }
// // }


// import 'dart:convert';
// import 'package:e_hub/models/api_model.dart';
// import 'package:http/http.dart' as http;

// class ProductServices {
//   final String apiUrl;
//   final String apiKey;
//   final String organizationId;
//   final String appId;

//   ProductServices({
//     required this.apiUrl,
//     required this.apiKey,
//     required this.organizationId,
//     required this.appId,
//   });

//   Future<Api> getProducts({
//     String? supplierId,
//     String? categoryId,
//     String? searchValue,
//     String? sortingKey,
//     DateTime? startDt,
//     DateTime? endDt,
//     int page = 1,
//     int size = 50,
//     String? currencyCode,
//     bool reverseSort = true,
//   }) async {
//     // Construct the query parameters
//     Map<String, String> queryParams = {
//       'organization_id': organizationId,
//       'Appid': appId,
//       'Apikey': apiKey,
//       'page': page.toString(),
//       'size': size.toString(),
//       'reverse_sort': reverseSort.toString(),
//     };

//     if (supplierId != null) queryParams['supplier_id'] = supplierId;
//     if (categoryId != null) queryParams['category_id'] = categoryId;
//     if (searchValue != null) queryParams['search_value'] = searchValue;
//     if (sortingKey != null) queryParams['sorting_key'] = sortingKey;
//     if (startDt != null) queryParams['start_dt'] = startDt.toIso8601String();
//     if (endDt != null) queryParams['end_dt'] = endDt.toIso8601String();
//     if (currencyCode != null) queryParams['currency_code'] = currencyCode;

//     // Construct the URL with query parameters
//     final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

//     final response = await http.get(uri);

//     print('Response: ${response.body}');
//     if (response.statusCode == 200) {
//       return Api.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to retrieve products');
//     }
//   }
// }
// product_service.dart
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
