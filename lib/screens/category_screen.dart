import '../utils/Appvars/appvars.dart';
import '../widgets/category/cat_product_screen.dart';
import '../widgets/category/side_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: SizedBox(
        height: Appvars.screenSize.height * 1,
        child: const Row(
          children: [
            Expanded(child: SideScreen()),
            Expanded(flex: 3, child: CatProductScreen())
          ],
        ),
      ),
    );
  }
}
