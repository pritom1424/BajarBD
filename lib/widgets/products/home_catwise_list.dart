import 'package:bajarbd/model/models/home_cat_wise_model.dart';
import 'package:bajarbd/utils/Appvars/api_links.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/widgets/products/home_catwise_product_tile.dart';
import 'package:flutter/cupertino.dart';

class HomeCatWiseList extends StatelessWidget {
  final HomeCatWiseModel model;
  const HomeCatWiseList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Appvars.screenSize.height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.products.length,
          shrinkWrap: true,
          itemBuilder: (ctx, ind) {
            return Container(
              width: Appvars.screenSize.width * 0.4,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: HomeCatWiseProductItem(
                link: model.products[ind].featureImage == null
                    ? ""
                    : ("${ApiLinks.baseImageUrl}/product/${model.products[ind].featureImage!}"),
                isShowBadge: (model.products[ind].discount == null ||
                        model.products[ind].discountPrice == null)
                    ? false
                    : true,
                unitPrice: model.products[ind].unitPrice,
                discount: model.products[ind].discount,
                discountPrice: model.products[ind].discountPrice,
                title: model.products[ind].title,
                id: model.products[ind].id,
              ),
            );
          }),
    );
  }
}
