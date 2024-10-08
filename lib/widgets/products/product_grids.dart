import '../../model/models/home_latest_model.dart';
import '../../utils/Appvars/api_links.dart';
import 'product_tile.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;
  final bool? isScroll;
  final List<HomeLatestProduct> products;
  final bool? isShowBottomTile;
  const ProductsGrid(this.showFav,
      {super.key,
      this.isScroll,
      required this.products,
      this.isShowBottomTile});

  @override
  Widget build(BuildContext context) {
/*     final productData = Provider.of<Products>(context);
    final products = (showFav) ? productData.favoriteItems : productData.items; */

    // TODO: implement build
    return Container(
      child: GridView.builder(
        shrinkWrap: (isScroll ?? true) ? false : true,
        physics: (isScroll ?? true)
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: products.length, //products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                (isShowBottomTile == null || isShowBottomTile == true)
                    ? 0.56
                    : 0.65,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5),
        itemBuilder: (ctx, ind) => ProductItem(
          link: products[ind].featureImage == null
              ? ""
              : ("${ApiLinks.baseImageUrl}/product/${products[ind].featureImage!}"),
          isShowBadge: (products[ind].discount == null ||
                  products[ind].discountPrice == null)
              ? false
              : true,
          unitPrice: products[ind].unitPrice,
          discount: products[ind].discount,
          discountPrice: products[ind].discountPrice,
          title: products[ind].title,
          id: products[ind].id,
          isShowBottom: (isShowBottomTile == null || isShowBottomTile == true)
              ? true
              : false,
        ) /* ChangeNotifierProvider.value(
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
