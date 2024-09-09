import '../provider/providers.dart';
import '../utils/Appvars/appvars.dart';
import '../widgets/loader_widget.dart';
import '../widgets/products/wishlist_product_grids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsWishlist extends StatefulWidget {
  const ProductsWishlist({super.key});

  @override
  State<ProductsWishlist> createState() => _ProductsOverviewScrState();
}

class _ProductsOverviewScrState extends State<ProductsWishlist> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*  Widget searchWidget() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 1, color: Colors.white)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              hintText: "search",
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 1, color: Colors.white))),
          onChanged: (value) {
            /*   Provider.of<EmployeeDataController>(context, listen: false)
                .filterUserData(value); */

            // filterUsers(value, snapshot.data!);
          },
        ),
      );
    } */

    return Consumer(
      builder: (ctx, ref, _) => FutureBuilder(
          future: ref.read(wishlistPageProvider).getWishlist,
          builder: (context, snapWish) {
            if (snapWish.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: Appvars.screenSize.height * 0.8,
                  child: const Center(child: LoaderWidget()));
            }
            if (!snapWish.hasData || snapWish.data!.isEmpty) {
              return SizedBox(
                  height: Appvars.screenSize.height * 0.8,
                  child: const Center(child: Text("no favorite is added!")));
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  // searchWidget(),
                  //const FeaturedProductWidget(),
                  WishlistProductGrids(
                    true,
                    products: snapWish.data!,
                    isScroll: false,
                  )
                ],
              ),
            );
          }),
    );
  }
}
