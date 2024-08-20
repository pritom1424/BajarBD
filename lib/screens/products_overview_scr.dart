import 'package:bajarbd/screens/catwise_screen.dart';
import 'package:bajarbd/widgets/carousel/cat_wise_featured_product.dart';
import 'package:bajarbd/widgets/category/catwise/catwise_tile.dart';
import 'package:bajarbd/widgets/products/home_catwise_list.dart';
import 'package:bajarbd/widgets/products/home_catwise_product_tile.dart';
import 'package:bajarbd/widgets/products/product_tile.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          searchWidget(),
          const FeaturedProductWidget(),
          Consumer(builder: (context, refCat, ch) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FutureBuilder(
                  future: refCat
                      .read(productOverviewPageProvider)
                      .getCatWiseProduct(),
                  builder: (context, snapCat) {
                    if (!snapCat.hasData) {
                      return SizedBox.shrink();
                    }
                    return Column(
                        children: List.generate(
                            snapCat.data!.length,
                            (index) => Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapCat.data![index].name ??
                                              "Category",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          CatWiseScreen(
                                                              title: snapCat
                                                                  .data![index]
                                                                  .name,
                                                              catId: snapCat
                                                                  .data![index]
                                                                  .id)));
                                            },
                                            child: Text("View All"))
                                      ],
                                    ),
                                    CatWiseFeaturedProductWidget(
                                      model: snapCat.data![index],
                                      index: index,
                                    ),
                                  ],
                                )));
                  }),
            );
          }),
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Recent Products",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      ProductsGrid(
                        false,
                        isScroll: false,
                        products: snapLatestProduct.data!,
                      ),
                    ],
                  );
                });
          })
        ],
      ),
    );
  }
}
