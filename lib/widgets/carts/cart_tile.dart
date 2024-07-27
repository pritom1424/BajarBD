import '../../provider/providers.dart';
import '../../utils/Appvars/app_constants.dart';
import '../../utils/Appvars/appvars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartTile extends ConsumerWidget {
  final String imageUrl;
  final String title;
  final int amount;
  final double price;
  final double total;
  final int id;
  const CartTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.amount,
      required this.price,
      required this.total,
      required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: double.infinity,
        height: Appvars.screenSize.height * 0.1,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(flex: 1, child: Image.network(imageUrl)),
            const SizedBox(
              width: 5,
            ),
            Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Text(
                        "$price" "X $amount",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    FittedBox(
                        child: Text("total: $total",
                            style: const TextStyle(fontSize: 12)))
                  ],
                )),
            Flexible(
                flex: 2,
                child: SizedBox(
                    child: Column(
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: () async {
                            final didDelete = await ref
                                .watch(cartPageProvider)
                                .deleteCart(id);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text((didDelete)
                                          ? AppConstants.cartDeleteMessage
                                          : AppConstants
                                              .cartDeleteFailedMessage)));
                            }
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: FittedBox(
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        shape: const LinearBorder(),
                                        padding: const EdgeInsets.all(0)),
                                    onPressed: () {
                                      ref
                                          .watch(cartPageProvider)
                                          .setAmount(-1, id);
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 30,
                                    )),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border.symmetric(
                                      horizontal: BorderSide(
                                          width: 0.5, color: Colors.grey))),
                              child: FittedBox(
                                child: Text(
                                  "$amount",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: FittedBox(
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        shape: const LinearBorder(),
                                        padding: const EdgeInsets.all(0)),
                                    onPressed: () {
                                      ref
                                          .watch(cartPageProvider)
                                          .setAmount(1, id);
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 30,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )))
          ],
        )

        /*  FutureBuilder(
          future: ref.read(wishlistPageProvider).getWishlist,
          builder: (context, snapWishlist) {
            bool didDisableFav = (snapWishlist.data != null &&
                snapWishlist.data!.any((itm) => itm.id == id));
            return SizedBox(
              height: Appvars.screenSize.height * 0.1,
              child: ListTile(
                /* onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProductDetailsScreen(
                            id,
                            true,
                            isFav: didDisableFav,
                          )));
                }, */
                title: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("$price" "X $amount"), Text("$total")],
                ),
                leading: Image.network(imageUrl),
                contentPadding: const EdgeInsets.all(0),
                minVerticalPadding: 0,
                trailing: SizedBox(
                    width: Appvars.screenSize.width * 0.22,
                    child: Column(
                      children: [
                        Expanded(
                          child: IconButton(
                              onPressed: () async {
                                final didDelete = await ref
                                    .watch(cartPageProvider)
                                    .deleteCart(id);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text((didDelete)
                                              ? AppConstants.cartDeleteMessage
                                              : AppConstants
                                                  .cartDeleteFailedMessage)));
                                }
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: FittedBox(
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            shape: const LinearBorder(),
                                            padding: const EdgeInsets.all(0)),
                                        onPressed: () {
                                          ref
                                              .watch(cartPageProvider)
                                              .setAmount(-1, id);
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          size: 30,
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border.symmetric(
                                          horizontal: BorderSide(
                                              width: 0.5, color: Colors.grey))),
                                  child: FittedBox(
                                    child: Text(
                                      "$amount",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: FittedBox(
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            shape: const LinearBorder(),
                                            padding: const EdgeInsets.all(0)),
                                        onPressed: () {
                                          ref
                                              .watch(cartPageProvider)
                                              .setAmount(1, id);
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          size: 30,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
            );
          }), */
        );
  }
}
