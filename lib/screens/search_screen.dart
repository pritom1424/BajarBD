import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/utils/Appvars/api_links.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/widgets/search/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String? searchKeyWord;
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget searchWidget() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchController,
          autofocus: true,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 1, color: Colors.white)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              hintText: "search",
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 1, color: Colors.white))),
          onChanged: (value) {
            if (searchController.text.length >= 3) {
              searchKeyWord = searchController.text;
            } else {
              searchKeyWord = null;
            }
            setState(() {});
            /*   Provider.of<EmployeeDataController>(context, listen: false)
                .filterUserData(value); */

            // filterUsers(value, snapshot.data!);
          },
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: searchWidget(),
        ),
        body: Consumer(builder: (context, refSearch, ch) {
          return (searchKeyWord == null)
              ? SizedBox.shrink()
              : FutureBuilder(
                  future:
                      refSearch.read(searchProvider).getItems(searchKeyWord!),
                  builder: (context, snapSearch) {
                    if (!snapSearch.hasData) {
                      return SizedBox.shrink();
                    }
                    if (snapSearch.data!.isEmpty) {
                      return SizedBox(
                        height: Appvars.screenSize.height * 0.8,
                        child: Center(
                            child: Text(
                          "No prduct found!",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapSearch.data!.length,
                        itemBuilder: (ctx, ind) => SearchItem(
                            snapSearch.data![ind].id,
                            discountPrice: snapSearch.data![ind].discountPrice,
                            link:
                                "${ApiLinks.baseImageUrl}/product/${snapSearch.data![ind].featureImage!}",
                            title: snapSearch.data![ind].title ?? "",
                            unitPrice:
                                snapSearch.data![ind].unitPrice ?? "0.0"));
                  });
        }));
  }
}
