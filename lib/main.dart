import 'package:e_hub/screeens/Productlisting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
    );
  }
}


