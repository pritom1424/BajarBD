import 'product_tile.dart';
import 'package:flutter/material.dart';

class WishlistProductGrids extends StatelessWidget {
  final bool showFav;
  final bool? isScroll;
  final List<ProductItem> products;
  const WishlistProductGrids(this.showFav,
      {super.key, this.isScroll, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: (isScroll ?? true) ? false : true,
        physics: (isScroll ?? true)
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: products.length, //products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.66,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (ctx, ind) => products[
            ind] /* ChangeNotifierProvider.value(
          value: products[ind],
          child: ProductItems(),
        ) */
        ,

        //  ProductItems(
        //   products[ind].id,
        //   products[ind].imageUrl,
        //   products[ind].title,
        // ),
      ),
    );
  }
}
