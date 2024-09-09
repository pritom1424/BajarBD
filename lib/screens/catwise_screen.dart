import 'package:bajarbd/widgets/category/catwise/catwise_grids.dart';

import '../provider/providers.dart';
import '../utils/Appvars/appvars.dart';
import '../widgets/carousel/featured_product_widget.dart';
import '../widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatWiseScreen extends StatefulWidget {
  final String? title;
  final int catId;
  const CatWiseScreen({super.key, this.title, required this.catId});

  @override
  State<CatWiseScreen> createState() => _CatWiseScreenState();
}

class _CatWiseScreenState extends State<CatWiseScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget searchWidget() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchController,
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
            /*   Provider.of<EmployeeDataController>(context, listen: false)
                  .filterUserData(value); */

            // filterUsers(value, snapshot.data!);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: (widget.title == null) ? null : Text(widget.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //searchWidget(),
            //         const FeaturedProductWidget(),
            Consumer(builder: (ctx, ref, _) {
              return FutureBuilder(
                  future: ref
                      .watch(catWiseProvider)
                      .getCatWiseProducts(widget.catId),
                  builder: (ctx, snapLatestProduct) {
                    if (snapLatestProduct.connectionState ==
                        ConnectionState.waiting) {
                      return SizedBox(
                          height: Appvars.screenSize.height * 0.8,
                          child: const Center(child: LoaderWidget()));
                    }
                    if (!snapLatestProduct.hasData ||
                        snapLatestProduct.data!.product!.isEmpty) {
                      return SizedBox(
                        height: Appvars.screenSize.height * 0.8,
                        child: const Center(
                          child: Text("No products found!"),
                        ),
                      );
                    }
                    return CatWiseGrids(
                      false,
                      isScroll: false,
                      model: snapLatestProduct.data!,
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
