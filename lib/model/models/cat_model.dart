// To parse this JSON data, do
//
//     final catModel = catModelFromJson(jsonString);

import 'dart:convert';

List<CatModel> catModelFromJson(String str) =>
    List<CatModel>.from(json.decode(str).map((x) => CatModel.fromJson(x)));

String catModelToJson(List<CatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatModel {
  String name;
  String? image;

  CatModel({
    required this.name,
    required this.image,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
