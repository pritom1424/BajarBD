import 'package:bajarbd/model/models/cat_wise_model.dart';
import 'package:bajarbd/model/models/home_latest_model.dart';
import 'package:bajarbd/utils/Appvars/api_links.dart';
import 'package:bajarbd/widgets/category/catwise/catwise_tile.dart';
import 'package:flutter/material.dart';

class CatWiseGrids extends StatelessWidget {
  final bool showFav;
  final bool? isScroll;
  final List<CatWiseModel> products;
  const CatWiseGrids(this.showFav,
      {super.key, this.isScroll, required this.products});

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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.66,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (ctx, ind) => CatWiseItem(
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
