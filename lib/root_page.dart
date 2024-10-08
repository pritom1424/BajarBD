import 'package:bajarbd/model/data/services/chat_service.dart';
import 'package:crisp_chat/crisp_chat.dart';

import 'utils/Appvars/app_constants.dart';

import 'provider/providers.dart';

import 'utils/Appvars/appvars.dart';
import 'utils/Components/appcomponent.dart';
import 'utils/app_methods.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/navbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Appvars.screenSize = MediaQuery.of(context).size;

    /*  void onNavButtonTap(int ind) {
      ref.watch(rootPageProvider).setNavPageIndex(ind);
    } */

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Container(
                height: kToolbarHeight * 1.2,
                width: double.infinity,
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(AppConstants.logoAltLink)

                /* Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(AppConstants.appIcon),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "bajarBD",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ) */
                ),
            /* leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ), // Replace with your custom icon
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ), */
            actions: [
              /*  PopupMenuButton(
                  iconColor: Colors.white,
                  /*  onSelected: (filterOptions selectedVal) {
                  setState(() {
                    if (selectedVal == filterOptions.Favorites) {
                      _showfavorites = true;
                    } else {
                      _showfavorites = false;
                    }
                  });
                }, */
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (_) => [
                        const PopupMenuItem(
                          child: Text("Show Favorites"),
                          //   value: filterOptions.Favorites,
                        ),
                        const PopupMenuItem(
                          child: Text("Show All"),
                          //   value: filterOptions.All,
                        ),
                      ]), */
              const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  CupertinoIcons.bell_fill,
                  color: Colors.white,
                ),
              )
            ],
          ),
          bottomNavigationBar: NavBarWidget(
            currentIndex: ref.read(rootPageProvider).navPageIndex,
            onTap: (ind) {
              AppMethods().onNavButtonTap(ind, ref);
            },
          ),
          drawer: CustomDrawer(
            ref: ref,
          ),
          floatingActionButton: (ref.read(rootPageProvider).navPageIndex) == 0
              ? FloatingActionButton(
                  onPressed: () async {
                    final conf = ChatService().Init(AppConstants.crispID);
                    await FlutterCrispChat.openCrispChat(config: conf);
                    //CrispChatSdk().openChat();
                    // Crisp.startChat();
                  },
                  child: Icon(Icons.message),
                )
              : null,
          body: FutureBuilder(
              future: ref.read(authProvider).tryAutoLogin(),
              builder: (context, snapLoginCheck) {
                return AppComponent()
                    .navViews(ref)[ref.read(rootPageProvider).navPageIndex];
              }) //navViews()[ref.read(rootPageProvider).navPageIndex],
          ),
    );
  }
}
