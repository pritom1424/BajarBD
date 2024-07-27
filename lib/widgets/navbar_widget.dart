import '../provider/providers.dart';
import '../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  const NavBarWidget({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Appcolors.navbarBgColor,
      unselectedItemColor: Appcolors.navbarUnselectColor,
      selectedItemColor: Appcolors.navbarSelectColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: currentIndex,
      iconSize: 22,
      onTap: onTap, //_onItemTapped
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(
            icon: Consumer(
              builder: (ctx, ref, _) => FutureBuilder(
                  future: ref.watch(cartPageProvider).carts,
                  builder: (context, snapShot) {
                    int cartNum = 0;
                    if (snapShot.data == null || !snapShot.hasData) {
                      cartNum = 0;
                    } else {
                      cartNum = snapShot.data!.length;
                    }
                    return (cartNum > 0)
                        ? Badge(
                            backgroundColor: Colors.black,
                            largeSize: 13,
                            label: Text(
                              cartNum.toString(),
                              style: const TextStyle(fontSize: 10),
                            ),
                            offset: const Offset(5, -6),
                            child: const Icon(Icons.shopping_cart))
                        : const Icon(Icons.shopping_cart);
                  }),
            ),
            label: "cart"),
        BottomNavigationBarItem(
            icon: Consumer(
              builder: (ctx, ref, _) => FutureBuilder(
                  future: ref.watch(wishlistPageProvider).getWishlist,
                  builder: (context, snapShot) {
                    int cartNum = 0;
                    if (snapShot.data == null || !snapShot.hasData) {
                      cartNum = 0;
                    } else {
                      cartNum = snapShot.data!.length;
                    }
                    return (cartNum > 0)
                        ? Badge(
                            backgroundColor: Colors.black,
                            largeSize: 13,
                            label: Text(
                              cartNum.toString(),
                              style: const TextStyle(fontSize: 10),
                            ),
                            offset: const Offset(5, -6),
                            child: const Icon(Icons.favorite))
                        : const Icon(Icons.favorite);
                  }),
            ),
            label: "favorites"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: "profile")
      ],
    ));
  }
}
