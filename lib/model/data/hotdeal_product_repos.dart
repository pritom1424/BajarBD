import 'package:bajarbd/model/models/featured_product_model.dart';
import 'package:bajarbd/model/models/hot_deal_product.dart';

import '../models/slider_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class HotDealProductRepos {
  Future<List<HotDealModel>?> getProducts() async {
    try {
      const endPoint = "/hotdealproducts";
      const url = "${ApiLinks.baseurl}$endPoint";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        // Decode the response body and return the SingleProduct object
        return hotDealModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      // Handle any errors here
      print("Error: $e");
      print("response: $e");
      return null;
    }
  }
}
