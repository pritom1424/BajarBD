import 'package:bajarbd/screens/settings_scr.dart';
import 'package:flutter/widgets.dart';

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

  double inbetweenHeight = 10;

  Widget trailing = Icon(
    Icons.arrow_right,
    size: 30,
  );
  double? listFontSize = 18;
  Color? listFontColor = Colors.black;
  Color? listTileColor = Colors.white;

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
        backgroundColor: Appcolors.offwhite,
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

                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                      SizedBox(
                        height: 20,
                      ),
                      /*  const SizedBox(height: 10.0),
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
                      ), */
                      ListTile(
                        tileColor: listTileColor,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const HistoryPage()));
                        },
                        leading: Icon(Icons.history),
                        title: Text(
                          'Order History',
                          style: TextStyle(
                              fontSize: listFontSize, color: listFontColor),
                          // style: TextStyle(fontSize: 18),
                        ),
                        trailing: trailing,
                      ),
                      SizedBox(height: inbetweenHeight),
                      ListTile(
                          tileColor: listTileColor,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => SettingsScreen()));
                          },
                          leading: Icon(Icons.settings),
                          title: Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: listFontSize, color: listFontColor),
                            //style: TextStyle(fontSize: 18),
                          ),
                          trailing: trailing),
                      SizedBox(height: inbetweenHeight),
                      ListTile(
                        tileColor: listTileColor,
                        onTap: () {
                          ref.watch(authProvider).logout();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginForm()));
                        },
                        leading: Icon(Icons.logout),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: listFontSize, color: listFontColor),
                        ),
                        trailing: trailing,
                      ),
                      /*  const SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const HistoryPage()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Order History',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => SettingsScreen()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.settings),
                            SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Settings',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          ref.watch(authProvider).logout();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginForm()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Logout',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ), */
                      /*  ElevatedButton(
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
                      ), */
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
