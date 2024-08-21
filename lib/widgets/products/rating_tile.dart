import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';

class RatingTile extends StatelessWidget {
  final int rating;
  const RatingTile({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      5,
      (index) => (rating >= index)
          ? Icon(
              Icons.star,
              color: Appcolors.appThemeSecondaryColor,
            )
          : Icon(
              Icons.star_border,
              color: Appcolors.appThemeSecondaryColor,
            ),
    ));
  }
}
