// To parse this JSON data, do
//
//     final catModel = catModelFromJson(jsonString);

import 'dart:convert';

List<BrandModel> brandModelFromJson(String str) =>
    List<BrandModel>.from(json.decode(str).map((x) => BrandModel.fromJson(x)));

String brandModelToJson(List<BrandModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandModel {
  String name;
  String? image;

  BrandModel({
    required this.name,
    required this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
