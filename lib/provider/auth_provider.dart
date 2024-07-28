import 'dart:async';
import 'package:bajarbd/model/data/auth_repos.dart';
import 'package:bajarbd/utils/db/user_credential.dart';

import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  // String _token = "";
  // DateTime _expiryDate = DateTime(0);
  // int? _userId;
  bool _isLoading = false;

  Timer _authTimer = Timer(Duration.zero, () {});
  AuthRepos _authRepos = AuthRepos();
  bool get isAuth {
    return UserCredential.token?.isNotEmpty ?? false;
  }

  Future<int> SignUp(String fName, String lName, String ph, String email,
      String password, String addr) async {
    try {
      final response = await _authRepos.Authenticate(
          fName, lName, ph, email, password, addr);

      if (response != null) {
        autoLogout();
        notifyListeners();
        return response.status;
      }

      return -1;
    } catch (error) {
      print("Error Auth: ${error.toString()}");

      return -1;
    }
  }

  Future<int> Login(String emailOrPh, String password) async {
    try {
      final response =
          await _authRepos.Login(emailOrPh, password, UserCredential.address);

      if (response != null) {
        autoLogout();
        notifyListeners();
        return response.status;
      }

      return -1;
    } catch (error) {
      print("Error Login: ${error.toString()}");

      return -1;
    }
  }

  void logout() async {
    final stat = await _authRepos.logout();
  }

  Future<bool> tryAutoLogin() async {
    return await _authRepos.tryAutoLogin();
  }

  void setRebuild() {
    notifyListeners();
  }

  void autoLogout() {
    if (_authTimer != Timer(Duration.zero, () {})) {
      _authTimer.cancel();
    }
    if (UserCredential.expiryDate != null) {
      final timeToExpiry =
          UserCredential.expiryDate!.difference(DateTime.now()).inSeconds;

      _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
    }
  }

  void setLoading(bool isLoad) {
    _isLoading = isLoad;
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }
}
