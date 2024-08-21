import 'package:bajarbd/provider/product_details_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import '../model/models/cart_model.dart';
import '../provider/providers.dart';
import '../root_page.dart';
import '../utils/Appvars/api_links.dart';
import '../utils/Appvars/app_constants.dart';
import '../utils/Appvars/appvars.dart';
import '../utils/Colors/appcolors.dart';
import '../utils/Components/appcomponent.dart';
import '../utils/app_methods.dart';
import '../widgets/loader_widget.dart';
import '../widgets/navbar_widget.dart';
import '../widgets/products/product_grids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  final bool isDisable;
  final bool isFav;
  final bool? disableNavbar;

  const ProductDetailsScreen(
    this.id,
    this.isDisable, {
    super.key,
    required this.isFav,
    this.disableNavbar,
  });

  @override
  Widget build(BuildContext context) {
    bool isInit = false;
    bool isdisableToCart = isDisable;
    bool isdisableFavorite = isFav;
    int rating = 0;
    String cleanHtmlContent(String htmlContent) {
      // Replace newlines and tabs with spaces
      String cleanedHtml = htmlContent.replaceAll(RegExp(r'\s+'), ' ');

      // Adjust the formatting for the key-value pairs
      cleanedHtml = cleanedHtml.replaceAllMapped(
        RegExp(
            r'<dt[^>]*>\s*([^<:]+)\s*:\s*<\/dt>\s*<dd[^>]*>\s*([^<]+)\s*<\/dd>'),
        (Match match) => '${match.group(1)}: ${match.group(2)}<br/>',
      );

      // Also handle cases where there might be no colon in the original HTML
      cleanedHtml = cleanedHtml.replaceAllMapped(
        RegExp(r'<dt[^>]*>\s*([^<]+)\s*<\/dt>\s*<dd[^>]*>\s*([^<]+)\s*<\/dd>'),
        (Match match) => '${match.group(1)}: ${match.group(2)}<br/>',
      );

      return cleanedHtml;
    }

    return Consumer(
      builder: (ctx, ref, _) => Scaffold(
        appBar: AppBar(title: const Text("Product Details")),
        bottomNavigationBar: (disableNavbar == null || disableNavbar == false)
            ? NavBarWidget(
                currentIndex: ref.read(rootPageProvider).navPageIndex,
                onTap: (ind) {
                  AppMethods().onNavButtonTap(ind, ref);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => const RootPage()));
                },
              )
            : null,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
              future: ref.read(detailsPageProvider).getProduct(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      height: Appvars.screenSize.height * 0.6,
                      child: const Center(child: LoaderWidget()));
                }
                if (!snapshot.hasData) {
                  return SizedBox(
                    height: Appvars.screenSize.height * 0.8,
                    child: const Center(
                      child: Text("No product found!"),
                    ),
                  );
                }
