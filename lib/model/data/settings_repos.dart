import 'dart:convert';

import 'package:bajarbd/model/models/address_model.dart';
import 'package:bajarbd/utils/Appvars/api_links.dart';
import 'package:bajarbd/utils/Appvars/app_constants.dart';
import "package:http/http.dart" as http;

class SettingsRepos {
  final _headers = {'Content-Type': 'application/json'};
  Future<bool> updatePass(int userID, String password) async {
    String endPoint = "/update-password";
    final url = ApiLinks.baseurl + endPoint;
    final data = {"password": password, "user_id": userID};
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(data), headers: _headers);
      print("response update password ${response.body}");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> postAddress(AddressModel model) async {
    try {
      final endPoint = "/update-address";
      final url = ApiLinks.baseurl + endPoint;
      final response = await http.post(Uri.parse(url),
          body: addressModelToJson(model), headers: _headers);
      if (response.statusCode == AppConstants.api_success_StatusCode) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
