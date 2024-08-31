import 'package:bajarbd/screens/catwise_screen.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';

import '../../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';

class CatProductListTile extends StatelessWidget {
  final int catId;
  final String title; // link,
  const CatProductListTile(
      {super.key,
      required this.title,
      required this.catId}); //required this.link,

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => CatWiseScreen(
                  catId: catId,
                  title: title,
                )));
      },
      titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 18,
          color: Colors.black, //Appcolors.appThemeColorDark,
          fontWeight: FontWeight.normal),
      title: Container(
        height: Appvars.screenSize.height * 0.05,
        width: Appvars.screenSize.width,
        child: Row(
          children: [
            //  /   Icon(Icons.radio_button_checked),
            Expanded(
                child: Text(
              title,
            )),
            Icon(Icons.arrow_right,
                color: Colors.black //Appcolors.appThemeColorDark,
                )
            /* ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Container(
                child: Image.network(
                  link,
                  loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null)
                          ? child
                          : Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(
                                fit: BoxFit.contain,
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
            ), */
          ],
        ),
      ),
    );

    /*  InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => CatWiseScreen(
                  title: "product",
                )));
      },
      child: GridTile(
        /*   footer: Container(
          color: Appcolors.appThemeColor,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ), */
        child: Column(
          children: [
            Expanded(
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
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ); */
  }
}
