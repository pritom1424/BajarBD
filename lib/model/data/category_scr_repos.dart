import '../models/cat_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class CategoryScrRepos {
  Future<List<CatModel>> getProducts() async {
    try {
      const endPoint = "/getcategory";

      const url = ApiLinks.baseurl + endPoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        return catModelFromJson(response.body);
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
