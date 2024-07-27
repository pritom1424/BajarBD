import '../models/slider_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class SliderModelRepos {
  Future<List<SliderModel>?> getSliders() async {
    try {
      const endPoint = "/homeslider";
      const url = "${ApiLinks.baseurl}$endPoint";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        // Decode the response body and return the SingleProduct object
        return sliderModelFromJson(response.body);
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
