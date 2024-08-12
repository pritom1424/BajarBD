import 'package:bajarbd/model/models/cat_wise_model.dart';

import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class CatWiseRepos {
  Future<List<CatWiseModel>> getProducts() async {
    List<CatWiseModel> product = [];
    try {
      const endPoint = "/homelatestproduct";

      const url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        product = catWiseModelFromJson(response.body);
      }
      return product;
    } catch (e) {
      return [];
    }
  }
}
