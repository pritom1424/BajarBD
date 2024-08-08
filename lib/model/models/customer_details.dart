// To parse this JSON data, do
//
//     final customerDetails = customerDetailsFromJson(jsonString);

import 'dart:convert';

CustomerDetails customerDetailsFromJson(String str) =>
    CustomerDetails.fromJson(json.decode(str));

String customerDetailsToJson(CustomerDetails data) =>
    json.encode(data.toJson());

class CustomerDetails {
  int id;
  String firstName;
  String lastName;
  String? phone;
  String email;
  dynamic emailVerifiedAt;
  String? addressLineOne;
  String? postOffice;
  String? thana;
  String? postalCode;
  String? district;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  CustomerDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.emailVerifiedAt,
    required this.addressLineOne,
    required this.postOffice,
    required this.thana,
    required this.postalCode,
    required this.district,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      CustomerDetails(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        addressLineOne: json["address_line_one"],
        postOffice: json["post_office"],
        thana: json["thana"],
        postalCode: json["postal_code"],
        district: json["district"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "address_line_one": addressLineOne,
        "post_office": postOffice,
        "thana": thana,
        "postal_code": postalCode,
        "district": district,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
