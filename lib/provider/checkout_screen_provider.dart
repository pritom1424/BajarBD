import 'package:bajarbd/model/data/online_pay_repos.dart';
import 'package:bajarbd/model/data/ssl_cred_repos.dart';
import 'package:bajarbd/model/models/online_pay_model.dart';
import 'package:bajarbd/model/models/ssl_cred_model.dart';
import 'package:bajarbd/utils/ssl/ssl_payment.dart';

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
  final CheckoutPageRepos checkout_repos;
  final ShippingAddressRespos shipping_add_repos;
  final CustomerDetailsRepos customer_details_repo;
  final CodRepos codRepos;
  final OnlinePayRepos onlinePayRepos;
  final SSLCredRepos sslCredRepos;
/*   final checkout_repos = CheckoutPageRepos();
  final shipping_add_repos = ShippingAddressRespos();
  final customer_details_repo = CustomerDetailsRepos();
  final codRepos = CodRepos();
  final onlinePayRepos = OnlinePayRepos();
  final SSLCredRepos sslCredRepos = SSLCredRepos(); */

  bool _isEdit = false;
  String? _selectedShippingCharge;
  ShippingChargeModel? _shipping;

  CheckoutScreenProvider(
      {required this.checkout_repos,
      required this.shipping_add_repos,
      required this.customer_details_repo,
      required this.codRepos,
      required this.onlinePayRepos,
      required this.sslCredRepos});

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
    final res = await checkout_repos.getProducts();
    print(res);

    return res;
  }

  Future<ShippingAddressModel?> getShippingAddress(int id) async {
    return shipping_add_repos.getAddress(id);
  }

  Future<bool> postShippingAddress(ShippingAddressModel model) async {
    if (UserCredential.userId == null) {
      return false;
    }
    return shipping_add_repos.postAddress(UserCredential.userId!, model);
  }

  Future<Map<String, dynamic>> postOrder(CodModel cdModel) async {
    final res = codRepos.postCodOrder(cdModel);
    return res;
  }

  Future<Map<String, dynamic>> postOnlinePayOrder(OnlinePayModel oModel) async {
    final res = await onlinePayRepos.postOnlineOrder(oModel);
    print("custom transaction id $res");
    return res;
  }

  Future<CustomerDetails?> getCustomerInfo() async {
    if (UserCredential.userId == null) {
      return null;
    }
    final res =
        customer_details_repo.getCustomerDetails(UserCredential.userId!);
    return res;
  }

  Future<void> onlinePaySuccess(
      String transId, String paymentTransid, String paymentMethod) async {
    await onlinePayRepos.paySuccess(transId, paymentTransid, paymentMethod);
  }

  Future<SsLCredModel?> getSSLCred() async {
    return await sslCredRepos.getCred();
  }

  Future<void> onlinePayFail(String transId) async {
    await onlinePayRepos.payFail(transId);
  }
}
