import 'package:bajarbd/model/models/search_itm_model.dart';
import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/provider/search_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocksearch_repos.dart';

void main() {
  late MockSearchRepos mockSearchRepos;
  late SearchProvider sProvider;
  late ProviderContainer container;

  setUp(() {
    mockSearchRepos = MockSearchRepos();
    container = ProviderContainer(
      overrides: [
        searchRepos.overrideWithValue(mockSearchRepos),
      ],
    );
    sProvider = container.read(searchProvider.notifier);
  });
  tearDown(() {
    container.dispose();
  });
  group("Search Test", () {
    test("search success test", () async {
      final List<SearchItemModel> sItem = [
        SearchItemModel(
            id: 1,
            title: "title",
            unitPrice: "unitPrice",
            discountPrice: "discountPrice",
            featureImage: "featureImage")
      ];

      //arrange
      when(() => mockSearchRepos.getSearchResult(any())).thenAnswer((_) async {
        return sItem;
      });
      //act
      final result = await sProvider.getItems("keyword");
      //assert
      expect(result, sItem);
    });
  });
}
