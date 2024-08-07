import 'package:bajarbd/screens/profile_page.dart';

import '../provider/providers.dart';
import 'register_page.dart';
import '../utils/Appvars/app_constants.dart';
import '../utils/Appvars/appvars.dart';
import '../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends StatefulWidget {
  final String? title;
  final bool? isLogOut;
  const LoginForm({super.key, this.title, this.isLogOut});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  Color actionButtonBgColor = const Color.fromARGB(255, 68, 156, 204);
  Color actionButtonFgColor = Colors.white;
  final _formInfoKey = GlobalKey<FormState>();
  bool didHidePass = true;

  @override
  void initState() {
    if (widget.isLogOut != null) {
      if (widget.isLogOut == true) {
        // Provider.of<HrmsAuthController>(context, listen: false).logout();
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.title == null)
          ? null
          : AppBar(
              title: Text(widget.title!),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
            height: Appvars.screenSize.height * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Form(
              key: _formInfoKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    //  color: Appcolors.appThemeColor,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppConstants.appIcon,
                        width:
                            Appvars.screenSize.width * 0.8, // Adjust as needed
                        height: Appvars.screenSize.height * 0.08,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome to login page!",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    //focusNode: emailFocusNode,
                    controller: emailController,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    //autofocus: false,
                    enabled: true,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      hintText: 'Email or Phone number',
                      labelText: 'Email or Phone number',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value != null && value == "") {
                        return AppConstants.emailORPhoneErrorText;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Consumer(builder: (context, refVisible, ch) {
                    return TextFormField(
                      controller: passController,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                      autofocus: false,
                      obscureText: didHidePass,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: Appvars.screenSize.height * 0.07),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.3)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.3)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.3)),
                        hintText: 'Password',
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        prefixIcon:
                            Icon(Icons.lock_open_rounded, color: Colors.grey),
                        suffix: IconButton(
                            onPressed: () {
                              didHidePass = !didHidePass;
                              refVisible.watch(authProvider).setRebuild();
                            },
                            icon: Icon(
                              (didHidePass)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            )),
                      ),
                      validator: (value) {
                        if (value != null && value == "") {
                          return AppConstants.passErrorText;
                        }
                        return null;
                      },
                    );
                  }),
                  const SizedBox(height: 50),
                  Consumer(
                    builder: (ctx, ref, _) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          backgroundColor: Appcolors.appThemeColor,
                          foregroundColor: actionButtonFgColor),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        if (_formInfoKey.currentState == null) {
                          return;
                        }
                        if (_formInfoKey.currentState!.validate()) {
                          _formInfoKey.currentState!.save();
                          final prov = ref.watch(authProvider);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          prov.setLoading(true);
                          final result = await prov.Login(
                              emailController.text, passController.text);

                          if (result == -1) {
                            prov.setLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(AppConstants.loginErrorText)));
                          } else if (result != 1) {
                            prov.setLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("This account is blocked!")));
                          } else {
                            prov.setLoading(false);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const ProfilePage()));
                          }

                          /* if (result) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => RootNavPage()));
                          } else {
                            AppMethods().snackBar(
                                AppStrings.loginErrorMessage, context);
                          } */
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        backgroundColor: Appcolors.appThemeSecondaryColor,
                        foregroundColor: actionButtonFgColor),
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => const RegisterForm()));
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer(
                      builder: (ctx, refload, child) =>
                          (refload.watch(authProvider).isLoading)
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Appcolors.appThemeColorDark,
                                  ),
                                )
                              : SizedBox.shrink())

                  /* const SizedBox(
                    height: 20,
                  ),
                  Consumer<HrmsAuthController>(builder: (ctx, snap, ch) {
                    if (snap.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.contentColorPurple,
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }) */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
