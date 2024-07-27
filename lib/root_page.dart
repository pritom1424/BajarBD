import 'provider/providers.dart';
import 'screens/cart_screen.dart';
import 'screens/products_overview_scr.dart';
import 'screens/products_wishlist.dart';
import 'screens/profile_page.dart';
import 'utils/Appvars/appvars.dart';
import 'utils/Components/appcomponent.dart';
import 'utils/app_methods.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/navbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Appvars.screenSize = MediaQuery.of(context).size;

    /*  void onNavButtonTap(int ind) {
      ref.watch(rootPageProvider).setNavPageIndex(ind);
    } */

    List<Widget?> navViews() {
      return [
        const ProductsOverviewScr(),
        const CartScreen(),
        const ProductsWishlist(),
        const ProfilePage()
      ];
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Ecommerce App"),
          /* leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ), // Replace with your custom icon
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ), */
          actions: [
            PopupMenuButton(
                iconColor: Colors.white,
                /*  onSelected: (filterOptions selectedVal) {
                setState(() {
                  if (selectedVal == filterOptions.Favorites) {
                    _showfavorites = true;
                  } else {
                    _showfavorites = false;
                  }
                });
              }, */
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      const PopupMenuItem(
                        child: Text("Show Favorites"),
                        //   value: filterOptions.Favorites,
                      ),
                      const PopupMenuItem(
                        child: Text("Show All"),
                        //   value: filterOptions.All,
                      ),
                    ]),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                CupertinoIcons.bell_fill,
                color: Colors.white,
              ),
            )
          ],
        ),
        bottomNavigationBar: NavBarWidget(
          currentIndex: ref.read(rootPageProvider).navPageIndex,
          onTap: (ind) {
            AppMethods().onNavButtonTap(ind, ref);
          },
        ),
        drawer: const CustomDrawer(),
        body: AppComponent().navViews()[ref
            .read(rootPageProvider)
            .navPageIndex] //navViews()[ref.read(rootPageProvider).navPageIndex],
        );
  }
}
