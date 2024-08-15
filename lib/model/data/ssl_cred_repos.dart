import 'package:bajarbd/model/models/ssl_cred_model.dart';
import 'package:bajarbd/utils/Appvars/api_links.dart';
import 'package:bajarbd/utils/Appvars/app_constants.dart';
import 'package:http/http.dart' as http;

class SSLCredRepos {
  Future<SsLCredModel?> getCred() async {
    try {
      const endPoint = "/sslcredential";
      const url = "${ApiLinks.baseurl}$endPoint";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        // Decode the response body and return the SingleProduct object
        return ssLCredModelFromJson(response.body);
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
