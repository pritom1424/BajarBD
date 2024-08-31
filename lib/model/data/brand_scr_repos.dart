import 'package:bajarbd/model/models/brand_wise_model.dart';

import '../models/brand_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class BrandScrRepos {
  Future<List<BrandModel>> getProducts() async {
    try {
      const endPoint = "/getbrand";

      const url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        return brandModelFromJson(response.body);
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<BrandWiseProductsModel>> getBrandWiseProducts(int id) async {
    try {
      final endPoint = "/getbrandproduct/$id";

      final url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        return brandWiseProductsModelFromJson(response.body);
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
