// To parse this JSON data, do
//
//     final fetauredproduct = fetauredproductFromJson(jsonString);

import 'dart:convert';

List<Fetauredproduct> fetauredproductFromJson(String str) =>
    List<Fetauredproduct>.from(
        json.decode(str).map((x) => Fetauredproduct.fromJson(x)));

String fetauredproductToJson(List<Fetauredproduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fetauredproduct {
  int id;
  String title;
  String? description;
  String? shortDescription;
  int? categoryId;
  dynamic subcategoryId;
  int? brandId;
  String? unitPrice;
  String? quantity;
  dynamic discount;
  dynamic discountPrice;
  String? featureImage;
  int? featureProduct;
  dynamic hotDeal;
  String? slug;
  int? isPublish;
  int? isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Fetauredproduct({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.categoryId,
    required this.subcategoryId,
    required this.brandId,
    required this.unitPrice,
    required this.quantity,
    required this.discount,
    required this.discountPrice,
    required this.featureImage,
    required this.featureProduct,
    required this.hotDeal,
    required this.slug,
    required this.isPublish,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Fetauredproduct.fromJson(Map<String, dynamic> json) =>
      Fetauredproduct(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        shortDescription: json["short_description"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        brandId: json["brand_id"],
        unitPrice: json["unit_price"],
        quantity: json["quantity"],
        discount: json["discount"],
        discountPrice: json["discount_price"],
        featureImage: json["feature_image"],
        featureProduct: json["feature_product"],
        hotDeal: json["hot_deal"],
        slug: json["slug"],
        isPublish: json["is_publish"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "short_description": shortDescription,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "brand_id": brandId,
        "unit_price": unitPrice,
        "quantity": quantity,
        "discount": discount,
        "discount_price": discountPrice,
        "feature_image": featureImage,
        "feature_product": featureProduct,
        "hot_deal": hotDeal,
        "slug": slug,
        "is_publish": isPublish,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
