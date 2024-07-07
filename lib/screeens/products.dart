import 'package:flutter/material.dart';

import '../widgets/offers_widget.dart';

class DiscountOffersGrid extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function(Map<String, String>) addItemToCheckout;

  const DiscountOffersGrid(
      {super.key, required this.products, required this.addItemToCheckout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  color: const Color(0xFFF16038).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color:  Color(0xFFF16038),
                    ),
                    border: InputBorder.none,
                    label: Text(
                      'Find your product',
                      style: TextStyle(),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFF16038).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.notifications,
                  color:  Color(0xFFF16038),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () => addItemToCheckout(product),
                child: OffersWidget(
                  title: product['title']!,
                  subtitle: product['subtitle']!,
                  imagelocation: product['imagelocation']!,
                  price: product['price']!,
                  discount: product['discount']!,
                  active: true,
                  addItemToCheckout: (String item) {
                    // Add item to checkout functionality here
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
