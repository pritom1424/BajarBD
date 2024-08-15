import '../provider/providers.dart';
import '../utils/Appvars/appvars.dart';
import '../widgets/carousel/featured_product_widget.dart';
import '../widgets/loader_widget.dart';
import '../widgets/products/product_grids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsOverviewScr extends StatefulWidget {
  const ProductsOverviewScr({super.key});

  @override
  State<ProductsOverviewScr> createState() => _ProductsOverviewScrState();
}

class _ProductsOverviewScrState extends State<ProductsOverviewScr> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget searchWidget() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchController,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
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
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          searchWidget(),
          const FeaturedProductWidget(),
          Consumer(builder: (ctx, ref, _) {
            return FutureBuilder(
                future: ref
                    .watch(productOverviewPageProvider)
                    .getHomeLatestProducts(),
                builder: (ctx, snapLatestProduct) {
                  if (snapLatestProduct.connectionState ==
                      ConnectionState.waiting) {
                    return SizedBox(
                        height: Appvars.screenSize.height * 0.6,
                        child: const Center(child: LoaderWidget()));
                  }
                  if (!snapLatestProduct.hasData ||
                      snapLatestProduct.data!.isEmpty) {
                    return SizedBox(
                      height: Appvars.screenSize.height * 0.6,
                      child: const Center(
                        child: Text("No products found!"),
                      ),
                    );
                  }
                  return ProductsGrid(
                    false,
                    isScroll: false,
                    products: snapLatestProduct.data!,
                  );
                });
          })
        ],
      ),
    );
  }
}
