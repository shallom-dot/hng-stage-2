// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shopping_app/utilities/keys.dart';

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

//   Future<Api> getService() async {
//     final response = await http.get(Uri.parse(
//         '$apiUrl?organization_id=$organizationId&AppId=$appId&Apikey=$apiKey'));
//     // ignore: avoid_print
//     print('Response: ${response.body}');
//     if (response.statusCode == 200) {
//       return Api.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to retrieve products');
//     }
//   }
// }

// class Api {
//   final List<String> imageUrls;

//   Api({required this.imageUrls});

//   factory Api.fromJson(Map<String, dynamic> json) {
//     List<String> parsedImageUrls = [];
//     if (json['images'] != null) {
//       for (var imageUrl in json['images']) {
//         parsedImageUrls.add('https://api.timbu.cloud/images/$imageUrl');
//       }
//     }
//     return Api(imageUrls: parsedImageUrls);
//   }
// }

// // Example usage
// void fetchData() async {
//   // ignore: prefer_typing_uninitialized_variables
//   var organizationId;
//   // ignore: prefer_typing_uninitialized_variables
//   var appId;
//   ProductServices productServices = ProductServices(
//     apiUrl: apiUrl,
//     apiKey: apiKey,
//     organizationId: organizationId,
//     appId: appId,
//   );

//   try {
//     Api apiData = await productServices.getService();
//     for (String imageUrl in apiData.imageUrls) {
//       // ignore: avoid_print
//       print(imageUrl); // This will print the full image URL.
//     }
//   } catch (e) {
//     // ignore: avoid_print
//     print(e);
//   }
// }

// void main() {
//   fetchData();
// }



import 'dart:convert';
import 'package:e_hub/utilities/keys.dart';
import 'package:http/http.dart' as http;
 // Import the keys

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

  Future<Api> getService() async {
    final response = await http.get(Uri.parse(
        '$apiUrl?organization_id=$organizationId&AppId=$appId&Apikey=$apiKey'));
    print('Response: ${response.body}');
    if (response.statusCode == 200) {
      return Api.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to retrieve products');
    }
  }
}

class Api {
  final List<String> imageUrls;

  Api({required this.imageUrls});

  factory Api.fromJson(Map<String, dynamic> json) {
    List<String> parsedImageUrls = [];
    if (json['images'] != null) {
      for (var imageUrl in json['images']) {
        parsedImageUrls.add('https://api.timbu.cloud/images/$imageUrl');
      }
    }
    return Api(imageUrls: parsedImageUrls);
  }
}

// Example usage
void fetchData() async {
  var appId;
  var organizationId;
  ProductServices productServices = ProductServices(
    apiUrl: apiUrl,
    apiKey: apiKey,
    organizationId: organizationId,
    appId: appId,
  );

  try {
    Api apiData = await productServices.getService();
    for (String imageUrl in apiData.imageUrls) {
      print(imageUrl); // This will print the full image URL.
    }
  } catch (e) {
    print(e);
  }
}

