import 'package:bajarbd/model/data/cat_wise_repos.dart';
import 'package:bajarbd/model/models/cat_wise_model.dart';

import '../model/data/slider_model_repos.dart';

import '../model/models/slider_model.dart';
import 'package:flutter/material.dart';

class CatWiseProvider with ChangeNotifier {
  final CatWiseRepos _homeLatestProductRepos = CatWiseRepos();
  final SliderModelRepos _sliderModelRepos = SliderModelRepos();

  Future<CatWiseModel?> getCatWiseProducts(int catId) async {
    final products = await _homeLatestProductRepos.getProducts(catId);

    return products;
  }

  Future<List<SliderModel>?> getSliders() async {
    return await _sliderModelRepos.getSliders();
  }
}
