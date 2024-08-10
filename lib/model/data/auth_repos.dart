import 'dart:async';

import '../models/register_model.dart';
import '../../utils/Appvars/api_links.dart';
import '../../utils/db/user_credential.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class AuthRepos {
  final _headers = {'Content-Type': 'application/json'};

  Future<RegisterModel?> Authenticate(String firstName, String lastName,
      String? phone, String? email, String password, String? address) async {
    try {
      const endPoint = "/customer/register";
      Map<String, dynamic> data = {
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'email': email,
        'password': password,
        'address': address
      };

      final response = await http.post(Uri.parse(ApiLinks.baseurl + endPoint),
          body: jsonEncode(data), headers: _headers);
      if (response.statusCode == 200) {
        final jsonResponse = registerResponseModelFromJson(response.body);

        final expiryDate =
            DateTime.now().add(Duration(seconds: jsonResponse.expiresIn));
        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'token': jsonResponse.accessToken,
          'userId': jsonResponse.userId,
          'expiryDate': expiryDate.toIso8601String(),
          'emailOrPhone': jsonResponse.email,
          'tokenType': jsonResponse.tokenType,
          'status': jsonResponse.status,
          'address': address,
          'password': password
        });

        prefs.remove('userData');

        prefs.setString('userData', userData);
        return jsonResponse;
      }
      return null;
    } catch (e) {
      print("register failed error: $e");
      return null;
    }
  }

  Future<RegisterModel?> Login(email, String password, String? address) async {
    try {
      const endPoint = "/customer/login";
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };

      final response = await http.post(Uri.parse(ApiLinks.baseurl + endPoint),
          body: jsonEncode(data), headers: _headers);
      if (response.statusCode == 200) {
        final jsonResponse = registerResponseModelFromJson(response.body);

        final token = jsonResponse.accessToken;
        final userId = jsonResponse.userId;
        final expiryDate =
            DateTime.now().add(Duration(seconds: jsonResponse.expiresIn));

        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'token': token,
          'userId': userId,
          'expiryDate': expiryDate.toIso8601String(),
          'emailOrPhone': jsonResponse.email,
          'tokenType': jsonResponse.tokenType,
          'status': jsonResponse.status,
          'address': address,
          'password': password
        });

        prefs.remove('userData');

        prefs.setString('userData', userData);

        return jsonResponse;
      }
      return null;
    } catch (e) {
      print("login failed error: $e");
      return null;
    }
  }

  Future<bool> logout() async {
    UserCredential.reset();

    //notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();

      prefs.remove('userData');
      prefs.clear();

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("userData")) {
      return false;
    }

    final extractedData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    final expiryDate = DateTime.parse(extractedData['expiryDate'] as String);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    UserCredential.token = extractedData['token'].toString();
    UserCredential.userId = int.tryParse(extractedData['userId'].toString());
    UserCredential.expiryDate = expiryDate;
    UserCredential.status = extractedData['status'];
    UserCredential.emailOrPhone = extractedData['emailOrPhone'];

    return true;
  }
}
