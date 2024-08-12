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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: CatProductScreen(),
      ),
    );
  }
}
