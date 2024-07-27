import '../provider/providers.dart';
import 'login_page.dart';
import 'order_history.dart';
import '../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*  appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ), */
        body: (!ref.watch(profilePageProvider).isLogin)
            ? const LoginForm()
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20.0),
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'John Doe',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'john.doe@example.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const HistoryPage()));
                      },
                      child: const Text('Order History'),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Settings'),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(profilePageProvider).setLogin(false);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.appThemeColor,
                          foregroundColor: Colors.white),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
