import '../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.fourRotatingDots(
            color: Appcolors.appThemeColor, size: 50)

        /* SpinKitFadingCircle(
        color: Colors.blue, // Color of the spinner
        size: 50.0,
        duration: Duration(milliseconds: 1500), // Size of the spinner
      ), */
        );
  }
}
