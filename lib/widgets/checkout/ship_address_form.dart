import 'package:bajarbd/model/models/shipping_address_model.dart';
import 'package:bajarbd/provider/providers.dart';
import 'package:bajarbd/utils/Colors/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShippingAddressForm extends StatefulWidget {
  final WidgetRef refCheck;
  final String? houseFlat, postOFFICE, thanaName, postalCodeName, districtName;
  const ShippingAddressForm(
      {super.key,
      required this.refCheck,
      this.houseFlat,
      this.postOFFICE,
      this.thanaName,
      this.postalCodeName,
      this.districtName});

  @override
  State<ShippingAddressForm> createState() => _ShippingAddressFormState();
}

class _ShippingAddressFormState extends State<ShippingAddressForm> {
  final houseFlatRoadtController = TextEditingController();
  final postOfficeController = TextEditingController();
  final thanaController = TextEditingController();
  final postalCodeController = TextEditingController();
  final districtController = TextEditingController();
  final _formInfoKey = GlobalKey<FormState>();
  @override
  void initState() {
    houseFlatRoadtController.text = widget.houseFlat ?? "";
    postOfficeController.text = widget.postOFFICE ?? "";
    thanaController.text = widget.thanaName ?? "";
    postalCodeController.text = widget.postalCodeName ?? "";
    districtController.text = widget.districtName ?? "";
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    houseFlatRoadtController.dispose();
    postOfficeController.dispose();
    thanaController.dispose();
    postalCodeController.dispose();
    districtController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formInfoKey,
      child: Column(
        children: [
          Row(
            children: [
              const Text('Shipping Info', style: TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: houseFlatRoadtController,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            //autofocus: false,
            enabled: true,
            decoration: const InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              hintText: 'House/Flat/Road',
              labelText: 'House/Flat/Road',
              labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey,
                size: 20,
              ),
            ),
            validator: (value) {
              if (value != null && value == "") {
                return "Please enter a valid house/flat/road";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: postOfficeController,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            //autofocus: false,

            enabled: true,
            decoration: const InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              hintText: 'Post Office',
              labelText: 'Post Office',
              labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              prefixIcon: Icon(
                Icons.phone_android_rounded,
                color: Colors.grey,
                size: 20,
              ),
            ),
            validator: (value) {
              if (value != null && value == "") {
                return "Please enter a valid post office";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: thanaController,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            //autofocus: false,
            maxLines: 1,
            enabled: true,
            decoration: const InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              hintText: 'Thana',
              labelText: 'Thana',
              labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              prefixIcon: Icon(
                Icons.home,
                color: Colors.grey,
                size: 20,
              ),
            ),
            validator: (value) {
              if (value != null && value == "") {
                return "Please enter a valid thana";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: postalCodeController,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            //autofocus: false,
            maxLines: 1,
            keyboardType: TextInputType.number,
            enabled: true,
            decoration: const InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              hintText: 'Postal Code',
              labelText: 'Postal Code',
              labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              prefixIcon: Icon(
                Icons.home,
                color: Colors.grey,
                size: 20,
              ),
            ),
            validator: (value) {
              if (value != null && value == "") {
                return "Please enter a valid postal code";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: districtController,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            //autofocus: false,
            maxLines: 1,
            enabled: true,
            decoration: const InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3)),
              hintText: 'District',
              labelText: 'District',
              labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
              prefixIcon: Icon(
                Icons.home,
                color: Colors.grey,
                size: 20,
              ),
            ),
            validator: (value) {
              if (value != null && value == "") {
                return "Please enter a valid district";
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.refCheck.watch(checkoutPageProvider).setEdit(false);
                },
                child: Text("Cancel"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();

                  if (_formInfoKey.currentState == null) {
                    return;
                  }
                  if (_formInfoKey.currentState!.validate()) {
                    _formInfoKey.currentState!.save();
                    final model = ShippingAddressModel(
                        addressLineOne: houseFlatRoadtController.text,
                        postOffice: postOfficeController.text,
                        thana: thanaController.text,
                        postalCode: postalCodeController.text,
                        district: districtController.text);
                    final didSuccess = await widget.refCheck
                        .watch(checkoutPageProvider)
                        .postShippingAddress(model);

                    if (!didSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Address post failed!")));
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Address post succcess!")));
                      widget.refCheck
                          .watch(checkoutPageProvider)
                          .setEdit(false);
                    }
                  }
                },
                child: Text("Update"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors.appThemeColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
