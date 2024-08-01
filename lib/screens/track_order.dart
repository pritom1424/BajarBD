import 'package:bajarbd/utils/Appvars/app_constants.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Appcolors.appThemeSecondaryColor,
                height: Appvars.screenSize.height * 0.1,
                padding: EdgeInsets.all(20),
                child: Center(child: Image.asset(AppConstants.logoAltLink))),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Id:alkjdskljas",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text("Estimated delivary:"),
                            Container(
                              height: Appvars.screenSize.height * 0.03,
                              child: FittedBox(
                                child: Row(
                                  children: [Image.asset(AppConstants.appIcon)],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Text("status"),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.mark_email_read),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("An email confirmation has been sent to:"),
                        Text(
                          "test@gmail.com",
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Track Order:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Order Placed",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Icon(
                                      Icons.check_box_rounded,
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                                Container(
                                  width: Appvars.screenSize.width * 0.5,
                                  child: Text(
                                    "When you order is ready to be sent, our dispatch team will call to confirm the delivery details and provide an estimated time",
                                    maxLines: 3,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
