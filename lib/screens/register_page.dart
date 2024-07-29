import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Color actionButtonBgColor = const Color.fromARGB(255, 68, 156, 204);
  Color actionButtonFgColor = Colors.white;
  final _formInfoKey = GlobalKey<FormState>();

  bool emailEnabled = true;
  bool phoneEnabled = true;
  String contactMethod = 'email';
  void _handleRadioValueChange(String? value) {
    setState(() {
      contactMethod = value!;
      if (contactMethod == 'email') {
        phoneController.clear();
      } else {
        emailController.clear();
      }
    });
  }

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
            //   height: Appvars.screenSize.height * 0.8,
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
                        AppConstants.appIcon,
                        width:
                            Appvars.screenSize.width * 0.8, // Adjust as needed
                        height: Appvars.screenSize.height * 0.08,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Create your account!",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    //focusNode: emailFocusNode,
                    controller: firstNameController,
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
                      hintText: 'First Name',
                      labelText: 'First Name',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      prefixIcon: Icon(Icons.person, color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value != null && value == "") {
                        return "Please enter a valid first name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    //focusNode: emailFocusNode,
                    controller: lastNameController,
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
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      prefixIcon: Icon(Icons.person, color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value != null && value == "") {
                        return "Please enter a valid last name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      /* Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                                title: const Text('Email'),
                                value: 'email',
                                groupValue: contactMethod,
                                onChanged: _handleRadioValueChange),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                                title: const Text('Phone'),
                                value: 'phone',
                                groupValue: contactMethod,
                                onChanged: _handleRadioValueChange),
                          ),
                        ],
                      ), */
                      /*  if (contactMethod == 'email') */ const SizedBox(
                          height: 20),
                      //  if (contactMethod == 'email')
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        enabled: true /* contactMethod == 'email' */,
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
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          prefixIcon:
                              Icon(Icons.email_outlined, color: Colors.grey),
                        ),
                        validator: (value) {
                          if (contactMethod == 'email' &&
                              (value == null || value.isEmpty)) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      /* if (contactMethod == 'phone') */ const SizedBox(
                          height: 20),
                      // if (contactMethod == 'phone')
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        enabled: true /* contactMethod == 'phone' */,
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
                          hintText: 'Mobile number',
                          labelText: 'Mobile Number',
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          prefixIcon:
                              Icon(Icons.phone_android, color: Colors.grey),
                        ),
                        validator: (value) {
                          /* if (contactMethod == 'phone' &&
                              (value == null || value.isEmpty)) {
                            return 'Please enter your phone number';
                          }
                          return null; */
                        },
                      ),
                    ],
                  ),
                  /*  TextFormField(
                    //focusNode: emailFocusNode,
                    controller: emailController,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    //autofocus: false,
                    enabled: emailEnabled,
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
                    onChanged: (value) {
                      setState(() {
                        phoneEnabled = value.isEmpty;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    enabled: phoneEnabled,
                    controller: phoneController,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    autofocus: false,
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
                      hintText: 'Mobile number',
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      prefixIcon:
                          Icon(Icons.lock_open_rounded, color: Colors.grey),
                    ),
                    onChanged: (value) {
                      setState(() {
                        emailEnabled = value.isEmpty;
                      });
                    },
                  ), */
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
                        return AppConstants.passErrorText;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    autofocus: false,
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
                      hintText: 'Address',
                      labelText: 'Address',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      prefixIcon: Icon(Icons.location_on, color: Colors.grey),
                    ),
                  ),
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
                        if (emailController.text.isEmpty &&
                            phoneController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text(AppConstants.emailORPhoneErrorText)));
                        }
                        if (_formInfoKey.currentState!.validate()) {
                          _formInfoKey.currentState!.save();
                          final prov = ref.watch(authProvider);
                          prov.setLoading(true);
                          final result = await prov.SignUp(
                              firstNameController.text,
                              lastNameController.text,
                              phoneController.text,
                              emailController.text,
                              passController.text,
                              addressController.text);
                          prov.setLoading(false);
                          if (result == -1) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(AppConstants.signupErrorText)));
                          } else if (result != 1) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("This account is blocked!")));
                          } else {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => const ProfilePage()));
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
                        'Create Account',
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
                          builder: (ctx) => const LoginForm()));
                    },
                    child: const Text(
                      'Go back to login',
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
