import '../model/data/category_scr_repos.dart';
import '../model/models/cat_model.dart';
import 'package:flutter/material.dart';

class CategoryScreenProvider with ChangeNotifier {
  /* final catscrRepos = CategoryScrRepos(); */
  final CategoryScrRepos catscrRepos;

  List<bool> _clicksBool = [];
  int _itemNumber = 0;

  CategoryScreenProvider({required this.catscrRepos});

  int get itemNumber {
    return _itemNumber;
  }

  List<bool> get clickBool {
    return _clicksBool;
  }

  void setClick(bool didClick, int index, int itmNumb) {
    _itemNumber = itmNumb;

    List<bool> isClicks = List.filled(itemNumber, false);
    isClicks[index] = didClick;
    _clicksBool = isClicks;

    notifyListeners();
  }

  void setItemNumber(int num) {
    _itemNumber = num;
    //notifyListeners();
  }

  bool isClicked(int ind) {
    if (itemNumber == 0) {
      return false;
    }
    if (_clicksBool.isEmpty) {
      _clicksBool = List.filled(itemNumber, false);
      _clicksBool[0] = true;
    }
    return _clicksBool[ind];
  }

  Future<List<CatModel>> getSideData() async {
    final res = await catscrRepos.getProducts();
    return res;
  }
}
