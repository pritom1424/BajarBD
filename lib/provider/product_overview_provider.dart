import 'package:bajarbd/model/data/bestsell_product_repos.dart';
import 'package:bajarbd/model/data/featured_product_repos.dart';
import 'package:bajarbd/model/data/hotdeal_product_repos.dart';
import 'package:bajarbd/model/models/best_sell_model.dart';
import 'package:bajarbd/model/models/featured_product_model.dart';
import 'package:bajarbd/model/models/home_cat_wise_model.dart';
import 'package:bajarbd/model/models/hot_deal_product.dart';

import '../model/data/home_latest_product_repos.dart';
import '../model/data/slider_model_repos.dart';
import '../model/models/home_latest_model.dart';
import '../model/models/slider_model.dart';
import 'package:flutter/material.dart';

class ProductOverviewProvider with ChangeNotifier {
  /*  final HomeLatestProductRepos _homeLatestProductRepos =
      HomeLatestProductRepos();
  final SliderModelRepos _sliderModelRepos = SliderModelRepos();
  final FeaturedProductRepos _featuredProductRepos = FeaturedProductRepos();
  final HotDealProductRepos _hotDealProductRepos = HotDealProductRepos();
  final BestSellProductRepos _bestSellProductRepos = BestSellProductRepos(); */
  final HomeLatestProductRepos homeLatestProductRepos;
  final SliderModelRepos sliderModelRepos;
  final FeaturedProductRepos featuredProductRepos;
  final HotDealProductRepos hotDealProductRepos;
  final BestSellProductRepos bestSellProductRepos;

  ProductOverviewProvider(
      {required this.homeLatestProductRepos,
      required this.sliderModelRepos,
      required this.featuredProductRepos,
      required this.hotDealProductRepos,
      required this.bestSellProductRepos});

  Future<List<HomeLatestProduct>> getHomeLatestProducts() async {
    final products = await homeLatestProductRepos.getProducts();

    return products;
  }

  Future<List<SliderModel>?> getSliders() async {
    return await sliderModelRepos.getSliders();
  }

  Future<List<HomeCatWiseModel>> getCatWiseProduct() async {
    final products = await homeLatestProductRepos.getCatProducts();

    return products;
  }

  Future<List<Fetauredproduct>?> getFeaturedProducts() async {
    return await featuredProductRepos.getProducts();
  }

  Future<List<HotDealModel>?> getHotProducts() async {
    return await hotDealProductRepos.getProducts();
  }

  Future<List<BestSellingProductModel>?> getBestSellProducts() async {
    return await bestSellProductRepos.getProducts();
  }
}
