import 'cat_product_grid_tile.dart';
import 'package:flutter/material.dart';

class CategoryProductGrid extends StatelessWidget {
  const CategoryProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> links = [
      {
        "title": "T Shirt",
        "url":
            "https://img.alicdn.com/imgextra/i1/O1CN01VdKiF11bHZLsevQPA_!!6000000003440-0-tps-240-240.jpg"
      },
      {
        "title": "Jeans",
        "url":
            "https://img.alicdn.com/imgextra/i2/O1CN01vAyHUY1Pm0HXpT4iu_!!6000000001882-0-tps-240-240.jpg"
      },
      {
        "title": "Casual Shirt",
        "url":
            "https://img.alicdn.com/imgextra/i1/O1CN01DAfRKf26IiQprCklJ_!!6000000007639-0-tps-240-240.jpg"
      },
      {
        "title": "Polo Shirt",
        "url":
            "https://img.alicdn.com/imgextra/i3/O1CN01chboWW1dLLr2sEMah_!!6000000003719-0-tps-240-240.jpg"
      },
      {
        "title": "Joggers",
        "url":
            "https://img.alicdn.com/imgextra/i1/O1CN01taJiks1IcCUWENHaa_!!6000000000913-0-tps-240-240.jpg"
      }
    ];
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(links.length, (ind) {
        return CatProductGridTile(
            link: links[ind]['url'].toString(),
            title: links[ind]['title'].toString());
      }),
    );
  }
}
