import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String date, institute, address, items, logo;
  final int price;
  final double rating;
  final orderState;
  const OrderTile({
    super.key,
    required this.date,
    required this.institute,
    required this.address,
    required this.items,
    required this.logo,
    required this.price,
    required this.rating,
    this.orderState,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.person),
                // Image.asset(logo, width: 40, height: 40),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(institute,
                          style: const TextStyle(fontWeight: FontWeight.normal)),
                      Text(
                        address,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text('৳$price', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Text(items),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(orderState, style: const TextStyle(color: Colors.red)),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                      size: 20,
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
