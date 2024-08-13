import 'dart:convert';

import 'package:bajarbd/model/models/order_track_model.dart';

import '../models/shipping_address_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class OrderTrackRespos {
  final _headers = {'Content-Type': 'application/json'};
  /*  Future<OrderTrackModel?> getTrack(int id, int orderNum) async {
    try {
      final endPoint = "/checkout/get-address/$id";
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

  Future<OrderTrackModel?> getOrderTrack(int id, String orderNum) async {
    try {
      final endPoint = "/order-detail";
      final url = ApiLinks.baseurl + endPoint;
      var data = {"user_id": id, "order_number": orderNum};
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(data), headers: _headers);
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        final model = orderTrackModelFromJson(response.body);
        return model;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
