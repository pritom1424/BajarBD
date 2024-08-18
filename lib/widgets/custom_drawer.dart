import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/screens/settings_scr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/track_order.dart';
import '../utils/Appvars/app_constants.dart';
import '../utils/Appvars/appvars.dart';
import '../utils/Colors/appcolors.dart';
import '../utils/db/user_credential.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../screens/brand_screen.dart';
import '../screens/category_screen.dart';
import '../screens/order_history.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final WidgetRef ref;
  const CustomDrawer({super.key, required this.ref});

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
                        radius: 40,
                        backgroundColor: Colors.white,
                        foregroundColor: Appcolors.appThemeColorDark,
                        child: Image.asset(AppConstants.appIcon),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        UserCredential.emailOrPhone ?? "User",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        AppConstants.companyName,
                        style: TextStyle(fontSize: 12, color: Colors.yellow),
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
                    leading: Icon(Icons.payment,
                        color: (UserCredential.userId == null)
                            ? Colors.grey
                            : Colors.black),
                    title: Text(
                      "Order History",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: (UserCredential.userId == null)
                              ? Colors.grey
                              : Colors.black),
                    ),
                    onTap: () {
                      if (UserCredential.userId == null) {
                        ref.watch(rootPageProvider).setNavPageIndex(3);
                        Navigator.of(context).pop();
                        return;
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const HistoryPage()));
                    }),
                const Divider(
                  thickness: 0.3,
                  color: Appcolors.appThemeSecondaryColor,
                ),
                /* ListTile(
                  leading: const Icon(
                    Icons.track_changes,
                  ),
                  title: Text(
                    "Track Order",
                    style: Theme.of(context).textTheme.titleSmall!,
                  ),
                  onTap: () {
                    //Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => TrackOrder(
                              rootRef: null,
                            )));
                  },
                ),
                const Divider(
                  thickness: 0.3,
                  color: Appcolors.appThemeSecondaryColor,
                ), */
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
                    leading: Icon(Icons.settings,
                        color: (UserCredential.userId == null)
                            ? Colors.grey
                            : Colors.black),
                    title: Text(
                      "Settings",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: (UserCredential.userId == null)
                              ? Colors.grey
                              : Colors.black),
                    ),
                    onTap: () {
                      if (UserCredential.userId == null) {
                        ref.watch(rootPageProvider).setNavPageIndex(3);
                        Navigator.of(context).pop();
                        return;
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => SettingsScreen()));
                    }),
                const Divider(
                  thickness: 0.3,
                  color: Appcolors.appThemeSecondaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
