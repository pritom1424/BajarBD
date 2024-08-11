// To parse this JSON data, do
//
//     final codModel = codModelFromJson(jsonString);

import 'dart:convert';

CodModel codModelFromJson(String str) => CodModel.fromJson(json.decode(str));

String codModelToJson(CodModel data) => json.encode(data.toJson());

class CodModel {
  int userId;
  String? paymentMethod;
  double payableAmount;
  List<Cart> carts;
  String shipping_charge;

  CodModel({
    required this.userId,
    required this.paymentMethod,
    required this.payableAmount,
    required this.carts,
    required this.shipping_charge,
  });

  factory CodModel.fromJson(Map<String, dynamic> json) => CodModel(
        userId: json["user_id"],
        paymentMethod: json["payment_method"],
        payableAmount: json["payable_amount"],
        carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
        shipping_charge: json["shipping_charge"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "payment_method": paymentMethod,
        "payable_amount": payableAmount,
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "shipping_charge": shipping_charge,
        //'tnx_id': '123'
      };
}

class Cart {
  String name;
  int qty;
  double price;
  double subtotal;
  String image;

  Cart({
    required this.name,
    required this.qty,
    required this.price,
    required this.subtotal,
    required this.image,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
