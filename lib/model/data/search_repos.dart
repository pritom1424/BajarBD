import 'dart:convert';
import 'package:bajarbd/model/models/search_itm_model.dart';
import 'package:bajarbd/utils/Appvars/api_links.dart';
import 'package:bajarbd/utils/Appvars/app_constants.dart';
import "package:http/http.dart" as http;

class SearchRepos {
  final _headers = {'Content-Type': 'application/json'};

  Future<List<SearchItemModel>> getSearchResult(String keyword) async {
    try {
      final endPoint = "/searchproduct";
      final url = ApiLinks.baseurl + endPoint;
      final data = {"keyword": keyword};
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(data), headers: _headers);
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        return searchItemModelFromJson(response.body);
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
