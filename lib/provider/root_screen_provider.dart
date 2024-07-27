import 'package:flutter/cupertino.dart';

class RootScreenProvider with ChangeNotifier {
  int _navPageIndex = 0;

  int get navPageIndex {
    return _navPageIndex;
  }

  void setNavPageIndex(int ind) {
    _navPageIndex = ind;
    notifyListeners();
  }
}
