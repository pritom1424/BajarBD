// To parse this JSON data, do
//
//     final homeLatestProduct = homeLatestProductFromJson(jsonString);

import 'dart:convert';

List<CatWiseModel> catWiseModelFromJson(String str) => List<CatWiseModel>.from(
    json.decode(str).map((x) => CatWiseModel.fromJson(x)));

String catWiseModelToJson(List<CatWiseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatWiseModel {
  int id;
  String? title;
  String? description;
  String? shortDescription;
  int? categoryId;
  dynamic subcategoryId;
  int? brandId;
  String? unitPrice;
  String? quantity;
  String? discount;
  String? discountPrice;
  String? featureImage;
  dynamic featureProduct;
  dynamic hotDeal;
  String? slug;
  int? isPublish;
  int? isActive;
  DateTime createdAt;
  DateTime updatedAt;
  Brand? category;
  dynamic subCategory;
  Brand? brand;
  List<Gallery>? gallery;
  List<dynamic>? variation;

  CatWiseModel({
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
    required this.category,
    required this.subCategory,
    required this.brand,
    required this.gallery,
    required this.variation,
  });

  factory CatWiseModel.fromJson(Map<String, dynamic> json) => CatWiseModel(
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
        category:
            json["category"] == null ? null : Brand.fromJson(json["category"]),
        subCategory: json["sub_category"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        variation: List<dynamic>.from(json["variation"].map((x) => x)),
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
        "category": category?.toJson(),
        "sub_category": subCategory,
        "brand": brand?.toJson(),
        "gallery": List<dynamic>.from(gallery?.map((x) => x.toJson()) ?? []),
        "variation": List<dynamic>.from(variation?.map((x) => x) ?? []),
      };
}

class Brand {
  String? name;
  int id;

  Brand({
    required this.name,
    required this.id,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class Gallery {
  int? productId;
  String? image;
  int id;

  Gallery({
    required this.productId,
    required this.image,
    required this.id,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        productId: json["product_id"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "image": image,
        "id": id,
      };
}
