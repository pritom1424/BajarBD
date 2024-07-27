// To parse this JSON data, do
//
//     final shippingChargeModel = shippingChargeModelFromJson(jsonString);

import 'dart:convert';

List<ShippingChargeModel> shippingChargeModelFromJson(String str) =>
    List<ShippingChargeModel>.from(
        json.decode(str).map((x) => ShippingChargeModel.fromJson(x)));

String shippingChargeModelToJson(List<ShippingChargeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShippingChargeModel {
  int id;
  String shippingChargeName;
  String amount;
  DateTime createdAt;
  DateTime updatedAt;

  ShippingChargeModel({
    required this.id,
    required this.shippingChargeName,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShippingChargeModel.fromJson(Map<String, dynamic> json) =>
      ShippingChargeModel(
        id: json["id"],
        shippingChargeName: json["shipping_charge_name"],
        amount: json["amount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shipping_charge_name": shippingChargeName,
        "amount": amount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
