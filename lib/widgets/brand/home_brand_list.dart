import 'package:bajarbd/model/models/brand_model.dart';
import 'package:bajarbd/model/models/brand_wise_model.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:bajarbd/widgets/brand/brand_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeBrandList extends StatelessWidget {
  final List<BrandModel> model;
  final int? scrollLimiterItmNumber;
  const HomeBrandList(
      {super.key, required this.model, this.scrollLimiterItmNumber});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
        items: List.generate(
            model.length,
            (ind) => BrandTile(
                name: model[ind].name,
                link: model[ind].image ?? "",
                id: model[ind].id))

        /* [
                        Brandlist(models: snapBrand.data!)
                      ] */
        ,
        options: CarouselOptions(
            padEnds: false,
            autoPlay: false,
            //reverse: (index == null || index! % 2 != 0) ? false : true,
            // autoPlayInterval: const Duration(seconds: 3),
            /*    aspectRatio:
                  (isShowTileBottom == null || isShowTileBottom == true)
                      ? 1.4
                      : 1.6, */
            aspectRatio: 3,
            enlargeCenterPage: false,
            floatingIndicator: false,
            showIndicator: false
            /*  slideIndicator: CircularSlideIndicator(
                  slideIndicatorOptions: SlideIndicatorOptions(
                      indicatorBackgroundColor: Colors.black12,
                      currentIndicatorColor: Appcolors.appThemeColor)) */
            ,
            enableInfiniteScroll: (scrollLimiterItmNumber != null &&
                    scrollLimiterItmNumber! >= model.length)
                ? false
                : true,
            physics: (scrollLimiterItmNumber != null &&
                    scrollLimiterItmNumber! >= model.length)
                ? NeverScrollableScrollPhysics()
                : AlwaysScrollableScrollPhysics(),
            viewportFraction: 0.25));
  }
}
