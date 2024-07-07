// product_list_screen.dart
import 'package:e_hub/models/products_model.dart';
import 'package:e_hub/services/product_services.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductServices productServices;
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    productServices = ProductServices(
      apiUrl: 'https://api.timbu.cloud/products',
      apiKey: 'e63c3284f77a47d28c2f674703c37f9b20240705204005768030',
      organizationId: '29d3f12cd51a4ab1ab3c934464d290d3',
      appId: 'Q31FJS8COU1QAR2',
    );
    futureProducts = productServices.getProducts(page: 1, size: 10);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found.'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductImage(product.productImage!, screenSize),
                        SizedBox(height: 16),
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product.description,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${product.sellingPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
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
    print('Image URL: $imageUrl');
    if (imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true) {
      return Image.network(
        imageUrl,
        height: screenSize.width * 0.5,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return Container(
        height: screenSize.width * 0.5,
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
