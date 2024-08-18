import 'package:bajarbd/model/models/home_cat_wise_model.dart';

import '../model/data/home_latest_product_repos.dart';
import '../model/data/slider_model_repos.dart';
import '../model/models/home_latest_model.dart';
import '../model/models/slider_model.dart';
import 'package:flutter/material.dart';

class ProductOverviewProvider with ChangeNotifier {
  final HomeLatestProductRepos _homeLatestProductRepos =
      HomeLatestProductRepos();
  final SliderModelRepos _sliderModelRepos = SliderModelRepos();

  Future<List<HomeLatestProduct>> getHomeLatestProducts() async {
    final products = await _homeLatestProductRepos.getProducts();

    return products;
  }

  Future<List<SliderModel>?> getSliders() async {
    return await _sliderModelRepos.getSliders();
  }

  Future<List<HomeCatWiseModel>> getCatWiseProduct() async {
    final products = await _homeLatestProductRepos.getCatProducts();

    return products;
  }
}
