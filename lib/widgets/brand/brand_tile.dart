import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/screens/brandwise_screen.dart';
import 'package:bajarbd/screens/product_details_screen.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';

import '../../utils/Appvars/app_constants.dart';
import 'package:flutter/material.dart';

class BrandTile extends StatelessWidget {
  final String name;
  final String link;
  final int id;
  const BrandTile(
      {super.key, required this.name, required this.link, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => BrandWiseScreen(
                  brandID: id,
                  title: name,
                )));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Appvars.screenSize.height * 0.1,
              //radius: 30,
              // backgroundColor: Colors.transparent,
              child: (link.isEmpty)
                  ? Image.asset(AppConstants.appPlaceHolder)
                  : Image.network(link),
            ),
            Container(
              child: Text(name),
            )
          ],
        ),
      ),
    );
  }
}
