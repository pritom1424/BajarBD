// To parse this JSON data, do
//
//     final codModel = codModelFromJson(jsonString);

import 'dart:convert';

OnlinePayModel onlinePayModelFromJson(String str) =>
    OnlinePayModel.fromJson(json.decode(str));

String onlinePayModelToJson(OnlinePayModel data) => json.encode(data.toJson());

class OnlinePayModel {
  int userId;
  double payableAmount;
  List<CartOnline> carts;
  String shipping_charge;

  OnlinePayModel(
      {required this.userId,
      required this.payableAmount,
      required this.carts,
      required this.shipping_charge});

  factory OnlinePayModel.fromJson(Map<String, dynamic> json) => OnlinePayModel(
      userId: json["user_id"],
      payableAmount: json["payable_amount"],
      carts: List<CartOnline>.from(
          json["carts"].map((x) => CartOnline.fromJson(x))),
      shipping_charge: json["shipping_charge"]);

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "payable_amount": payableAmount,
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "shipping_charge": shipping_charge
      };
}

class CartOnline {
  String name;
  int qty;
  double price;
  double subtotal;
  String image;

  CartOnline({
    required this.name,
    required this.qty,
    required this.price,
    required this.subtotal,
    required this.image,
  });

  factory CartOnline.fromJson(Map<String, dynamic> json) => CartOnline(
        name: json["name"],
        qty: json["qty"],
        price: json["price"],
        subtotal: json["subtotal"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "qty": qty,
        "price": price,
        "subtotal": subtotal,
        "image": image,
      };
}
