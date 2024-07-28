// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerResponseModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterModel data) =>
    json.encode(data.toJson());

class RegisterModel {
  int userId;
  String email;
  int status;
  String accessToken;
  String tokenType;
  int expiresIn;

  RegisterModel({
    required this.userId,
    required this.email,
    required this.status,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        userId: json["user_id"],
        email: json["email"],
        status: json["status"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "status": status,
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
