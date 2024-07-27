import '../../model/models/cart_model.dart';
import 'cart_tile.dart';
import 'package:flutter/material.dart';

class CartTileList extends StatelessWidget {
  final List<CartModel> models;
  const CartTileList({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 20),
          itemCount: models.length,
          itemBuilder: (ctx, ind) {
            return CartTile(
                imageUrl: models[ind].imageLink,
                title: models[ind].title,
                amount: models[ind].amount,
                price: models[ind].price,
                total: models[ind].total,
                id: models[ind].id);
          }),
    );
  }
}
