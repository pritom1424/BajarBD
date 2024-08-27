import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/screens/product_details_screen.dart';
import 'package:bajarbd/utils/Appvars/app_constants.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchItem extends ConsumerWidget {
  final int id;
  final title, unitPrice;
  final String? discountPrice, link;
  const SearchItem(this.id,
      {super.key,
      required this.link,
      required this.title,
      required this.unitPrice,
      this.discountPrice});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref.read(cartPageProvider).carts,
        builder: (context, snapCart) {
          bool didDisable = (snapCart.data != null &&
              snapCart.data!.any((itm) => itm.id == id));
          return FutureBuilder(
              future: ref.read(wishlistPageProvider).getWishlist,
              builder: (context, snapWishList) {
                bool didDisableFav = (snapWishList.data != null &&
                    snapWishList.data!.any((itm) => itm.id == id));
                return InkWell(
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
                  child: Container(
                    color: Colors.white,
                    height: Appvars.screenSize.height * 0.1,
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: (link == null)
                                ? Image.asset(AppConstants.appPlaceHolder)
                                : Image.network(link!),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    if (discountPrice != null)
                                      Text("${discountPrice!} Tk"),
                                    if (discountPrice != null)
                                      SizedBox(
                                        width: 20,
                                      ),
                                    Text(
                                      "$unitPrice Tk",
                                      style: TextStyle(
                                          color: (discountPrice == null)
                                              ? Colors.black
                                              : Colors.grey,
                                          decoration: (discountPrice == null)
                                              ? TextDecoration.none
                                              : TextDecoration.lineThrough),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
