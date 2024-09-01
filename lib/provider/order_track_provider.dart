import 'package:bajarbd/model/data/order_track_repos.dart';
import 'package:bajarbd/model/models/order_track_model.dart';
import 'package:bajarbd/utils/db/user_credential.dart';
import 'package:flutter/material.dart';

class OrderTrackProvider with ChangeNotifier {
  /*  final OrderTrackRespos orderTrackRepos = OrderTrackRespos(); */
  final OrderTrackRespos orderTrackRepos;

  OrderTrackProvider({required this.orderTrackRepos});

  Future<OrderTrackModel?> getOrderTrack(String orderNumber) async {
    if (UserCredential.userId == null) {
      print("order history null" + "uid prob");
      return null;
    }
    final track = await orderTrackRepos.getOrderTrack(
        UserCredential.userId!, orderNumber);

    return track;
  }

  Future<bool> cancelOrder(String orderNumber) async {
    if (UserCredential.userId == null) {
      return false;
    }
    notifyListeners();
    return await orderTrackRepos.cancelOrder(
        UserCredential.userId!, orderNumber);
  }

  Stream<OrderTrackModel?> getOrderTrackStream(String orderNumber) {
    return Stream.periodic(const Duration(seconds: 1)).asyncMap((_) async {
      // Check for user ID
      if (UserCredential.userId == null) {
        return null;
      }

      try {
        // Fetch order tracking details
        final track = await orderTrackRepos.getOrderTrack(
          UserCredential.userId!,
          orderNumber,
        );

        return track; // Return the fetched tracking information
      } catch (e) {
        return null; // Handle any errors by returning null
      }
    });
  }
}
