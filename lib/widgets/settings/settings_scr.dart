import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';
  bool didHidePass = true;
  bool didHidePassNew = true;
  bool didHidePassConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.offwhite,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Change Password",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Appcolors.appThemeColorDark),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
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
                        hintText: 'Current Password',
                        labelText: 'Current Password',
                        labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        prefixIcon: Icon(Icons.lock_open, color: Colors.grey),
                        suffix: IconButton(
                            onPressed: () {
                              didHidePass = !didHidePass;
                              //refVisible.watch(authProvider).setRebuild();
                              setState(() {});
                            },
                            icon: Icon(
                              (didHidePass)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            )),
                      ),
                      obscureText: didHidePass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your current password';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          currentPassword = value;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
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
                        hintText: 'New Password',
                        labelText: 'New Password',
                        labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        suffix: IconButton(
                            onPressed: () {
                              didHidePassNew = !didHidePassNew;
                              //refVisible.watch(authProvider).setRebuild();
                              setState(() {});
                            },
                            icon: Icon(
                              (didHidePass)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            )),
                      ),
                      obscureText: didHidePassNew,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a new password';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          currentPassword = value;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
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
                        hintText: 'Confirm New Password',
                        labelText: 'Confirm New Password',
                        labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Colors.grey),
                        suffix: IconButton(
                            onPressed: () {
                              didHidePassConfirm = !didHidePassConfirm;
                              //refVisible.watch(authProvider).setRebuild();
                              setState(() {});
                            },
                            icon: Icon(
                              (didHidePass)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            )),
                      ),
                      obscureText: didHidePassConfirm,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your new password';
                        } else if (value != newPassword) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          currentPassword = value;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.appThemeColor,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle password change logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Password changed successfully')),
                          );
                        }
                      },
                      child: Text(
                        'Save Changes',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
