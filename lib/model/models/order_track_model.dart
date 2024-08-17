// To parse this JSON data, do
//
//     final orderTrackModel = orderTrackModelFromJson(jsonString);

import 'dart:convert';

OrderTrackModel orderTrackModelFromJson(String str) =>
    OrderTrackModel.fromJson(json.decode(str));

String orderTrackModelToJson(OrderTrackModel data) =>
    json.encode(data.toJson());

class OrderTrackModel {
  int id;
  int? userId;
  String? orderNumber;
  String? tnxId;
  String? payableAmount;
  String? shippingCharge;
  int? paymentMethod;
  DateTime? paymentDate;
  DateTime? orderDate;
  int? orderStatus;
  int? paymentStatus;
  DateTime createdAt;
  DateTime updatedAt;
  List<OrderDetail> orderDetail;
  ShippingAddress shippingAddress;

  OrderTrackModel({
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
    required this.orderDetail,
    required this.shippingAddress,
  });

  factory OrderTrackModel.fromJson(Map<String, dynamic> json) =>
      OrderTrackModel(
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
        orderDetail: List<OrderDetail>.from(
            json["order_detail"].map((x) => OrderDetail.fromJson(x))),
        shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
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
            "${paymentDate?.year.toString().padLeft(4, '0')}-${paymentDate?.month.toString().padLeft(2, '0')}-${paymentDate?.day.toString().padLeft(2, '0')}",
        "order_date":
            "${orderDate?.year.toString().padLeft(4, '0')}-${orderDate?.month.toString().padLeft(2, '0')}-${orderDate?.day.toString().padLeft(2, '0')}",
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "order_detail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
        "shipping_address": shippingAddress.toJson(),
      };
}

class OrderDetail {
  int id;
  int? orderId;
  String? productName;
  String? qty;
  dynamic variation;
  String? price;
  String? subtotal;
  String? image;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.productName,
    required this.qty,
    required this.variation,
    required this.price,
    required this.subtotal,
    required this.image,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        productName: json["product_name"],
        qty: json["qty"],
        variation: json["variation"],
        price: json["price"],
        subtotal: json["subtotal"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_name": productName,
        "qty": qty,
        "variation": variation,
        "price": price,
        "subtotal": subtotal,
        "image": image,
      };
}

class ShippingAddress {
  int id;
  int? orderId;
  int? userId;
  String? addressLineOne;
  String? postOffice;
  String? thana;
  String? postalCode;
  String? district;

  ShippingAddress({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.addressLineOne,
    required this.postOffice,
    required this.thana,
    required this.postalCode,
    required this.district,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        addressLineOne: json["address_line_one"],
        postOffice: json["post_office"],
        thana: json["thana"],
        postalCode: json["postal_code"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "user_id": userId,
        "address_line_one": addressLineOne,
        "post_office": postOffice,
        "thana": thana,
        "postal_code": postalCode,
        "district": district,
      };
}
