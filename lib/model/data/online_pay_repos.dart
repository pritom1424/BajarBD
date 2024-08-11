import 'dart:convert';

import 'package:bajarbd/model/models/online_pay_model.dart';

import '../models/cod_model.dart';

import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class OnlinePayRepos {
  final _headers = {'Content-Type': 'application/json'};
  final endPoint = "/online-pay";
  /* Future<ShippingAddressModel?> getAddress(int id) async {
    try {
      final url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        final model = shippingAddressModelFromJson(response.body);
        if (model.addressLineOne == null ||
            model.district == null ||
            model.postOffice == null ||
            model.postalCode == null) {
          return null;
        }
        return model;
      }
      return null;
    } catch (e) {
      return null;
    }
  } */

  Future<Map<String, dynamic>> postOnlineOrder(OnlinePayModel model) async {
    try {
      final url = ApiLinks.baseurl + endPoint;
      print("online json model" + onlinePayModelToJson(model));
      final response = await http.post(Uri.parse(url),
          body: onlinePayModelToJson(model), headers: _headers);
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        print("success_message: ${jsonDecode(response.body)['success']}");
        return {
          "message": jsonDecode(response.body)['success'],
          "isSuccess": true
        };
      }
      return {"message": "Order placement failed!", "isSuccess": false};
    } catch (e) {
      return {"message": "Order placement error!", "isSuccess": false};
    }
  }

  Future<void> paySuccess(
      String transId, String paymentTransid, String pMethod) async {
    String endPoint = "/success";
    final url = ApiLinks.baseurl + endPoint;
    final data = {
      "tnx_id": transId,
      "payment_transaction_id": paymentTransid,
      "payment_method": pMethod
    };
    final response = await http.post(Uri.parse(url),
        body: json.encode(data), headers: _headers);
    print("response online pay ${response.body}");
  }

  Future<void> payFail(String transId) async {
    String endPoint = "/fail-cancel";
    final url = ApiLinks.baseurl + endPoint;
    final data = {
      "tnx_id": transId,
    };
    final response = await http.post(Uri.parse(url),
        body: json.encode(data), headers: _headers);
    print("response online pay fail ${response.body}");
  }
}
