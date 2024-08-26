import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';

class RatingTile extends StatelessWidget {
  final int rating;
  final double? rad;
  const RatingTile({super.key, required this.rating, this.rad});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      5,
      (index) => (rating >= index)
          ? Icon(
              size: rad,
              Icons.star,
              color: Appcolors.appThemeSecondaryColor,
            )
          : Icon(
              size: rad,
              Icons.star_border,
              color: Appcolors.appThemeSecondaryColor,
            ),
    ));
  }
}
