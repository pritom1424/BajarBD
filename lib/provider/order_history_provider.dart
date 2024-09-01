import 'package:bajarbd/model/data/order_history_repos.dart';
import 'package:bajarbd/model/models/order_history_model.dart';
import 'package:bajarbd/utils/db/user_credential.dart';
import 'package:flutter/material.dart';

class OrderHistoryProvider with ChangeNotifier {
  /*  final OrderHistoryRepos orderHistoryRepos = OrderHistoryRepos(); */
  final OrderHistoryRepos orderHistoryRepos;

  OrderHistoryProvider({required this.orderHistoryRepos});

  Future<List<OrderHistoryModel>> getOrderHistory() async {
    if (UserCredential.userId == null) {
      return [];
    }
    final products = await orderHistoryRepos.getHistory(UserCredential.userId!);

    return products;
  }
}
