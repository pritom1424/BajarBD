import 'package:bajarbd/model/models/home_cat_wise_model.dart';

import '../models/home_latest_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class HomeLatestProductRepos {
  Future<List<HomeLatestProduct>> getProducts() async {
    List<HomeLatestProduct> product = [];
    try {
      const endPoint = "/homelatestproduct";

      const url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        product = homeLatestProductFromJson(response.body);
      }
      return product;
    } catch (e) {
      return [];
    }
  }

  Future<List<HomeCatWiseModel>> getCatProducts() async {
    List<HomeCatWiseModel> product = [];
    try {
      const endPoint = "/catwiseproduct";

      const url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        product = homeCatWiseModelFromJson(response.body);
      }
      return product;
    } catch (e) {
      return [];
    }
  }
}
