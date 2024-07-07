import 'package:e_hub/widgets/shipping_adress.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> checkoutItems;
  final Function(Map<String, dynamic>) removeItemFromCheckout;
  final Function(Map<String, String>) addItemToCheckout;

  const CheckoutScreen({
    super.key,
    required this.checkoutItems,
    required this.removeItemFromCheckout,
    required this.addItemToCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: checkoutItems.length,
            itemBuilder: (context, index) {
              final item = checkoutItems[index];
              return ListTile(
                leading: Image.asset(item['imagelocation']),
                title: Text(item['title']),
                subtitle: Text(
                  '${item['subtitle']} - Quantity: ${item['quantity']}',
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFFDB3022),
                      ),
                      onPressed: () => addItemToCheckout({
                        'title': item['title'],
                        'subtitle': item['subtitle'],
                        'imagelocation': item['imagelocation'],
                        'price': item['price'],
                        'discount': item['discount'],
                      }),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 248, 152, 125),
                      ),
                      onPressed: () => removeItemFromCheckout(item),
                    ),
                  ],
                ),
              );
            },
          ),
          if (checkoutItems.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$300.50',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFDB3022),
                    ),
                  ),
                ],
              ),
            ),
            const ShippingAddressScreen(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Complete Order'),
                onPressed: () {
                  Navigator.pushNamed(context, '/order-success');
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
