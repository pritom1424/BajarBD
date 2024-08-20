// To parse this JSON data, do
//
//     final catWiseModel = catWiseModelFromJson(jsonString);

import 'dart:convert';

CatWiseModel catWiseModelFromJson(String str) =>
    CatWiseModel.fromJson(json.decode(str));

String catWiseModelToJson(CatWiseModel data) => json.encode(data.toJson());

class CatWiseModel {
  int id;
  String? name;
  dynamic image;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product>? product;

  CatWiseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory CatWiseModel.fromJson(Map<String, dynamic> json) => CatWiseModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product == null
            ? []
            : List<dynamic>.from(product!.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  String? title;
  String? description;
  String? shortDescription;
  int? categoryId;
  dynamic subcategoryId;
  dynamic brandId;
  String? unitPrice;
  String? quantity;
  dynamic discount;
  dynamic discountPrice;
  String? featureImage;
  dynamic featureProduct;
  dynamic hotDeal;
  String? slug;
  int? isPublish;
  int? isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
