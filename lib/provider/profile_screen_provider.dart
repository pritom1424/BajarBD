import 'package:flutter/material.dart';

class ProfileScreenProvider with ChangeNotifier {
  bool _isLogin = false;
  bool _isEditMode = false;
  ProfileScreenProvider();

  bool get isLogin {
    return _isLogin;
  }

  bool get isEditMode {
    return _isEditMode;
  }

  void setEditMode(bool isEdit) {
    _isEditMode = isEdit;
    notifyListeners();
  }

  void setLogin(bool didLogin) {
    _isLogin = didLogin;
    notifyListeners();
  }
}
