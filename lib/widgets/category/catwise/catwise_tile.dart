import 'package:bajarbd/model/models/cart_model.dart';
import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/screens/product_details_screen.dart';
import 'package:bajarbd/utils/Appvars/app_constants.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:bajarbd/widgets/products/rating_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatWiseItem extends ConsumerWidget {
  final String link;
  final bool isShowBadge;
  final String? unitPrice;
  final String? discountPrice;
  final String? discount;
  final String? title;
  final int id;

  const CatWiseItem(
      {super.key,
      required this.link,
      required this.isShowBadge,
      required this.unitPrice,
      this.discountPrice,
      this.discount,
      required this.title,
      required this.id});
  // final String id, url, title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*   final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false); */
    final scaffold = ScaffoldMessenger.of(context);

    // TODO: implement build
    return FutureBuilder(
        future: ref.read(cartPageProvider).carts,
        builder: (ctx, snapCart) {
          bool didDisable = (snapCart.data != null &&
              snapCart.data!.any((itm) => itm.id == id));
          return FutureBuilder(
              future: ref.read(wishlistPageProvider).getWishlist,
              builder: (context, snapWishlist) {
                bool didDisableFav = (snapWishlist.data != null &&
                    snapWishlist.data!.any((itm) => itm.id == id));
                return GestureDetector(
                  onTap: () async {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => ProductDetailsScreen(
                                id,
                                didDisable,
                                isFav: didDisableFav,
                              )));
                    } else {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => ProductDetailsScreen(
                                id,
                                didDisable,
                                isFav: didDisableFav,
                              )));
                      ref.watch(cartPageProvider).setRebuild();
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    link,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child,
                                            loadingProgress) =>
                                        (loadingProgress == null)
                                            ? child
                                            : Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Image.asset(
                                                  AppConstants.appPlaceHolder,
                                                ),
                                              ),
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: const Center(
                                          child: CircularProgressIndicator(
                                        color: Appcolors.appThemeColor,
                                      )),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  title ?? "title" /* product.title */,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (isShowBadge)
                                          Text(
                                              "BDT $discountPrice" /* product.title */,
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "BDT $unitPrice" /* product.title */,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: isShowBadge
                                                  ? Appcolors
                                                      .appThemeSecondaryColor
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              decoration: (isShowBadge)
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                    /* IconButton(
                                        onPressed: didDisable
                                            ? null
                                            : () async {
                                                double pr = double.parse(
                                                    (isShowBadge)
                                                        ? discountPrice!
                                                        : unitPrice ?? "0");
                                                final model = CartModel(
                                                    id: id,
                                                    title: title ?? "title",
                                                    price: pr,
                                                    amount: 1,
                                                    total: pr,
                                                    imageLink: link);
                                                bool didAdd = await ref
                                                    .watch(cartPageProvider)
                                                    .addCart(model);
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
                                        icon: Icon(
                                          didDisable
                                              ? Icons.remove_shopping_cart
                                              : Icons.shopping_cart,
                                          color: didDisable
                                              ? Appcolors.appThemeSecondaryColor
                                              : Appcolors.appThemeColor,
                                        )) */
                                  ],
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(right: 15, left: 10),
                                      child: FittedBox(
                                          child: RatingTile(rating: 2))),
                                  IconButton(
                                      onPressed: didDisable
                                          ? null
                                          : () async {
                                              double pr = double.parse(
                                                  (isShowBadge)
                                                      ? discountPrice!
                                                      : unitPrice ?? "0");
                                              final model = CartModel(
                                                  id: id,
                                                  title: title ?? "title",
                                                  price: pr,
                                                  amount: 1,
                                                  total: pr,
                                                  imageLink: link);
                                              bool didAdd = await ref
                                                  .watch(cartPageProvider)
                                                  .addCart(model);
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
                                      icon: Icon(
                                        didDisable
                                            ? Icons.remove_shopping_cart
                                            : Icons.shopping_cart,
                                        color: didDisable
                                            ? Appcolors.appThemeSecondaryColor
                                            : Appcolors.appThemeColor,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      if (isShowBadge)
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Appcolors.appThemeColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Text(
                                "flat ${discount!}% discount",
                                style: const TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              });
        });
  }
}
