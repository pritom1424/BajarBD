import 'package:bajarbd/model/models/featured_product_model.dart';
import 'package:bajarbd/model/models/home_cat_wise_model.dart';

import 'package:bajarbd/widgets/products/home_catwise_product_tile.dart';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../utils/Appvars/api_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpecialFeaturedProductWidget extends ConsumerWidget {
  final int? index;
  final int? scrollLimiterItmNumber;
  final List<Fetauredproduct> model;
  final bool? isShowTileBottom;
  const SpecialFeaturedProductWidget(
      {this.scrollLimiterItmNumber,
      required this.model,
      this.isShowTileBottom,
      this.index,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*  final List<String> imgList = [
      'https://ecom.szamantech.com/frontend/img/header-slider/4.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/2.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/3.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/6.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/7.jpg',
    ]; */
    return FlutterCarousel(
        options: CarouselOptions(
            padEnds: false,
            autoPlay: true,
            autoPlayCurve: Curves.linear,
            reverse: (index == null || index! % 2 != 0) ? false : true,
            autoPlayInterval: const Duration(seconds: 3),
            aspectRatio: (isShowTileBottom == null || isShowTileBottom == true)
                ? 1.4
                : 1.6,
            enlargeCenterPage: false,
            floatingIndicator: false,
            showIndicator: false,
            /*  slideIndicator: CircularSlideIndicator(
                slideIndicatorOptions: SlideIndicatorOptions(
                    indicatorBackgroundColor: Colors.black12,
                    currentIndicatorColor: Appcolors.appThemeColor)) */
            enableInfiniteScroll: (scrollLimiterItmNumber != null &&
                    scrollLimiterItmNumber! >= model.length)
                ? false
                : true,
            /*  scrollPhysics: (scrollLimiterItmNumber != null &&
                    scrollLimiterItmNumber! >= model.length)
                ? NeverScrollableScrollPhysics()
                : AlwaysScrollableScrollPhysics(), */
            viewportFraction: 0.35),
        items: List.generate(
          model.length,
          (ind) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: HomeCatWiseProductItem(
              link: model[ind].featureImage == null
                  ? ""
                  : ("${ApiLinks.baseImageUrl}/product/${model[ind].featureImage!}"),
              isShowBadge: (model[ind].discount == null ||
                      model[ind].discountPrice == null)
                  ? false
                  : true,
              unitPrice: model[ind].unitPrice,
              discount: model[ind].discount,
              discountPrice: model[ind].discountPrice,
              title: model[ind].title,
              id: model[ind].id,
              isShowBottom:
                  (isShowTileBottom == null || isShowTileBottom == true)
                      ? true
                      : false,
            ),
          ),
        ));
  }
}
