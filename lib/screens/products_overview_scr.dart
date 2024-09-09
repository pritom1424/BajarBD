import 'package:bajarbd/screens/catwise_screen.dart';
import 'package:bajarbd/screens/search_screen.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:bajarbd/widgets/brand/brand_tile.dart';
import 'package:bajarbd/widgets/brand/brandlist.dart';
import 'package:bajarbd/widgets/brand/home_brand_list.dart';

import 'package:bajarbd/widgets/carousel/cat_wise_featured_product.dart';
import 'package:bajarbd/widgets/carousel/special_best_deal_product.dart';
import 'package:bajarbd/widgets/carousel/special_featured_product.dart';
import 'package:bajarbd/widgets/carousel/special_hot_deal.dart';
import 'package:bajarbd/widgets/category/catwise/catwise_tile.dart';
import 'package:bajarbd/widgets/products/home_catwise_list.dart';
import 'package:bajarbd/widgets/products/home_catwise_product_tile.dart';
import 'package:bajarbd/widgets/products/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../provider/providers.dart';
import '../utils/Appvars/appvars.dart';
import '../widgets/carousel/featured_product_widget.dart';
import '../widgets/loader_widget.dart';
import '../widgets/products/product_grids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsOverviewScr extends StatelessWidget {
  const ProductsOverviewScr({super.key});

  @override
  Widget build(BuildContext context) {
    final Divider div = Divider(
      height: 30,
      color: Colors.black87,
      thickness: 0.3,
    );
    final titleBelowSpace = SizedBox(
      height: 10,
    );
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          //searchWidget(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => SearchScreen()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey, width: 0.3)),
              leading: Icon(Icons.search),
              title: Text(
                "Search",
              ),
              minTileHeight: Appvars.screenSize.height * 0.02,
              titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ),

          Consumer(builder: (context, refCat, ch) {
            return Column(
              children: [
                FutureBuilder(
                    future:
                        refCat.read(productOverviewPageProvider).getSliders(),
                    builder: (context, snapSlide) {
                      if (!snapSlide.hasData) {
                        return SizedBox.shrink();
                      }
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            FeaturedProductWidget(snapSlide.data!),
                            div
                          ],
                        ),
                      );
                    }),
                FutureBuilder(
                    future: refCat
                        .read(productOverviewPageProvider)
                        .getFeaturedProducts(),
                    builder: (context, snapCat) {
                      if (!snapCat.hasData) {
                        return SizedBox.shrink();
                      }
                      return Container(
                        padding: EdgeInsets.all(8),
                        /*                margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10), */
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          /*  gradient: LinearGradient(
                                colors: [Colors.blueGrey, Colors.white]) */
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Appcolors.appThemeColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Featured Products",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge /*    ?.copyWith(color: Colors.white) */,
                                ),
                              ],
                            ),
                            titleBelowSpace,
                            Container(
                              /*   padding:
                                  const EdgeInsets.only(left: 5, right: 8.0), */
                              child: SpecialFeaturedProductWidget(
                                model: snapCat.data!,
                                scrollLimiterItmNumber: 3,
                                isShowTileBottom: true,
                              ),
                            ),
                            //div
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: refCat
                        .read(productOverviewPageProvider)
                        .getHotProducts(),
                    builder: (context, snapCat) {
                      if (!snapCat.hasData) {
                        return SizedBox.shrink();
                      }
                      return Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolors.appThemeColor.withOpacity(0.4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.whatshot,
                                  color: Appcolors.appThemeColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Hot Deals",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            titleBelowSpace,
                            SpecialHotDealProductWidget(
                              model: snapCat.data!,
                              scrollLimiterItmNumber: 3,
                              isShowTileBottom: false,
                            ),
                            // div
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: refCat
                        .read(productOverviewPageProvider)
                        .getBestSellProducts(),
                    builder: (context, snapCat) {
                      if (!snapCat.hasData) {
                        return SizedBox.shrink();
                      }
                      return Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolors.appThemeColor.withOpacity(0.2)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  color: Appcolors.appThemeColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Best Sales",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            titleBelowSpace,
                            SpecialBestDealProductWidget(
                              model: snapCat.data!,
                              scrollLimiterItmNumber: 3,
                              isShowTileBottom: false,
                            ),
                            // div
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    }),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: FutureBuilder(
                      future: refCat
                          .read(productOverviewPageProvider)
                          .getCatWiseProduct(),
                      builder: (context, snapCat) {
                        if (!snapCat.hasData || snapCat.data!.isEmpty) {
                          return SizedBox.shrink();
                        }

                        return Column(
                            children: List.generate(
                                snapCat.data!.length,
                                (index) =>
                                    (snapCat.data![index].products.length == 0)
                                        ? SizedBox.shrink()
                                        : Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapCat.data![index].name ??
                                                        "Category",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                  ),
                                                  titleBelowSpace,
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (ctx) => CatWiseScreen(
                                                                    title: snapCat
                                                                        .data![
                                                                            index]
                                                                        .name,
                                                                    catId: snapCat
                                                                        .data![
                                                                            index]
                                                                        .id)));
                                                      },
                                                      child: Text("View All"))
                                                ],
                                              ),
                                              CatWiseFeaturedProductWidget(
                                                model: snapCat.data![index],
                                                index: index,
                                              ),
                                              div
                                            ],
                                          )));
                      }),
                ),
              ],
            );
          }),
          Consumer(builder: (context, refBrand, ch) {
            return FutureBuilder(
                future: refBrand.read(bandPageProvider).getBrandData(),
                builder: (context, snapBrand) {
                  /*    if (snapBrand.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                        height: Appvars.screenSize.height * 0.2,
                        child: const Center(child: LoaderWidget()));
                  } */
                  if (snapBrand.data == null) {
                    return const SizedBox.shrink();
                  }
                  /* return Column(
                      children: [Brandlist(models: snapBrand.data!)],
                    ); */
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.storefront,
                            color: Appcolors.appThemeColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Top Brands",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      titleBelowSpace,
                      HomeBrandList(
                        model: snapBrand.data!,
                        scrollLimiterItmNumber: 3,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                });
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
                        child: Text("No product found!"),
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
                      titleBelowSpace,
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
