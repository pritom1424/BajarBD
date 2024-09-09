import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/widgets/loader_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/Appvars/appvars.dart';
import '../widgets/order/order_tile.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool showCancelledOrders = false;
  List<Widget> itemList = [];
  @override
  void initState() {
    /*  itemList = [
      _buildTabButton('Bike'),
      _buildTabButton('Car'),
      _buildTabButton('Food', isSelected: true),
      _buildTabButton('Parcel'),
      _buildTabButton('Shop'),
    ]; */
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        centerTitle: true,
      ),
      body: Consumer(builder: (context, refOrderHistory, ch) {
        return SingleChildScrollView(
          child: Column(
            children: [
              // Tabs
              /*  Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: Appvars.screenSize.height * 0.1,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: itemList.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (ctx, ind) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: itemList[ind]),
                ),
              ), */
              // Show Cancelled Orders
              /* Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Show Cancelled Orders'),
                    Switch(
                      value: showCancelledOrders,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          showCancelledOrders = value;
                        });
                      },
                    ),
                  ],
                ),
              ), */
              // Order History
              FutureBuilder(
                  future: refOrderHistory
                      .read(orderHistoryProvider)
                      .getOrderHistory(),
                  builder: (context, snapOrderHistory) {
                    if (snapOrderHistory.connectionState ==
                        ConnectionState.waiting) {
                      return SizedBox(
                        height: Appvars.screenSize.height * 0.8,
                        child: Center(
                          child: LoaderWidget(),
                        ),
                      );
                    }
                    if (!snapOrderHistory.hasData) {
                      return SizedBox(
                        height: Appvars.screenSize.height * 0.8,
                        child: Center(
                          child: Text("no order history!"),
                        ),
                      );
                    }
                    return Column(
                        children: List.generate(
                            snapOrderHistory.data!.length,
                            (index) => OrderTile(
                                orderHistoryModel:
                                    snapOrderHistory.data![index])));
                  }),
            ],
          ),
        );
      }),
    );
  }

/*   Widget _buildTabButton(String label, {bool isSelected = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.red : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        // Handle tab selection
      },
      child: Text(label),
    );
  } */
}
