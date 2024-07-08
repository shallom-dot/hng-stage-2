import 'package:e_hub/models/products_model.dart';
import 'package:e_hub/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductServices productServices;
  late Future<List<Product>> futureProducts;

  final apiUrl = dotenv.env['API_URL'];
  final apiKey = dotenv.env['API_KEY'];
  final organizationId = dotenv.env['ORGANIZATION_ID'];
  final appId = dotenv.env['APP_ID'];
  final apiImageUrl = dotenv.env['API_IMAGE_URL'];

  @override
  void initState() {
    super.initState();
    
    productServices = ProductServices(
      apiUrl: apiUrl!,
      apiKey: apiKey!,
      organizationId: organizationId!,
      appId: appId!,
    );
    futureProducts = productServices.getProducts(page: 1, size: 10);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('E_Hub')),
        elevation: 0,
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found.'));
          } else {
            final products = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Horizontal space between items
                mainAxisSpacing: 10.0, // Vertical space between items
                childAspectRatio: 2 / 3, // Aspect ratio for each item (width/height)
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final url = apiImageUrl! + product.productImage!;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildProductImage(url, screenSize),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '₦ ${product.sellingPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildProductImage(String imageUrl, Size screenSize) {
    if (imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true) {
      return Image.network(
        imageUrl,
        height: screenSize.width * 0.4,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return Container(
        height: screenSize.width * 0.4,
        width: double.infinity,
        color: Colors.grey[200],
        child: Icon(
          Icons.image,
          size: 50,
          color: Colors.grey[400],
        ),
      );
    }
  }
}
