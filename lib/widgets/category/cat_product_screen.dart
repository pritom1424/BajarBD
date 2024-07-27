import 'cat_product_item.dart';
import 'package:flutter/material.dart';

class CatProductScreen extends StatelessWidget {
  const CatProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "Clothing",
      "Shoes",
      "Accessories",
      "Bags",
      "Watches",
      "Eyewear",
      "Jewellery"
    ];
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, ind) {
          return CatProductItem(
            catName: categories[ind],
          );
        });
  }
}
