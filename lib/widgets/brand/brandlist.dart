import '../../model/models/brand_model.dart';
import '../../utils/Appvars/api_links.dart';
import 'brand_tile.dart';
import 'package:flutter/material.dart';

class Brandlist extends StatelessWidget {
  final List<BrandModel> models;
  const Brandlist({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
          models.length,
          (ind) => BrandTile(
              id: models[ind].id,
              name: models[ind].name,
              link: (models[ind].image == null)
                  ? ""
                  : "${ApiLinks.baseImageUrl}/brand/${models[ind].image!}")),
    );
  }
}
