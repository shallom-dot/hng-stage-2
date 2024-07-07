// import 'package:e_hub/provider/product_provider.dart';
import 'package:e_hub/screeens/Productlisting_screen.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
    );
  }
}


