import 'package:bajarbd/model/data/settings_repos.dart';
import 'package:bajarbd/model/models/address_model.dart';
import 'package:bajarbd/utils/db/user_credential.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  final _settingsRepos = SettingsRepos();
  bool _isLoading = false;
  bool _isEdit = false;
  Future<String> updatePassword(String pass) async {
    if (UserCredential.userId == null) {
      return "Illegal try!";
    }
    final didSuccess =
        await _settingsRepos.updatePass(UserCredential.userId!, pass);
    if (didSuccess) {
      return "Password update successful";
    } else {
      return "Password update failed!";
    }
  }

  bool get isEdit {
    return _isEdit;
  }

  void setEdit(bool didEdit) {
    _isEdit = didEdit;
    notifyListeners();
  }

  void setLoading(bool isLoad) {
    _isLoading = isLoad;
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }

  void setRebuild() {
    notifyListeners();
  }

  Future<bool> addAddress(AddressModel model) async {
    if (UserCredential.userId == null) {
      return false;
    }
    return _settingsRepos.postAddress(model);
  }
}
