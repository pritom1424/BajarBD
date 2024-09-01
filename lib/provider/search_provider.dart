import 'package:bajarbd/model/data/search_repos.dart';
import 'package:bajarbd/model/models/search_itm_model.dart';

import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  /*  SearchRepos searchRepos = SearchRepos(); */
  final SearchRepos searchRepos;

  SearchProvider({required this.searchRepos});

  Future<List<SearchItemModel>> getItems(String keyword) {
    final items = searchRepos.getSearchResult(keyword);

    return items;
  }
}
