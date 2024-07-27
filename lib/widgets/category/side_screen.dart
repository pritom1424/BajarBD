import '../../provider/providers.dart';
import '../../utils/Appvars/api_links.dart';
import 'side_screen_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideScreen extends ConsumerWidget {
  const SideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catIcons = [
      {"icon": Icons.person_2_outlined, "cat_name": "Just for you"},
      {"icon": Icons.shopping_bag, "cat_name": "Women's & Girls' Fashion"},
      {"icon": Icons.health_and_safety, "cat_name": "Health & Beauty"},
      {"icon": Icons.camera_alt, "cat_name": "Electronic Device"},
      {"icon": Icons.tv, "cat_name": "Tv & Home Appliances"},
      {"icon": Icons.usb, "cat_name": "Electronic Accssesories"},
      {"icon": Icons.shopping_cart, "cat_name": "Groceries & Pets"},
      {"icon": Icons.home, "cat_name": "Home & Lifestyle"},
      {"icon": Icons.sports_basketball, "cat_name": "Sports & Outdoors"},
      {"icon": Icons.toys, "cat_name": "Mother & Baby"},
      {"icon": Icons.camera_alt, "cat_name": "Electronic Device"},
      {"icon": Icons.tv, "cat_name": "Tv & Home Appliances"},
      {"icon": Icons.usb, "cat_name": "Electronic Accssesories"},
      {"icon": Icons.shopping_cart, "cat_name": "Groceries & Pets"},
      {"icon": Icons.home, "cat_name": "Home & Lifestyle"}
    ];

    return SizedBox(
      // color: const Color.fromARGB(255, 228, 224, 224),
      height: double.infinity,
      child: FutureBuilder(
          future: ref.read(categoryPageProvider).getSideData(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting ||
                snap.data == null) {
              return const SizedBox.shrink();
            }
            final data = snap.data!;
            print("side data: $data");
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, ind) => SideScreenItem(
                      categoryIcon: (data[ind].image == null)
                          ? ""
                          : "${ApiLinks.baseImageUrl}/category/${data[ind].image}",
                      catName: data[ind].name.toString(),
                      itemNumber: catIcons.length,
                      index: ind,
                    ));
          }),
    );
  }
}
