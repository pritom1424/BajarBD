import '../models/single_product_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class SingleProductRepos {
  Future<SingleProductModel?> getProduct(String id) async {
    try {
      const endPoint = "/singleproduct";
      final url = "${ApiLinks.baseurl}$endPoint/$id";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == AppConstants.api_success_StatusCode) {
        // Decode the response body and return the SingleProduct object
        return singleProductModelFromJson(response.body);
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
