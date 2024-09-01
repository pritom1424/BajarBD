import 'package:bajarbd/model/models/brand_wise_model.dart';
import 'package:bajarbd/model/models/cat_wise_model.dart';
import 'package:bajarbd/model/models/home_latest_model.dart';
import 'package:bajarbd/utils/Appvars/api_links.dart';
import 'package:bajarbd/widgets/category/catwise/catwise_tile.dart';
import 'package:flutter/material.dart';

class BrandWiseGrids extends StatelessWidget {
  final bool showFav;
  final bool? isScroll;
  final List<BrandWiseProductsModel> model;
  final bool? isShowBottomTile;
  const BrandWiseGrids(this.showFav,
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
        itemCount: model.length, //products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                (isShowBottomTile == null || isShowBottomTile == true)
                    ? 0.6
                    : 0.65,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5),
        itemBuilder: (ctx, ind) => CatWiseItem(
          link: model[ind].featureImage == null
              ? ""
              : ("${ApiLinks.baseImageUrl}/product/${model[ind].featureImage!}"),
          isShowBadge:
              (model[ind].discount == null || model[ind].discountPrice == null)
                  ? false
                  : true,
          unitPrice: model[ind].unitPrice ?? "0.0",
          discount: model[ind].discount ?? "0.0",
          discountPrice: model[ind].discountPrice ?? "0.0",
          title: model[ind].title ?? "",
          id: model[ind].id,
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
