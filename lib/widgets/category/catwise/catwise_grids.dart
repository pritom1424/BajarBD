import 'package:bajarbd/model/models/cat_wise_model.dart';
import 'package:bajarbd/model/models/home_latest_model.dart';
import 'package:bajarbd/utils/Appvars/api_links.dart';
import 'package:bajarbd/widgets/category/catwise/catwise_tile.dart';
import 'package:flutter/material.dart';

class CatWiseGrids extends StatelessWidget {
  final bool showFav;
  final bool? isScroll;
  final CatWiseModel model;
  final bool? isShowBottomTile;
  const CatWiseGrids(this.showFav,
      {super.key, this.isScroll, required this.model, this.isShowBottomTile});

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
        itemCount: model.product?.length ?? 0, //products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                (isShowBottomTile == null || isShowBottomTile == true)
                    ? 0.6
                    : 0.65,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5),
        itemBuilder: (ctx, ind) => CatWiseItem(
          link: model.product?[ind].featureImage == null
              ? ""
              : ("${ApiLinks.baseImageUrl}/product/${model.product![ind].featureImage!}"),
          isShowBadge: (model.product?[ind].discount == null ||
                  model.product?[ind].discountPrice == null)
              ? false
              : true,
          unitPrice: model.product?[ind].unitPrice ?? "0.0",
          discount: model.product?[ind].discount ?? "0.0",
          discountPrice: model.product?[ind].discountPrice ?? "0.0",
          title: model.product?[ind].title ?? "",
          id: model.product?[ind].id ?? -1,
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
