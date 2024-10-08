import '../../provider/providers.dart';
import '../../utils/db/user_credential.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/models/cart_model.dart';
import '../../screens/checkout_page.dart';

import 'package:flutter/material.dart';

class TotalCartTile extends StatelessWidget {
  final double total;
  final List<CartModel> cModels;
  final WidgetRef ref;
  const TotalCartTile(
      {super.key,
      required this.total,
      required this.cModels,
      required this.ref});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(2),
      child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.blue, //Appcolors.appThemeColorDark,
            child: Icon(Icons.shopping_cart_checkout),
          ),
          title: Row(
            children: [
              Text(
                "Total: ",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "$total tk",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          contentPadding: const EdgeInsets.all(5),
          trailing: ElevatedButton(
              onPressed: () {
                if (UserCredential.userId == null) {
                  ref.watch(rootPageProvider).setNavPageIndex(3);
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => CheckoutPage(
                            rootref: ref,
                            carts: cModels,
                            totalCost: total,
                          )));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, //Appcolors.appThemeColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("CHECK OUT"))),
    );
  }
}
