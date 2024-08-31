import 'package:bajarbd/model/models/brand_wise_model.dart';

import '../model/data/brand_scr_repos.dart';
import '../model/models/brand_model.dart';
import 'package:flutter/material.dart';

class BrandScreenProvider with ChangeNotifier {
  final _bandscrRepos = BrandScrRepos();
  Future<List<BrandModel>> getBrandData() async {
    final res = await _bandscrRepos.getProducts();

    return res;
  }

  Future<List<BrandWiseProductsModel>> getBrandWiseProducts(
      int productID) async {
    final res = await _bandscrRepos.getBrandWiseProducts(productID);

    return res;
  }
}