/* 
                print("Image:" +
                    "${ApiLinks.baseImageUrl}/gallery/${snapshot.data!.gallery?[0]['image']}"); */

                final isDiscount = (snapshot.data!.discount == null ||
                        snapshot.data!.discountPrice == null)
                    ? false
                    : true;
                final imageLinks = (snapshot.data!.gallery == null) ||
                        (snapshot.data!.gallery!.isEmpty)
                    ? [
                        "${ApiLinks.baseImageUrl}/product/${snapshot.data!.featureImage}"
                      ]
                    : List.generate(
                        snapshot.data!.gallery!.length,
                        (ind) =>
                            "${ApiLinks.baseImageUrl}/gallery/${snapshot.data!.gallery![ind].image}");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Consumer(builder: (context, ref, _) {
                      if (!isInit) {
                        ref.read(detailsPageProvider).resetSliderIndex();
                        isInit = true;
                      }
                      return Column(
                        children: [
                          Container(
                              height: Appvars.screenSize.height * 0.4,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              //width: double.infinity,
                              child: CarouselSlider(
                                items: imageLinks
                                    .map((itm) => Container(
                                        child: Image.network(itm,
                                            fit: BoxFit.contain,
                                            width: double.infinity)))
                                    .toList(),
                                options: CarouselOptions(
                                  autoPlay: false,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  aspectRatio: 2 / 2,
                                  enlargeCenterPage: false,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) => ref
                                      .watch(detailsPageProvider)
                                      .setSliderIndex(index),
                                ),
                              ) //Image.network(imageLink),

                              ),
                          AppComponent().sliderIndicators(
                              imageLinks.length,
                              ref.read(detailsPageProvider).sliderIndex,
                              Appcolors.appThemeColor,
                              Appcolors.appThemeSecondaryColor),
                        ],
                      );
                    }),

                    //title
                    Text(
                      snapshot.data!.title ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const Divider(
                      height: 40,
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                    Container(
                      /*  padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10), */
                      /*  decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 0.5, color: Colors.grey)), */

                      // color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              if (isDiscount)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "${snapshot.data!.discountPrice} Tk",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "${snapshot.data!.unitPrice} Tk",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: isDiscount
                                              ? Appcolors.appThemeSecondaryColor
                                              : Colors.black,
                                          decoration: isDiscount
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Consumer(
                            builder: (ctx2, ref2, _) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (!isdisableFavorite) {
                                        isdisableFavorite = true;
                                        bool didAdd = await ref2
                                            .watch(wishlistPageProvider)
                                            .addToWishList(
                                                snapshot.data!, imageLinks[0]);

                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text((didAdd)
                                                      ? AppConstants
                                                          .wishlistAddMessage
                                                      : AppConstants
                                                          .wishlistAddFailedMessage)));
                                        }
                                      } else {
                                        isdisableFavorite = false;
                                        bool didAdd = await ref2
                                            .watch(wishlistPageProvider)
                                            .deleteFromWishlist(id);

                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text((didAdd)
                                                      ? AppConstants
                                                          .wishlistRemoveMessage
                                                      : AppConstants
                                                          .wishlistRemoveMessageFailed)));
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Appcolors.appThemeSecondaryColor,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))
                                        /* shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50))) */
                                        ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon((isdisableFavorite)
                                            ? Icons.favorite
                                            : Icons.favorite_outline),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          (isdisableFavorite)
                                              ? "Added To Wishlist"
                                              : "Add To Wishlist",
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: (isdisableToCart)
                                          ? null
                                          : () async {
                                              final sProduct = snapshot.data!;
                                              double pr = double.parse(
                                                  (isDiscount)
                                                      ? sProduct.discountPrice!
                                                      : sProduct.unitPrice!);
                                              final model = CartModel(
                                                  id: id,
                                                  title: sProduct.title ?? "",
                                                  price: pr,
                                                  amount: 1,
                                                  total: pr,
                                                  imageLink: imageLinks[0]);
                                              bool didAdd = await ref2
                                                  .watch(cartPageProvider)
                                                  .addCart(model);
                                              isdisableToCart =
                                                  !isdisableToCart;
                                              if (context.mounted) {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text((didAdd)
                                                            ? AppConstants
                                                                .cartAddMessage
                                                            : AppConstants
                                                                .cartAddFailedMessage)));
                                              }
                                            },
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(10),
                                          backgroundColor: (isDisable)
                                              ? Colors.grey
                                              : Appcolors.appThemeColor,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon((isdisableToCart)
                                              ? Icons.shopping_cart
                                              : Icons.shopping_cart_outlined),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              (isdisableToCart)
                                                  ? "Added To Cart"
                                                  : "Add To Cart",
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                  )),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Consumer(builder: (context, refRate, ch) {
                      return Row(
                          children: List.generate(
                              5,
                              (index) => (rating >= index)
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.star,
                                        color: Appcolors.appThemeSecondaryColor,
                                      ),
                                      onPressed: () {
                                        rating = index;
                                        refRate
                                            .watch(detailsPageProvider)
                                            .setRebuild();
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.star_border,
                                        color: Appcolors.appThemeSecondaryColor,
                                      ),
                                      onPressed: () {
                                        rating = index;
                                        refRate
                                            .watch(detailsPageProvider)
                                            .setRebuild();
                                      },
                                    )));
                    }),
                    const Divider(
                      height: 20,
                      thickness: 0.3,
                      color: Colors.grey,
                    ),
                    //description

                    Text(
                      Bidi.stripHtmlIfNeeded(snapshot.data!.description ?? ""),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    HtmlWidget(
                      cleanHtmlContent(snapshot.data!.shortDescription ?? ""),
                      // textAlign: TextAlign.justify,
                    ),

                    /*  Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(specification.length,
                                (ind) => Text(specification.keys.toList()[ind]))),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                specification.length,
                                (ind) =>
                                    Text(specification.values.toList()[ind]))),
                      ],
                    ), */
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Related Products",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const ProductsGrid(
                        false,
                        isScroll: false,
                        products: [],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
