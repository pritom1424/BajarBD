import 'package:bajarbd/model/models/slider_model.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import '../../provider/providers.dart';
import '../../utils/Appvars/api_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturedProductWidget extends StatelessWidget {
  final List<SliderModel> model;
  const FeaturedProductWidget(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
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
            autoPlayInterval: const Duration(seconds: 3),
            aspectRatio: 5 / 2,
            enlargeCenterPage: false,
            floatingIndicator: false,
            slideIndicator: CircularSlideIndicator(
                slideIndicatorOptions: SlideIndicatorOptions(
                    indicatorBackgroundColor: Colors.black12,
                    currentIndicatorColor: Appcolors.appThemeColor)),
            viewportFraction: 1),
        items: List.generate(
            model.length,
            (ind) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      print("did tap top");
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "${ApiLinks.baseImageUrl}/slider/${model[ind].image}",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )));
  }
}
