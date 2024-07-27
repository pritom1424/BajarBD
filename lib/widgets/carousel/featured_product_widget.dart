import 'package:carousel_slider/carousel_slider.dart';
import '../../provider/providers.dart';
import '../../utils/Appvars/api_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturedProductWidget extends ConsumerWidget {
  const FeaturedProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*  final List<String> imgList = [
      'https://ecom.szamantech.com/frontend/img/header-slider/4.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/2.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/3.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/6.jpg',
      'https://ecom.szamantech.com/frontend/img/header-slider/7.jpg',
    ]; */
    return FutureBuilder(
        future: ref.read(productOverviewPageProvider).getSliders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return const SizedBox.shrink();
          }
          final imgList = snapshot.data!;
          return Center(
            child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    aspectRatio: 7 / 2,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9),
                items: List.generate(
                    imgList.length,
                    (ind) => InkWell(
                          onTap: () {
                            print("did tap top");
                          },
                          child: Center(
                              child: Image.network(
                                  "${ApiLinks.baseImageUrl}/slider/${imgList[ind].image}",
                                  fit: BoxFit.cover,
                                  width: 1000)),
                        ))),
          );
        });
  }
}
