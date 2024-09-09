import 'package:bajarbd/model/models/slider_model.dart';

import 'package:bajarbd/utils/Colors/appcolors.dart';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/Appvars/api_links.dart';
import 'package:flutter/material.dart';

class FeaturedProductWidget extends StatelessWidget {
  final List<SliderModel> model;
  const FeaturedProductWidget(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    String mailSchema = "mailto";
    String websiteSchema = "http";
    Future<void> launchLink(String schema, String link) async {
      try {
        final Uri launchUri = Uri(scheme: schema, path: link);
        //final Uri launchWebUri = Uri.parse(link);
        // final Uri currentURi = launchUri;
        if (schema.contains(websiteSchema)) {
          if (!await launchUrl(Uri.parse(link))) throw 'Could not launch $link';
        } else {
          if (!await launchUrl(launchUri)) throw 'Could not launch $link';
          /* if (await canLaunchUrl(launchUri)) {
          await launchUrl(launchUri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $launchUri';
        } */
        }
      } catch (e) {
        print("link error: $e");
      }
    }

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
            onScrolled: (value) {},
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
                    onTap: (model[ind].productLink == null)
                        ? null
                        : () {
                            launchLink(websiteSchema, model[ind].productLink!);
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
