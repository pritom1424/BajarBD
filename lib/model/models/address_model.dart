// To parse this JSON data, do
//
//     final shippingAddressModel = shippingAddressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  int id;
  String? addressLineOne;
  String? postOffice;
  String? thana;
  String? postalCode;
  String? district;

  AddressModel({
    required this.id,
    required this.addressLineOne,
    required this.postOffice,
    required this.thana,
    required this.postalCode,
    required this.district,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['user_id'],
        addressLineOne: json["address_line_one"],
        postOffice: json["post_office"],
        thana: json["thana"],
        postalCode: json["postal_code"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": id,
        "address_line_one": addressLineOne,
        "post_office": postOffice,
        "thana": thana,
        "postal_code": postalCode,
        "district": district,
      };
}
