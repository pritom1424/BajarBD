import '../../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';

class CatProductGridTile extends StatelessWidget {
  final String link, title;
  const CatProductGridTile(
      {super.key, required this.link, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
        child: Image.network(link),
      ),
    );
  }
}
