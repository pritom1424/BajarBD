import 'profile_page.dart';
import '../utils/Appvars/app_constants.dart';
import '../utils/Appvars/appvars.dart';
import '../utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final String? title;
  final bool? isLogOut;
  const RegisterForm({super.key, this.title, this.isLogOut});

  @override
  State<RegisterForm> createState() => _RegisterForm();
}

class _RegisterForm extends State<RegisterForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  Color actionButtonBgColor = const Color.fromARGB(255, 68, 156, 204);
  Color actionButtonFgColor = Colors.white;
  final _formInfoKey = GlobalKey<FormState>();

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
          child: Container(
            height: Appvars.screenSize.height * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Form(
              key: _formInfoKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    // color: Appcolors.appThemeColor,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppConstants.logoLink,
                        width:
                            Appvars.screenSize.width * 0.8, // Adjust as needed
                        height: Appvars.screenSize.height * 0.08,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    //focusNode: emailFocusNode,
                    //  controller: emailController,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    //autofocus: false,
                    enabled: true,
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      hintText: 'Name',
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value != null && value == "") {
                        //return AppStrings.emailErrorText;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    //focusNode: emailFocusNode,
                    controller: emailController,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    //autofocus: false,
                    enabled: true,
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.3)),
                      hintText: 'Email',
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value != null && value == "") {
                        //return AppStrings.emailErrorText;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passController,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    autofocus: false,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: const InputDecoration(
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
                    ),
                    validator: (value) {
                      if (value != null && value == "") {
                        //return AppStrings.passErrorText;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        backgroundColor: Appcolors.appThemeColor,
                        foregroundColor: actionButtonFgColor),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => const ProfilePage()));
                      /*  if (_formInfoKey.currentState == null) {
                        return;
                      }
                      if (_formInfoKey.currentState!.validate()) {
                        _formInfoKey.currentState!.save(); */
                      /* final prov = Provider.of<HrmsAuthController>(context,
                            listen: false);
                        prov.setLoading(true);
                        final result = await prov.Authenticate(
                            emailController.text, passController.text);
        
                        prov.setLoading(false);
        
                        if (result) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => RootNavPage()));
                        } else {
                          AppMethods().snackBar(
                              AppStrings.loginErrorMessage, context);
                        } */
                      // }
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
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
