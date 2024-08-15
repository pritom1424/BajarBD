import 'package:bajarbd/model/models/order_history_model.dart';
import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/screens/track_order.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:bajarbd/utils/app_methods.dart';
import 'package:bajarbd/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderTile extends StatelessWidget {
  final OrderHistoryModel orderHistoryModel;
  const OrderTile({
    super.key,
    required this.orderHistoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppMethods().orderDate(orderHistoryModel.orderDate),
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.file_copy),
                // Image.asset(logo, width: 40, height: 40),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("order no:${orderHistoryModel.orderNumber}",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                        Text(
                          "transaction id: ${orderHistoryModel.tnxId}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),

                Text('৳${orderHistoryModel.payableAmount}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            // Text(items),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Payment Status: "),
                    Text(
                        (orderHistoryModel.paymentStatus == 0)
                            ? "Unpaid"
                            : "Paid",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (orderHistoryModel.paymentStatus == 0)
                                ? Colors.red
                                : Colors.green)),
                  ],
                ),
                /*  if (orderHistoryModel.paymentStatus == 0)
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Paynow",
                        style: Theme.of(context).textTheme.labelSmall,
                      )) */
                /* Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                      size: 20,
                    );
                  }),
                ), */
              ],
            ),
            const SizedBox(height: 10),
            Consumer(builder: (context, refStatus, ch) {
              return FutureBuilder(
                  future: refStatus
                      .read(orderTrackProvider)
                      .getOrderTrack(orderHistoryModel.orderNumber ?? ""),
                  builder: (context, snapLatest) {
                    if (snapLatest.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SizedBox(
                          height: Appvars.screenSize.height * 0.02,
                          width: Appvars.screenSize.height * 0.02,
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                            color: Colors.blue,
                          ),
                        ),
                      );
                    }
                    if (!snapLatest.hasData) {
                      return SizedBox.shrink();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Order Status:"),
                            Text(
                                "${AppMethods().orderStatusChecker(snapLatest.data!.orderStatus ?? -1)}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        /* Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              color: Colors.orange,
                              size: 20,
                            );
                          }),
                        ), */

                        Row(
                          children: [
                            if (snapLatest.data!.orderStatus! < 5)
                              ElevatedButton(
                                  onPressed: () async {
                                    final state = await refStatus
                                        .watch(orderTrackProvider)
                                        .cancelOrder(
                                            orderHistoryModel.orderNumber!);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: (state)
                                                ? Text(
                                                    "Order cancelled successfully")
                                                : Text(
                                                    "order cancellation failed")));

                                    /*     Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (ctx) => TrackOrder(
                                              orderNum: orderHistoryModel.orderNumber ??
                                                  ""))); */
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      backgroundColor:
                                          Appcolors.appThemeSecondaryColor,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    "Cancel",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(color: Colors.white),
                                  )),
                            if (snapLatest.data!.orderStatus! < 5)
                              SizedBox(
                                width: 10,
                              ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (ctx) => TrackOrder(
                                              orderNum: orderHistoryModel
                                                      .orderNumber ??
                                                  "")));
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    backgroundColor: Appcolors.appThemeColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  "Track",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.white),
                                )),
                          ],
                        )
                      ],
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
