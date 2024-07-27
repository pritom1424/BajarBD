import 'package:flutter/material.dart';

class ProfileScreenProvider with ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin {
    return _isLogin;
  }

  void setLogin(bool didLogin) {
    _isLogin = didLogin;
    notifyListeners();
  }
}
