import '../provider/providers.dart';
import '../utils/Appvars/appvars.dart';
import '../widgets/brand/brandlist.dart';
import '../widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, _) => Scaffold(
        appBar: AppBar(
          title: const Text("Brands"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: FutureBuilder(
              future: ref.read(bandPageProvider).getBrandData(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      height: Appvars.screenSize.height * 0.6,
                      child: const Center(child: LoaderWidget()));
                }
                if (snap.data == null) {
                  return const SizedBox.shrink();
                }
                return Column(
                  children: [Brandlist(models: snap.data!)],
                );
              }),
        ),
      ),
    );
  }
}
