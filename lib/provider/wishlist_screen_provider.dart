import '../model/data/wishlist_model_repos.dart';
import '../model/models/single_product_model.dart';
import '../widgets/products/product_tile.dart';
import 'package:flutter/material.dart';

class WishlistScreenProvider with ChangeNotifier {
  List<ProductItem> _wishlist = [];
/* 
  final wishlistModelRepos = WishlistModelRepos(); */

  final WishlistModelRepos wishlistModelRepos;

  WishlistScreenProvider({required this.wishlistModelRepos});

  void setRebuild() {
    notifyListeners();
  }

  Future<List<ProductItem>> get getWishlist async {
    _wishlist = await wishlistModelRepos.getWishList();
    return _wishlist;
  }

  Future<bool> addToWishList(SingleProductModel prod, String imageLink) async {
    bool didAdd = await wishlistModelRepos.addWishlist(prod, imageLink);
    notifyListeners();

    return didAdd;
  }

  Future<bool> deleteFromWishlist(int id) async {
    bool didDelete = await wishlistModelRepos.deleteFromWishlist(id);
    notifyListeners();
    return didDelete;
  }
}
