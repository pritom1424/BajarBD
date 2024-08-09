import '../models/shipping_address_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class ShippingAddressRespos {
  final _headers = {'Content-Type': 'application/json'};
  Future<ShippingAddressModel?> getAddress(int id) async {
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
  }

  Future<bool> postAddress(int id, ShippingAddressModel model) async {
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
  }
}
