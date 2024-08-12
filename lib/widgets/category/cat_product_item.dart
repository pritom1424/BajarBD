import 'cat_product_grid.dart';
import 'package:flutter/material.dart';

class CatProductItem extends StatelessWidget {
  final String catName;
  const CatProductItem({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            catName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 10,
          ),
          CategoryProductGrid(),
        ],
      ),
    ); /* ExpansionTile(
      title: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.2, color: Colors.grey))),
        child: Text(
          catName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      children: const [CategoryProductGrid()],
    ); */
  }
}
