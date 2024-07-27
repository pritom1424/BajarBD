import '../models/shipping_charge_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class CheckoutPageRepos {
  Future<List<ShippingChargeModel>> getProducts() async {
    List<ShippingChargeModel> product = [];
    try {
      const endPoint = "/getshippingcharge";

      const url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        product = shippingChargeModelFromJson(response.body);
      }
      return product;
    } catch (e) {
      return [];
    }
  }
}
