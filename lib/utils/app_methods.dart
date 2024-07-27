import '../provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppMethods {
  void onNavButtonTap(int ind, WidgetRef ref) {
    ref.watch(rootPageProvider).setNavPageIndex(ind);
  }
}
