import 'package:bajarbd/widgets/category/cat_product_list_tile.dart';

import 'package:flutter/material.dart';

class CatProductItem extends StatelessWidget {
  final String catName;
  const CatProductItem({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /* Container(
            color: Colors.black12,
            child: Text(
              catName,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ), */
          CatProductListTile(
              /*   link:
                  "https://img.alicdn.com/imgextra/i1/O1CN01DAfRKf26IiQprCklJ_!!6000000007639-0-tps-240-240.jpg", */
              title: catName),
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
