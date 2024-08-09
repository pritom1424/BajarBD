import 'dart:convert';

import '../models/cod_model.dart';

import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class CodRepos {
  final _headers = {'Content-Type': 'application/json'};
  final endPoint = "/cod-order";
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

  Future<Map<String, dynamic>> postCodOrder(CodModel model) async {
    try {
      final url = ApiLinks.baseurl + endPoint;
      final response = await http.post(Uri.parse(url),
          body: codModelToJson(model), headers: _headers);
      if (response.statusCode == AppConstants.api_success_StatusCode) {
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
}
