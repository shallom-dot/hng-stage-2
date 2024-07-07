import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Shipping Adress',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Full Name'),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Mobile Number'),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Delivery Address'),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'City'),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
