import '../provider/providers.dart';
import 'login_page.dart';
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
  bool hidePass = true;
  bool confirmHidePass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Color actionButtonBgColor = const Color.fromARGB(255, 68, 156, 204);
  Color actionButtonFgColor = Colors.white;
  final _formInfoKey = GlobalKey<FormState>();

  bool emailEnabled = true;
  bool phoneEnabled = true;

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
                      final regex = RegExp(r'^[a-zA-Z]+$');
                      if (!regex.hasMatch(value!)) {
                        return "First name must contain only letters";
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
                      final regex = RegExp(r'^[a-zA-Z]+$');
                      if (!regex.hasMatch(value!)) {
                        return "Last name must contain only letters";
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
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final regex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (!regex.hasMatch(value)) {
                            return "Please enter a valid email address";
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
                          if (value != null) {
                            final regex = RegExp(r'^\+?[1-9]\d{1,14}$');
                            if (!regex.hasMatch(value)) {
                              return "Please enter a valid mobile number";
                              /* rejected numbers
                                +0123456789 (starts with 0 after the +)
                                0123456789 (starts with 0)
                              +12345678901234567 (more than 15 digits)
                              12345678901234567 (more than 15 digits)
                              + (only a + without digits)
                              +1 234 567 890 (contains spaces)
                              123-456-7890 (contains dashes)
                              123456789O (contains a letter 'O' instead of zero '0') */
                            }
                          }

                          return null;
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
                  Consumer(builder: (context, refPass, ch) {
                    return TextFormField(
                      controller: passController,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                      autofocus: false,
                      obscureText: hidePass,
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
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          prefixIcon:
                              Icon(Icons.lock_open_rounded, color: Colors.grey),
                          suffix: IconButton(
                              onPressed: () {
                                hidePass = !hidePass;
                                refPass.watch(authProvider).setRebuild();
                              },
                              icon: Icon(
                                (hidePass)
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ))),
                      validator: (value) {
                        if (value != null && value == "") {
                          return AppConstants.passErrorText;
                        }

                        return null;
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                  Consumer(builder: (context, refConfPass, ch) {
                    return TextFormField(
                      controller: confirmPasswordController,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                      autofocus: false,
                      obscureText: confirmHidePass,
                      obscuringCharacter: "*",
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
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffix: IconButton(
                              onPressed: () {
                                confirmHidePass = !confirmHidePass;
                                refConfPass.watch(authProvider).setRebuild();
                              },
                              icon: Icon(
                                (confirmHidePass)
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ))),
                      validator: (value) {
                        if (value != null && value != passController.text) {
                          return "Password did not match!";
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
                              confirmPasswordController.text);
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
                  SizedBox(
                    height: 10,
                  ),
                  Consumer(
                      builder: (ctx, refload, child) =>
                          (refload.read(authProvider).isLoading)
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
