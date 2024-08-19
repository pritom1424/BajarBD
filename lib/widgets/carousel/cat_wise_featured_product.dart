import 'package:bajarbd/model/models/home_cat_wise_model.dart';
import 'package:bajarbd/widgets/products/home_catwise_product_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../provider/providers.dart';
import '../../utils/Appvars/api_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatWiseFeaturedProductWidget extends ConsumerWidget {
  final int? index;
  final HomeCatWiseModel model;
  const CatWiseFeaturedProductWidget(
      {required this.model, this.index, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*  final List<String> imgList = [
      'https://ecom.szamantech.com/frontend/img/header-slider/4.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/2.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/3.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/6.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/7.jpg',
    ]; */
    return Center(
      child: CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              reverse: (index == null || index! % 2 != 0) ? false : true,
              autoPlayInterval: const Duration(seconds: 3),
              aspectRatio: 3 / 2,
              enlargeCenterPage: true,
              viewportFraction: 0.45),
          items: List.generate(
            model.products.length,
            (ind) => HomeCatWiseProductItem(
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
          )),
    );
  }
}
