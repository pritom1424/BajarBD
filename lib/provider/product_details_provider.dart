import '../model/data/single_product_repos.dart';
import '../model/models/single_product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider with ChangeNotifier {
  int _sliderIndex = 0;
  final SingleProductRepos _singleProductRepos = SingleProductRepos();

  int get sliderIndex {
    return _sliderIndex;
  }

  void setSliderIndex(int ind) {
    _sliderIndex = ind;
    notifyListeners();
  }

  void resetSliderIndex() {
    _sliderIndex = 0;
  }

  Future<SingleProduct?> getProduct(int id) async {
    SingleProduct? singleProduct =
        await _singleProductRepos.getProduct(id.toString());

    return singleProduct;
  }
}
