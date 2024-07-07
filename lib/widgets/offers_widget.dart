import 'package:flutter/material.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imagelocation,
      required this.price,
      required this.discount,
      required this.active,
      required this.addItemToCheckout});

  final String title;
  final String subtitle;
  final String imagelocation;
  final String price;
  final String discount;
  final bool active;
  final Function(String) addItemToCheckout;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: height * 0.3,
        width: width * 0.46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: width * 0.25,
                      maxHeight: height * 0.12,
                    ),
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      imagelocation,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.025),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter-SemiBold',
                    fontSize: 14,
                    color: Color(0xFF161616),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Inter-Regular',
                    fontSize: 10,
                    color: Color(0xFF979797),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      discount,
                      style: const TextStyle(
                        fontFamily: 'Inter-SemiBold',
                        fontSize: 14,
                        color: Color(0xFF0033EC),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        price,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontFamily: 'Inter-Medium',
                          fontSize: 10,
                          color: Color(0xFFAFAFAF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: active
                        ? const Color(0xFFF16038)
                        : const Color(0xFFF16038).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xFFF16038).withOpacity(0.5),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 6), // Adjusted padding value
                  child: const Center(
                    child: Text(
                      'Add Now',
                      style: TextStyle(
                        fontFamily: 'Inter-SemiBold',
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFFF16038),
                  ),
                  child: const Text(
                    '15% OFF',
                    style: TextStyle(
                      fontFamily: 'Inter-SemiBold',
                      fontSize: 12,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.favorite_border_outlined, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
