import 'package:flutter/material.dart';

class Appvars {
  static Size screenSize = const Size(1920, 1080);
  static BoxDecoration customInputboxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  );
  static TextStyle customHintTextStyle = TextStyle(
    color: Colors.grey.withOpacity(0.5),
    fontSize: 15, /*  fontFamily: AppStrings.currentFontFamily */
  );

  static EdgeInsets inputContentPadding =
      const EdgeInsets.symmetric(horizontal: 20);
}
