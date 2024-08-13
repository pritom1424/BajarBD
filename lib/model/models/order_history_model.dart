// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

List<OrderHistoryModel> orderHistoryModelFromJson(String str) =>
    List<OrderHistoryModel>.from(
        json.decode(str).map((x) => OrderHistoryModel.fromJson(x)));

String orderHistoryModelToJson(List<OrderHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderHistoryModel {
  int id;
  int? userId;
  String? orderNumber;
  String? tnxId;
  String? payableAmount;
  String? shippingCharge;
  String? paymentMethod;
  DateTime paymentDate;
  DateTime orderDate;
  int? orderStatus;
  int? paymentStatus;
  DateTime createdAt;
  DateTime updatedAt;

  OrderHistoryModel({
    required this.id,
    required this.userId,
    required this.orderNumber,
    required this.tnxId,
    required this.payableAmount,
    required this.shippingCharge,
    required this.paymentMethod,
    required this.paymentDate,
    required this.orderDate,
    required this.orderStatus,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryModel(
        id: json["id"],
        userId: json["user_id"],
        orderNumber: json["order_number"],
        tnxId: json["tnx_id"],
        payableAmount: json["payable_amount"],
        shippingCharge: json["shipping_charge"],
        paymentMethod: json["payment_method"],
        paymentDate: DateTime.parse(json["payment_date"]),
        orderDate: DateTime.parse(json["order_date"]),
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_number": orderNumber,
        "tnx_id": tnxId,
        "payable_amount": payableAmount,
        "shipping_charge": shippingCharge,
        "payment_method": paymentMethod,
        "payment_date":
            "${paymentDate.year.toString().padLeft(4, '0')}-${paymentDate.month.toString().padLeft(2, '0')}-${paymentDate.day.toString().padLeft(2, '0')}",
        "order_date":
            "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
