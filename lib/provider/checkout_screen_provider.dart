import 'package:bajarbd/model/data/online_pay_repos.dart';
import 'package:bajarbd/model/models/online_pay_model.dart';

import '../model/data/cod_repos.dart';
import '../model/data/customer_details_repos.dart';
import '../model/data/shipping_address_repos.dart';
import '../model/models/cod_model.dart';
import '../model/models/customer_details.dart';
import '../model/models/shipping_address_model.dart';
import '../utils/db/user_credential.dart';

import '../model/data/checkout_page_repos.dart';
import '../model/models/shipping_charge_model.dart';
import 'package:flutter/material.dart';

class CheckoutScreenProvider with ChangeNotifier {
  final _checkout_repos = CheckoutPageRepos();
  final _shipping_add_repos = ShippingAddressRespos();
  final _customer_details_repo = CustomerDetailsRepos();
  final _codRepos = CodRepos();
  final _onlinePayRepos = OnlinePayRepos();
  bool _isEdit = false;
  String? _selectedShippingCharge;
  ShippingChargeModel? _shipping;

  ShippingChargeModel? get shipCharge {
    return _shipping;
  }

  String? get selectedShippingCharge {
    return _selectedShippingCharge;
  }

  bool get isEdit {
    return _isEdit;
  }

  void setCurrentShipping(String? chargeName) {
    _selectedShippingCharge = chargeName;
    notifyListeners();
  }

  void setEdit(bool didEdit) {
    _isEdit = didEdit;
    notifyListeners();
  }

  void setShipping(ShippingChargeModel? shipType) {
    _shipping = shipType;
    notifyListeners();
  }

  void setRebuild() {
    notifyListeners();
  }

  Future<List<ShippingChargeModel>> getShippingData() async {
    final res = await _checkout_repos.getProducts();
    print(res);

    return res;
  }

  Future<ShippingAddressModel?> getShippingAddress(int id) async {
    return _shipping_add_repos.getAddress(id);
  }

  Future<bool> postShippingAddress(ShippingAddressModel model) async {
    if (UserCredential.userId == null) {
      return false;
    }
    return _shipping_add_repos.postAddress(UserCredential.userId!, model);
  }

  Future<Map<String, dynamic>> postOrder(CodModel cdModel) async {
    final res = _codRepos.postCodOrder(cdModel);
    return res;
  }

  Future<Map<String, dynamic>> postOnlinePayOrder(OnlinePayModel oModel) async {
    final res = _onlinePayRepos.postCodOrder(oModel);
    return res;
  }

  Future<CustomerDetails?> getCustomerInfo() async {
    if (UserCredential.userId == null) {
      return null;
    }
    final res =
        _customer_details_repo.getCustomerDetails(UserCredential.userId!);
    return res;
  }
}
