import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/root_page.dart';
import 'package:bajarbd/utils/Appvars/app_constants.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackOrder extends StatelessWidget {
  final WidgetRef? rootRef;

  const TrackOrder({super.key, required this.rootRef});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: (rootRef != null)
            ? null
            : AppBar(
                automaticallyImplyLeading: true,
                title: Text("Track Order"),
              ),
        /*   appBar: AppBar(
          title: Text('Order Confirmation'),
        ), */
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Appcolors.appThemeColor,
                  child: Image.asset(
                    AppConstants.logoAltLink, // Replace with actual image URL
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
                      Text(
                        'Order ID: POU03161209',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Estimated delivery today by 15:30.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text('IN PROGRESS'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
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
                      ),
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
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.grey),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('An email confirmation has been sent to:'),
                              Text(
                                "test@gmail.com",
                                style: Theme.of(context).textTheme.labelMedium,
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
                          style: Theme.of(context).textTheme.titleMedium),
                      SizedBox(height: 16),
                      Row(
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
                                            Icons.check_circle,
                                            color: Colors.red,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            height: Appvars.screenSize.height *
                                                0.05,
                                            child: VerticalDivider(
                                              color: Colors.green,
                                              thickness: 1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              /* Icon(
                                                Icons.shopping_cart,
                                                size: 15,
                                                color: Appcolors.appThemeColor,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ), */
                                              Text('Order placed',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Appcolors
                                                          .appThemeColor)),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'We have received your order!',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.red,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            height: Appvars.screenSize.height *
                                                0.05,
                                            child: VerticalDivider(
                                              color: Colors.green,
                                              thickness: 1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              /* Icon(
                                                Icons.check_circle,
                                                size: 15,
                                                color: Appcolors.appThemeColor,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ), */
                                              Text('Order Confirmed!',
                                                  style: TextStyle(
                                                      color: Appcolors
                                                          .appThemeColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Order has been confirmed successfully',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.blue,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            height: Appvars.screenSize.height *
                                                0.05,
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              /* Icon(
                                                Icons.local_shipping,
                                                color: Appcolors.appThemeColor,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ), */
                                              Text('Order in Transit',
                                                  style: TextStyle(
                                                      color: Appcolors
                                                          .appThemeColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Order has been loaded for shipping',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.blue,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            height: Appvars.screenSize.height *
                                                0.05,
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              /*  Icon(
                                                Icons.thumb_up,
                                                color: Appcolors.appThemeColor,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ), */
                                              Text('Delivered Successfully',
                                                  style: TextStyle(
                                                      color: Appcolors
                                                          .appThemeColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Order has been delivered successfully',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )

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
                if (rootRef != null)
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
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
