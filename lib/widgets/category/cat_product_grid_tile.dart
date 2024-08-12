import 'package:bajarbd/screens/catwise_screen.dart';

import '../../utils/Appvars/app_constants.dart';

import '../../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';

class CatProductGridTile extends StatelessWidget {
  final String link, title;
  const CatProductGridTile(
      {super.key, required this.link, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => CatWiseScreen(
                  title: "product",
                )));
      },
      child: GridTile(
        footer: Container(
          color: Appcolors.appThemeColor,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        child: Image.network(
          link,
          loadingBuilder: (context, child, loadingProgress) =>
              (loadingProgress == null)
                  ? child
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        AppConstants
                            .appPlaceHolder /* "assets/images/dhakaprokash_logo.png" */,
                      ),
                    ),
          errorBuilder: (context, error, stackTrace) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Center(child: CircularProgressIndicator()),
            // Image.asset(
            //   ApiConstant.imagePlaceHolder /* "assets/images/dhakaprokash_logo.png" */,
            // ),
          ),
        ),
      ),
    );
  }
}
