import 'package:bajarbd/root_page.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/providers.dart';
import '../utils/Appvars/appvars.dart';
import '../widgets/carts/cart_tile_list.dart';
import '../widgets/carts/total_cart_tile.dart';

class CartScreen extends ConsumerWidget {
  final WidgetRef rootRef;
  const CartScreen(this.rootRef, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
          future: ref.read(cartPageProvider).carts,
          builder: (ctx, snap) {
            /*   if (snap.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: Appvars.screenSize.height * 0.6,
                  child: const Center(child: LoaderWidget()));
            } */
            if (!snap.hasData || snap.data!.isEmpty) {
              return SizedBox(
                  height: Appvars.screenSize.height * 0.8,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Your shopping cart is empty!",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.shopping_basket,
                        size: 54,
                        color: Appcolors.appThemeSecondaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ref.read(rootPageProvider).setNavPageIndex(0);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => RootPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Appcolors.appThemeColor),
                          child: Text(
                            "Continue Shopping",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                          ))
                    ],
                  )));
            }
            return Column(children: [
              CartTileList(
                models: snap.data!,
              ),
              const SizedBox(
                height: 5,
              ),
              if (snap.data != null && snap.data!.isNotEmpty)
                FutureBuilder(
                    future: ref.read(authProvider).tryAutoLogin(),
                    builder: (context, snapLogin) {
                      return TotalCartTile(
                        total: ref.watch(cartPageProvider).calculateTotalCost(),
                        cModels: snap.data!,
                        ref: rootRef,
                      );
                    })
            ]);
          }),
    );
  }
}
