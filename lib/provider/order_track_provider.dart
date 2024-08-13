import 'package:bajarbd/model/data/order_track_repos.dart';
import 'package:bajarbd/model/models/order_track_model.dart';
import 'package:bajarbd/utils/db/user_credential.dart';
import 'package:flutter/material.dart';

class OrderTrackProvider with ChangeNotifier {
  final OrderTrackRespos _orderTrackRepos = OrderTrackRespos();

  Future<OrderTrackModel?> getOrderTrack(String orderNumber) async {
    if (UserCredential.userId == null) {
      return null;
    }
    final track = await _orderTrackRepos.getOrderTrack(
        UserCredential.userId!, orderNumber);

    return track;
  }
}
