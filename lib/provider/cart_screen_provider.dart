import '../model/data/cart_model_repos.dart';
import '../model/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartScreenProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  int _amount = 1;

  final CartModelRepos _cartModelRepos = CartModelRepos();

  int get amount {
    return _amount;
  }

  void setAmount(int increment, int id) async {
    int ind = _carts.indexWhere((itm) => itm.id == id);
    CartModel cm = _carts.firstWhere((e) => e.id == id);
    var amn = cm.amount;
    amn += increment;
    if (amn > 0) {
      _amount = amn;
    } else {
      _amount = 1;
    }
    CartModel updateCm = CartModel(
        id: id,
        title: cm.title,
        price: cm.price,
        amount: _amount,
        total: (cm.price * cm.amount),
        imageLink: cm.imageLink);
    _carts[ind] = updateCm;

    await _cartModelRepos.updateCart(id, updateCm.amount.toString(),
        (updateCm.price * updateCm.amount).toString());

    notifyListeners();
  }

  double calculateTotalCost() {
    double sum = 0;
    for (int i = 0; i < _carts.length; i++) {
      sum += _carts[i].total;
    }

    // notifyListeners();

    return sum;
  }

  void setRebuild() {
    notifyListeners();
  }

  Future<List<CartModel>> get carts async {
    _carts = await _cartModelRepos.getCarts();
    return _carts;
  }

  Future<bool> addCart(CartModel cart) async {
    bool didAdd = await _cartModelRepos.addCart(cart);
    notifyListeners();
    return didAdd;
  }

  Future<bool> deleteCart(int id) async {
    bool didDelete = await _cartModelRepos.deleteCart(id);
    notifyListeners();
    return didDelete;
  }
}
