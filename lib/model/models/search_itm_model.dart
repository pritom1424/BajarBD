// To parse this JSON data, do
//
//     final searchItemModel = searchItemModelFromJson(jsonString);

import 'dart:convert';

List<SearchItemModel> searchItemModelFromJson(String str) =>
    List<SearchItemModel>.from(
        json.decode(str).map((x) => SearchItemModel.fromJson(x)));

String searchItemModelToJson(List<SearchItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchItemModel {
  int id;
  String? title;
  String? unitPrice;
  dynamic discountPrice;
  String? featureImage;

  SearchItemModel({
    required this.id,
    required this.title,
    required this.unitPrice,
    required this.discountPrice,
    required this.featureImage,
  });

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      SearchItemModel(
        id: json["id"],
        title: json["title"],
        unitPrice: json["unit_price"],
        discountPrice: json["discount_price"],
        featureImage: json["feature_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "unit_price": unitPrice,
        "discount_price": discountPrice,
        "feature_image": featureImage,
      };
}
