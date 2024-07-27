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
    itemList = [
      _buildTabButton('Bike'),
      _buildTabButton('Car'),
      _buildTabButton('Food', isSelected: true),
      _buildTabButton('Parcel'),
      _buildTabButton('Shop'),
    ];
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
      body: Column(
        children: [
          // Tabs
          Container(
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
          ),
          // Show Cancelled Orders
          Padding(
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
          ),
          // Order History
          Expanded(
            child: ListView(
              children: const [
                OrderTile(
                  date: 'TODAY, 03:31 PM',
                  institute: 'SZaman_Ecom',
                  address: '37, South Gulshan, Circle-1',
                  items: 'Denim Jeans(1), T-Shirt (2)',
                  price: 590,
                  logo: 'assets/chillox.png',
                  rating: 4.5,
                  orderState: "Delivered",
                ),
                OrderTile(
                  date: 'YESTERDAY, 04:19 PM',
                  institute: 'SZaman_Ecom',
                  address: 'Ahmed Tower, 37, South Gulshan, Circle-1',
                  items: 'Salwar Kamiz (1), Hair Dryer (1)',
                  price: 375,
                  logo: 'assets/north_end.png',
                  rating: 4.0,
                  orderState: 'Canceled',
                ),
                OrderTile(
                  date: '07 NOV 2019, 02:20 PM',
                  institute: 'SZaman_Ecom',
                  address: 'Road 50, Gulshan 2',
                  items: 'Shirt (1), Pant(1)',
                  price: 567,
                  logo: 'assets/star_kabab.png',
                  rating: 3.5,
                  orderState: 'On the way',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, {bool isSelected = false}) {
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
  }
}
