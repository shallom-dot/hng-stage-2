import 'package:e_hub/screeens/checkoutscreens.dart';
import 'package:e_hub/screeens/products.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _products = [
    {
      'title': 'Workout shirt',
      'subtitle': 'Best selling',
      'imagelocation': 'assets/images/image 13.png',
      'price': '\$100',
      'discount': '\$85',
    },
    {
      'title': 'Beta Alanine',
      'subtitle': 'Another great product',
      'imagelocation': 'assets/images/image 16.png',
      'price': '\$150',
      'discount': '\$130',
    },
    {
      'title': 'Yoga shirt',
      'subtitle': 'very comfy',
      'imagelocation': 'assets/images/image 12.png',
      'price': '\$100',
      'discount': '\$85',
    },
    {
      'title': 'Suplements',
      'subtitle': 'combo sale',
      'imagelocation': 'assets/images/image 17.png',
      'price': '\$150',
      'discount': '\$130',
    },
    {
      'title': 'Offer 2',
      'subtitle': 'Subtitle 2',
      'imagelocation': 'assets/images/image 11.png',
      'price': '\$150',
      'discount': '\$130',
    },
    {
      'title': 'Offer 6',
      'subtitle': 'Subtitle 2',
      'imagelocation': 'assets/images/image 15.png',
      'price': '\$150',
      'discount': '\$130',
    },
  ];
  final List<Map<String, dynamic>> _checkoutItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addItemToCheckout(Map<String, String> item) {
    setState(() {
      final existingItemIndex = _checkoutItems.indexWhere((element) => element['title'] == item['title']);
      if (existingItemIndex != -1) {
        _checkoutItems[existingItemIndex]['quantity'] += 1;
      } else {
        _checkoutItems.add({
          'title': item['title'],
          'subtitle': item['subtitle'],
          'imagelocation': item['imagelocation'],
          'price': item['price'],
          'discount': item['discount'],
          'quantity': 1,
        });
      }
    });

    // Show a SnackBar indicating that the item was added to cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item['title']} added to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _removeItemFromCheckout(Map<String, dynamic> item) {
    setState(() {
      final existingItemIndex = _checkoutItems.indexWhere((element) => element['title'] == item['title']);
      if (existingItemIndex != -1 && _checkoutItems[existingItemIndex]['quantity'] > 1) {
        _checkoutItems[existingItemIndex]['quantity'] -= 1;
      } else {
        _checkoutItems.remove(item);
      }
    });
  }

  List<Widget> _buildScreens() {
    return [
      DiscountOffersGrid(products: _products, addItemToCheckout: _addItemToCheckout),
      CheckoutScreen(
        checkoutItems: _checkoutItems,
        removeItemFromCheckout: _removeItemFromCheckout,
        addItemToCheckout: _addItemToCheckout,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: _buildScreens()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}



