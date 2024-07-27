import '../screens/brand_screen.dart';
import '../screens/category_screen.dart';
import '../screens/order_history.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            title: Center(
              child: Text("E COMMERCE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      color: Colors.white)),
            ),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.payment),
              title: Text(
                "Order History",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const HistoryPage()))
              //  Navigator.of(context).pushReplacementNamed(OrderScreen.routeName),
              // Navigator.of(context).pushReplacement(CustomeRoute(
              //   builder: (context) => OrderScreen(),
              // ))
              ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.category),
            title: Text(
              "Categories",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const CategoryScreen())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.branding_watermark),
            title: Text(
              "Brands",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const BrandScreen())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(
              "Logout",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () {
              //Navigator.of(context).pop();
              /*  Navigator.of(context).pushReplacementNamed("/");
            Provider.of<Auth>(context, listen: false).logout(); */
            },
          ),
        ],
      ),
    );
  }
}
