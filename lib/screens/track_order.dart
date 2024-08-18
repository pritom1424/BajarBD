import 'package:bajarbd/model/models/cart_model.dart';
import 'package:bajarbd/model/models/order_track_model.dart';
import 'package:bajarbd/screens/checkout_page.dart';
import 'package:bajarbd/screens/product_details_screen.dart';
import 'package:bajarbd/utils/app_methods.dart';
import 'package:bajarbd/utils/db/user_credential.dart';
import 'package:bajarbd/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';

import '../provider/providers.dart';
import '../root_page.dart';
import '../utils/Appvars/app_constants.dart';
import '../utils/Appvars/appvars.dart';
import '../utils/Colors/appcolors.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackOrder extends StatelessWidget {
  final String orderNum;

  const TrackOrder({super.key, required this.orderNum});
  @override
  Widget build(BuildContext context) {
    Map<String, String> orderNames = {
      "Order placed": "We have received your order!",
      "Order confirmed": "Order has been confirmed successfully!",
      "Order processing": "Order is processing!",
      "Order picked": "Order is picked!",
      "Order shipped": "Order has been shipped!",
      "Order delivered": "Order has been delivered!",
      "Order cancelled": "Order has been cancelled!",
      "Order refunded": "Order has been refunded!",
      "Order returned": "Order has been returned",
    };
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Track Order"),
        ),
        backgroundColor: Appcolors.offwhite,
        /*   appBar: AppBar(
          title: Text('Order Confirmation'),
        ), */
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Consumer(builder: (context, refTrackOrder, ch) {
            return FutureBuilder(
                future: refTrackOrder
                    .read(orderTrackProvider)
                    .getOrderTrack(orderNum),
                builder: (context, snapTrackOrder) {
                  if (snapTrackOrder.connectionState ==
                      ConnectionState.waiting) {
                    return SizedBox(
                      height: Appvars.screenSize.height * 0.6,
                      child: Center(
                        child: LoaderWidget(),
                      ),
                    );
                  }
                  if (!snapTrackOrder.hasData) {
                    return SizedBox(
                      height: Appvars.screenSize.height,
                      child: Center(
                        child: Text("No order to track!"),
                      ),
                    );
                  }

                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: Appcolors.appThemeColor,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Image.asset(
                            AppConstants
                                .logoAltLink, // Replace with actual image URL
                            height: Appvars.screenSize.height * 0.2,

                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Order Number: ${snapTrackOrder.data!.orderNumber}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Payment",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.blue[200],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(((snapTrackOrder
                                                    .data!.paymentStatus ==
                                                0)
                                            ? "Unpaid"
                                            : "Paid")),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              /*  SizedBox(height: 8),
                              Row(
                                children: [
                                  if (snapTrackOrder.data!.paymentDate != null)
                                    Text(
                                      'payment date: ${snapTrackOrder.data!.paymentDate}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                ],
                              ), */
                              SizedBox(height: 16),
                              SizedBox(
                                height: Appvars.screenSize.height * 0.15,
                                child: FutureBuilder(
                                    future: refTrackOrder
                                        .read(wishlistPageProvider)
                                        .getWishlist,
                                    builder: (context, snapWishList) {
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapTrackOrder
                                            .data!.orderDetail.length,
                                        itemBuilder: (ctx, ind) => InkWell(
                                          onTap: () {
                                            bool didDisableFav = (snapWishList
                                                        .data !=
                                                    null &&
                                                snapWishList.data!.any((itm) =>
                                                    itm.id ==
                                                    snapTrackOrder.data!
                                                        .orderDetail[ind].id));
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        ProductDetailsScreen(
                                                            disableNavbar: true,
                                                            snapTrackOrder
                                                                .data!
                                                                .orderDetail[
                                                                    ind]
                                                                .id,
                                                            false,
                                                            isFav:
                                                                didDisableFav)));
                                          },
                                          child: Container(
                                              width: Appvars.screenSize.width *
                                                  0.2,
                                              child: Column(
                                                children: [
                                                  Image.network(
                                                    "https://ecom.szamantech.com/storage/product/${snapTrackOrder.data!.orderDetail[ind].image}", // Replace with actual image URL
                                                    height: Appvars
                                                            .screenSize.height *
                                                        0.1,
                                                    //width: 60,
                                                  ),
                                                  Text(
                                                    snapTrackOrder
                                                            .data!
                                                            .orderDetail[ind]
                                                            .productName ??
                                                        "product",
                                                    maxLines: 1,
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${snapTrackOrder.data!.orderDetail[ind].price}Tk",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "(${snapTrackOrder.data!.orderDetail[ind].qty})",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                      );
                                    }),
                              ),
                              /* Row(
                                children: [
                                  Image.network(
                                    "https://ecom.szamantech.com/storage/product/product-108934.jpg", // Replace with actual image URL
                                    height: Appvars.screenSize.height * 0.1,
                                    //width: 60,
                                  ),
                                  /* SizedBox(width: 8),
                                  Image.network(
                                    'https://example.com/product2.jpg', // Replace with actual image URL
                                    height: 60,
                                    width: 60,
                                  ), */
                                ],
                              ), */
                              SizedBox(height: 16),
                              /*  GestureDetector(
                                onTap: () {
                                  // Navigate to order details page
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'VIEW ORDER DETAILS',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Icon(Icons.arrow_forward, color: Colors.blue),
                                  ],
                                ),
                              ),
                              Divider(height: 32), */
                              SizedBox(
                                height: 10,
                              ),
                              if (snapTrackOrder.data!.paymentMethod != 2 &&
                                  snapTrackOrder.data!.paymentStatus == 0)
                                ElevatedButton.icon(
                                  onPressed: () {
                                    List<CartModel> carts = [];

                                    for (int i = 0;
                                        i <
                                            snapTrackOrder
                                                .data!.orderDetail.length;
                                        i++) {
                                      carts.add(CartModel(
                                          id: snapTrackOrder
                                              .data!.orderDetail[i].orderId!,
                                          title: snapTrackOrder.data!
                                                  .orderDetail[i].productName ??
                                              "",
                                          price: double.parse(snapTrackOrder
                                                  .data!.orderDetail[i].price ??
                                              "0.0"),
                                          amount: int.parse(snapTrackOrder
                                                  .data!.orderDetail[i].qty ??
                                              "0"),
                                          total: double.parse(
                                              snapTrackOrder.data!.orderDetail[i].subtotal ?? "0.0"),
                                          imageLink: "https://ecom.szamantech.com/storage/product/${snapTrackOrder.data!.orderDetail[i].image ?? ""}"));
                                    }

                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (ctx) => CheckoutPage(
                                                  transID: snapTrackOrder
                                                      .data!.tnxId,
                                                  shippingCharge: double.parse(
                                                      snapTrackOrder.data!
                                                              .shippingCharge ??
                                                          "0.0"),
                                                  carts: carts,
                                                  totalCost: double.parse(
                                                          snapTrackOrder.data!
                                                                  .payableAmount ??
                                                              "0") -
                                                      double.parse(snapTrackOrder
                                                              .data!
                                                              .shippingCharge ??
                                                          "0"),
                                                  rootref: refTrackOrder,
                                                  isPlaceOrder: false,
                                                )));
                                  },
                                  icon: Icon(Icons.payment),
                                  label: Text("Pay Now!"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              Row(
                                children: [
                                  Text(
                                    "Payment Method:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      "${(snapTrackOrder.data!.paymentMethod) == 1 ? "Online" : "Cash On Delivery"}"),
                                  Spacer(),
                                  Text(
                                    "Total",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("${snapTrackOrder.data!.payableAmount}")
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.email, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'An email confirmation has been sent to:'),
                                      Text(
                                        "test@gmail.com",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      )
                                    ],
                                  ),
                                ],
                              ),

                              /* Divider(height: 32),
                              Row(
                                children: [
                                  Icon(Icons.card_giftcard, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text('Earn 18,800 Amber points with this purchase.'),
                                ],
                              ), */
                              Divider(height: 32),
                              Text('TRACK ORDER',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              SizedBox(height: 16),
                              StreamBuilder(
                                  stream: refTrackOrder
                                      .read(orderTrackProvider)
                                      .getOrderTrackStream(orderNum),
                                  builder: (context, snapshotStreamTrack) {
                                    var model = snapTrackOrder.data!;

                                    if (snapshotStreamTrack.hasData) {
                                      model = snapshotStreamTrack.data!;
                                    }
                                    return Column(
                                        children: List.generate(
                                            orderNames.length, (index) {
                                      var restrictedList = [6, 7, 8, 9];
                                      if (restrictedList
                                              .indexOf(model.orderStatus!) !=
                                          -1) {
                                        restrictedList.removeAt(restrictedList
                                            .indexOf(model.orderStatus!));
                                      }
                                      return trackList(model, index, orderNames,
                                          restrictedList);
                                    }));
                                  })

                              /*  Container(
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                       
                                      ],
                                    )
                                  ],
                                ),
                              ) */
                            ],
                          ),
                        ),
                        /* if (rootRef != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Appcolors.appThemeColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5))),
                                onPressed: () {
                                  rootRef!.read(rootPageProvider).setNavPageIndex(0);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (ctx) => RootPage()));
                                },
                                child: Text("Back To Shopping")),
                          ) */
                      ],
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }

  Widget trackList(OrderTrackModel snapTrackOrder, int index,
      Map<String, String> orderNames, List<int> restricted) {
    if (restricted.any((element) => (index == element))) {
      return SizedBox.shrink();
    }
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Column(
                      children: [
                        Icon(
                          (snapTrackOrder.orderStatus! >= index)
                              ? Icons.check_circle
                              : Icons.radio_button_checked,
                          color: (snapTrackOrder.orderStatus! >= index)
                              ? Colors.red
                              : Colors.blue,
                          size: 15,
                        ),
                        SizedBox(
                          height: Appvars.screenSize.height * 0.05,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(orderNames.keys.toList()[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: (snapTrackOrder.orderStatus! >= index)
                                      ? Appcolors.appThemeColor
                                      : Colors.blue)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        orderNames.values.toList()[index],
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
