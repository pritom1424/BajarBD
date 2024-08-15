// To parse this JSON data, do
//
//     final ssLCredModel = ssLCredModelFromJson(jsonString);

import 'dart:convert';

SsLCredModel ssLCredModelFromJson(String str) =>
    SsLCredModel.fromJson(json.decode(str));

String ssLCredModelToJson(SsLCredModel data) => json.encode(data.toJson());

class SsLCredModel {
  int id;
  String storeId;
  String storePassword;
  int? isLive;
  DateTime createdAt;
  DateTime updatedAt;

  SsLCredModel({
    required this.id,
    required this.storeId,
    required this.storePassword,
    required this.isLive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SsLCredModel.fromJson(Map<String, dynamic> json) => SsLCredModel(
        id: json["id"],
        storeId: json["store_id"],
        storePassword: json["store_password"],
        isLive: json["is_live"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "store_password": storePassword,
        "is_live": isLive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
