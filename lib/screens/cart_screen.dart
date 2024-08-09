import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/providers.dart';
import '../utils/Appvars/appvars.dart';
import '../widgets/carts/cart_tile_list.dart';
import '../widgets/carts/total_cart_tile.dart';

class CartScreen extends ConsumerWidget {
  final WidgetRef rootRef;
  const CartScreen(this.rootRef, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
          future: ref.read(cartPageProvider).carts,
          builder: (ctx, snap) {
            /*   if (snap.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: Appvars.screenSize.height * 0.6,
                  child: const Center(child: LoaderWidget()));
            } */
            if (!snap.hasData || snap.data!.isEmpty) {
              return SizedBox(
                  height: Appvars.screenSize.height * 0.8,
                  child: const Center(child: Text("no cart is added!")));
            }
            return Column(children: [
              CartTileList(
                models: snap.data!,
              ),
              const SizedBox(
                height: 5,
              ),
              if (snap.data != null && snap.data!.isNotEmpty)
                FutureBuilder(
                    future: ref.read(authProvider).tryAutoLogin(),
                    builder: (context, snapLogin) {
                      return TotalCartTile(
                        total: ref.watch(cartPageProvider).calculateTotalCost(),
                        cModels: snap.data!,
                        ref: rootRef,
                      );
                    })
            ]);
          }),
    );
  }
}
