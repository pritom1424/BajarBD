import 'package:bajarbd/model/models/shipping_address_model.dart';
import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/utils/Appvars/appvars.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:bajarbd/utils/db/user_credential.dart';
import 'package:bajarbd/widgets/checkout/ship_address_form.dart';
import 'package:bajarbd/widgets/settings/settings_address_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  bool didHidePassNew = true;
  bool didHidePassConfirm = true;
  TextEditingController newPassController = TextEditingController();
  TextEditingController newPassConfirmController = TextEditingController();
  @override
  void dispose() {
    newPassController.dispose();
    newPassConfirmController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ShippingAddressModel? sModel;
    return Scaffold(
      backgroundColor: Appcolors.offwhite,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
              Consumer(builder: (context, refConfirmPass, ch) {
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /* TextFormField(
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
                              labelStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
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
                          SizedBox(height: 10.0), */
                        TextFormField(
                          controller: newPassController,
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
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                            prefixIcon: Icon(Icons.lock, color: Colors.grey),
                            suffix: IconButton(
                                onPressed: () {
                                  didHidePassNew = !didHidePassNew;
                                  //refVisible.watch(authProvider).setRebuild();
                                  refConfirmPass
                                      .watch(settingsProvider)
                                      .setRebuild();
                                },
                                icon: Icon(
                                  (didHidePassNew)
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
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: newPassConfirmController,
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
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                            prefixIcon:
                                Icon(Icons.lock_outline, color: Colors.grey),
                            suffix: IconButton(
                                onPressed: () {
                                  didHidePassConfirm = !didHidePassConfirm;
                                  //refVisible.watch(authProvider).setRebuild();
                                  refConfirmPass
                                      .watch(settingsProvider)
                                      .setRebuild();
                                },
                                icon: Icon(
                                  (didHidePassConfirm)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                )),
                          ),
                          obscureText: didHidePassConfirm,
                          validator: (value) {
                            if (value != null &&
                                value != newPassController.text) {
                              return "Password did not match!";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolors.appThemeColor,
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState == null) {
                              return;
                            }
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              final prov =
                                  refConfirmPass.watch(settingsProvider);
                              prov.setLoading(true);

                              final result = await prov.updatePassword(
                                  newPassConfirmController.text);
                              prov.setLoading(false);
                              newPassConfirmController.clear();
                              newPassController.clear();
                              // Handle password change logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(result)),
                              );
                            }
                          },
                          child: Text(
                            'Save Changes',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer(
                            builder: (ctx, refPassload, child) =>
                                (refPassload.watch(settingsProvider).isLoading)
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Appcolors.appThemeColorDark,
                                        ),
                                      )
                                    : SizedBox.shrink())
                      ],
                    ),
                  ),
                );
              }),
              Consumer(builder: (ctx, refAddressRead, ch) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!refAddressRead.read(settingsProvider).isEdit)
                      FutureBuilder(
                          future: refAddressRead
                              .read(checkoutPageProvider)
                              .getShippingAddress(UserCredential.userId!),
                          builder: (ctx, snapGetAddreees) {
                            if (snapGetAddreees.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox.shrink();
                            }
                            if (!snapGetAddreees.hasData) {
                              refAddressRead
                                  .read(settingsProvider)
                                  .setEdit(true);

                              return ShippingAddressForm(
                                  refCheck: refAddressRead);
                            }

                            sModel = snapGetAddreees.data!;
                            return Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(child: SizedBox()),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Shipping Address",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                    color: Appcolors
                                                        .appThemeColorDark),
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                              onPressed: () {
                                                refAddressRead
                                                    .watch(settingsProvider)
                                                    .setEdit(true);
                                              },
                                              icon: Icon(Icons.edit)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${snapGetAddreees.data!.addressLineOne}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${snapGetAddreees.data!.postOffice},${snapGetAddreees.data!.thana}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      "${snapGetAddreees.data!.district}-${snapGetAddreees.data!.postalCode}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    if (refAddressRead.read(settingsProvider).isEdit)
                      SettingsAddressForm(
                        refCheck: refAddressRead,
                        houseFlat: sModel?.addressLineOne,
                        postOFFICE: sModel?.postOffice,
                        thanaName: sModel?.thana,
                        postalCodeName: sModel?.postalCode,
                        districtName: sModel?.district,
                      )
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
