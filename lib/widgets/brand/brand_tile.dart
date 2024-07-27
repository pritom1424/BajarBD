import '../../utils/Appvars/app_constants.dart';
import 'package:flutter/material.dart';

class BrandTile extends StatelessWidget {
  final String name;
  final String link;
  const BrandTile({super.key, required this.name, required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("brand clicked");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: (link.isEmpty)
                ? Image.asset(AppConstants.appPlaceHolder)
                : Image.network(link),
          ),
          Container(
            child: Text(name),
          )
        ],
      ),
    );
  }
}
