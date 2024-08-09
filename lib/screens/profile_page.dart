import '../utils/Appvars/app_constants.dart';
import '../utils/Appvars/appvars.dart';
import '../utils/db/user_credential.dart';
import '../widgets/loader_widget.dart';

import '../provider/providers.dart';
import 'login_page.dart';
import 'order_history.dart';
import '../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController addressControl = TextEditingController();
  bool? isEdit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    isEdit = null;
    addressControl.dispose();

    print("isDispose");
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*  appBar: AppBar(
            title: Text('Profile'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ), */
        body: Consumer(
          builder: (ctx, ref, _) => FutureBuilder(
              future: ref.read(authProvider).tryAutoLogin(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      height: Appvars.screenSize.height * 0.6,
                      child: const Center(child: LoaderWidget()));
                }
                if (!snap.hasData) {
                  return LoginForm();
                }
                if (snap.data == false || UserCredential.status != 1) {
                  return LoginForm();
                }

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20.0),
                      /* const CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage(AppConstants.appIcon),
                        ), */
                      Image.asset(
                        AppConstants.appIcon,
                        height: Appvars.screenSize.height * 0.1,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        UserCredential.emailOrPhone ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Consumer(
                        builder: (ctx, refEdit, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (isEdit ?? false)
                                  ? Expanded(
                                      child: TextField(
                                        controller: addressControl,
                                        autofocus: true,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal),
                                        decoration: InputDecoration(
                                            hintText: "Enter address"),
                                      ),
                                    )
                                  : Text(
                                      (UserCredential.address == null ||
                                              UserCredential.address!.isEmpty)
                                          ? "add address"
                                          : UserCredential.address!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                              (isEdit ?? false)
                                  ? IconButton(
                                      onPressed: () {
                                        //fornow
                                        UserCredential.address =
                                            addressControl.text;
                                        isEdit = false;
                                        refEdit
                                            .watch(profilePageProvider)
                                            .setEditMode(isEdit!);
                                      },
                                      icon: Icon(Icons.save))
                                  : IconButton(
                                      onPressed: () {
                                        addressControl.text =
                                            UserCredential.address ?? "";
                                        isEdit = true;
                                        refEdit
                                            .watch(profilePageProvider)
                                            .setEditMode(isEdit!);
                                      },
                                      icon: Icon(Icons.edit))
                            ],
                          );
                        },
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
                          ref.watch(authProvider).logout();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginForm()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.appThemeColor,
                            foregroundColor: Colors.white),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
