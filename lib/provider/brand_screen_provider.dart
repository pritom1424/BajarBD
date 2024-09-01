import 'package:bajarbd/model/models/brand_wise_model.dart';

import '../model/data/brand_scr_repos.dart';
import '../model/models/brand_model.dart';
import 'package:flutter/material.dart';

class BrandScreenProvider with ChangeNotifier {
  final BrandScrRepos bandscrRepos;

  BrandScreenProvider({required this.bandscrRepos});
  /* final bandscrRepos = BrandScrRepos(); */
  Future<List<BrandModel>> getBrandData() async {
    final res = await bandscrRepos.getProducts();

    return res;
  }

  Future<List<BrandWiseProductsModel>> getBrandWiseProducts(
      int productID) async {
    final res = await bandscrRepos.getBrandWiseProducts(productID);

    return res;
  }
}
