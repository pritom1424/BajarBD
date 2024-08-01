import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/root_page.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderSuccess extends StatelessWidget {
  final String successMessage;
  final WidgetRef ref;
  const OrderSuccess(
      {super.key, required this.successMessage, required this.ref});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Success!"),
        ),
        body: Container(
          height: Appvars.screenSize.height,
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 80,
                  child: Icon(
                    Icons.shopping_cart_checkout_rounded,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  successMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appThemeColor,
                      ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("Track order",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: Appcolors.appThemeSecondaryColor,
                            color: Appcolors.appThemeSecondaryColor))),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(rootPageProvider).setNavPageIndex(0);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => RootPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Appcolors.appThemeColor),
                    child: Text(
                      "Continue Shopping",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.normal, color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
