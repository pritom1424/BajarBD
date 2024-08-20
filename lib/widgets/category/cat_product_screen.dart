import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/widgets/loader_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cat_product_item.dart';
import 'package:flutter/material.dart';

class CatProductScreen extends StatelessWidget {
  const CatProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*  List<String> categories = [
      "Clothing",
      "Shoes",
      "Accessories",
      "Bags",
      "Watches",
      "Eyewear",
      "Jewellery"
    ]; */
    return Consumer(builder: (context, ref, ch) {
      return FutureBuilder(
          future: ref.read(productOverviewPageProvider).getCatWiseProduct(),
          builder: (context, snapCategory) {
            if (snapCategory.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: Appvars.screenSize.height * 0.8,
                child: LoaderWidget(),
              );
            }
            if (!snapCategory.hasData) {
              return SizedBox(
                height: Appvars.screenSize.height * 0.8,
                child: Text("no category found!"),
              );
            }
            return Column(children: [
              ListView.builder(
                  itemCount: snapCategory.data!.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, ind) {
                    return CatProductItem(
                      catId: snapCategory.data![ind].id,
                      catName: snapCategory.data![ind].name ?? "",
                    );
                  }),
            ]);
          });
    });
  }
}
