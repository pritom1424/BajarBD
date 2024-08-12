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
    return Column(children: [
      ListView.builder(
          itemCount: categories.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (ctx, ind) {
            return CatProductItem(
              catName: categories[ind],
            );
          }),
    ]);
  }
}
