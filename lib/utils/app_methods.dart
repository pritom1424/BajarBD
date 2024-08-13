import 'package:intl/intl.dart';

import '../provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppMethods {
  void onNavButtonTap(int ind, WidgetRef ref) {
    ref.watch(rootPageProvider).setNavPageIndex(ind);
  }

  String orderDate(DateTime dt) {
    final dateString = DateFormat("EEE, M-d-y").format(dt);
    return dateString;
  }

  String orderStatusChecker(int statId) {
    switch (statId) {
      case 0:
        return "Initiated";
      case 1:
        return "Confirmed";
      case 2:
        return "Processing";
      case 3:
        return "Picked";
      case 4:
        return "Shipped";
      case 5:
        return "Delivered";
      case 6:
        return "Cancelled";
      case 7:
        return "Refunded";
      case 8:
        return "Returned";

      default:
        return "Unknown";
    }
  }
}
