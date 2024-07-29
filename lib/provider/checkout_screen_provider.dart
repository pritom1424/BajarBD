import '../model/data/checkout_page_repos.dart';
import '../model/models/shipping_charge_model.dart';
import 'package:flutter/material.dart';

class CheckoutScreenProvider with ChangeNotifier {
  final _checkout_repos = CheckoutPageRepos();
  ShippingChargeModel? _shipping;

  ShippingChargeModel? get shipCharge {
    return _shipping;
  }

  void setShipping(ShippingChargeModel? shipType) {
    _shipping = shipType;
    notifyListeners();
  }

  Future<List<ShippingChargeModel>> getShippingData() async {
    final res = await _checkout_repos.getProducts();
    print(res);

    return res;
  }
}
