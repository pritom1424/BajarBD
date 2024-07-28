import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:flutter/cupertino.dart';

import '../screens/brand_screen.dart';
import '../screens/category_screen.dart';
import '../screens/order_history.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Appcolors.appThemeColorDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // borderOnForeground: false,
            //color: AppColors.logoColorDeep,

            child: InkWell(
              onTap: () {},
              child: FittedBox(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*   Container(
                        height: Appvars.screenSize.height * 0.1,
                        child: Image.asset(AppConstants.appIcon),
                      ), */
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        foregroundColor: Appcolors.appThemeColorDark,
                        child: Icon(
                          CupertinoIcons.person_alt,
                          size: 60,
                        ),
                        /* backgroundImage:
                              AssetImage("assets/images/ecom_icon.png") */
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'User',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        '@user.com',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: Appvars.screenSize.height * 0.75,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              children: [
                ListTile(
                    leading: const Icon(
                      Icons.payment,
                    ),
                    title: Text(
                      "Order History",
                      style: Theme.of(context).textTheme.titleSmall!,
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const HistoryPage()))
                    //  Navigator.of(context).pushReplacementNamed(OrderScreen.routeName),
                    // Navigator.of(context).pushReplacement(CustomeRoute(
                    //   builder: (context) => OrderScreen(),
                    // ))
                    ),
                const Divider(
                  thickness: 0.3,
                  color: Appcolors.appThemeSecondaryColor,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.category,
                  ),
                  title: Text(
                    "Categories",
                    style: Theme.of(context).textTheme.titleSmall!,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const CategoryScreen())),
                ),
                const Divider(
                  thickness: 0.3,
                  color: Appcolors.appThemeSecondaryColor,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.branding_watermark,
                  ),
                  title: Text(
                    "Brands",
                    style: Theme.of(context).textTheme.titleSmall!,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const BrandScreen())),
                ),
                const Divider(
                  thickness: 0.3,
                  color: Appcolors.appThemeSecondaryColor,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.titleSmall!,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  thickness: 0.3,
                  color: Appcolors.appThemeSecondaryColor,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                  ),
                  title: Text(
                    "Logout",
                    style: Theme.of(context).textTheme.titleSmall!,
                  ),
                  onTap: () {
                    //Navigator.of(context).pop();
                    /*  Navigator.of(context).pushReplacementNamed("/");
            Provider.of<Auth>(context, listen: false).logout(); */
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
