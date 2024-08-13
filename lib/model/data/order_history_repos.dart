import 'package:bajarbd/model/models/order_history_model.dart';

import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class OrderHistoryRepos {
  //final _headers = {'Content-Type': 'application/json'};

  Future<List<OrderHistoryModel>> getHistory(int id) async {
    try {
      final endPoint = "/get-order/$id";
      final url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        final model = orderHistoryModelFromJson(response.body);

        return model;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  /* Future<bool> postAddress(int id, ShippingAddressModel model) async {
    try {
      final endPoint = "/checkout/address/store/$id";
      final url = ApiLinks.baseurl + endPoint;
      final response = await http.post(Uri.parse(url),
          body: shippingAddressModelToJson(model), headers: _headers);
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  } */
}
