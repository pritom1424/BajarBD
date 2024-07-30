// To parse this JSON data, do
//
//     final shippingAddressModel = shippingAddressModelFromJson(jsonString);

import 'dart:convert';

ShippingAddressModel shippingAddressModelFromJson(String str) =>
    ShippingAddressModel.fromJson(json.decode(str));

String shippingAddressModelToJson(ShippingAddressModel data) =>
    json.encode(data.toJson());

class ShippingAddressModel {
  String? addressLineOne;
  String? postOffice;
  String? thana;
  String? postalCode;
  String? district;

  ShippingAddressModel({
    required this.addressLineOne,
    required this.postOffice,
    required this.thana,
    required this.postalCode,
    required this.district,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      ShippingAddressModel(
        addressLineOne: json["address_line_one"],
        postOffice: json["post_office"],
        thana: json["thana"],
        postalCode: json["postal_code"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "address_line_one": addressLineOne,
        "post_office": postOffice,
        "thana": thana,
        "postal_code": postalCode,
        "district": district,
      };
}
