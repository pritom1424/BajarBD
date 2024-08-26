// To parse this JSON data, do
//
//     final singleProductModel = singleProductModelFromJson(jsonString);

import 'dart:convert';

SingleProductModel singleProductModelFromJson(String str) =>
    SingleProductModel.fromJson(json.decode(str));

String singleProductModelToJson(SingleProductModel data) =>
    json.encode(data.toJson());

class SingleProductModel {
  ProductDetail productDetail;
  List<ProductDetail>? relatedProducts;

  SingleProductModel({
    required this.productDetail,
    required this.relatedProducts,
  });

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      SingleProductModel(
        productDetail: ProductDetail.fromJson(json["product_detail"]),
        relatedProducts: List<ProductDetail>.from(
            json["related_products"].map((x) => ProductDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_detail": productDetail.toJson(),
        "related_products": relatedProducts == null
            ? []
            : List<dynamic>.from(relatedProducts!.map((x) => x.toJson())),
      };
}

class ProductDetail {
  int id;
  String? title;
  String? description;
  String? shortDescription;
  int? categoryId;
  dynamic subcategoryId;
  dynamic brandId;
  String? unitPrice;
  String? quantity;
  String? discount;
  String? discountPrice;
  String? featureImage;
  int? featureProduct;
  dynamic hotDeal;
  String? slug;
  int? isPublish;
  int? isActive;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic bestSelling;
  Category? category;
  dynamic subCategory;
  dynamic brand;
  List<Gallery>? gallery;
  List<dynamic>? variation;

  ProductDetail({
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
    required this.bestSelling,
    this.category,
    this.subCategory,
    this.brand,
    this.gallery,
    this.variation,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
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
        bestSelling: json["best_selling"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        subCategory: json["sub_category"],
        brand: json["brand"],
        gallery: json["gallery"] == null
            ? []
            : List<Gallery>.from(
                json["gallery"]!.map((x) => Gallery.fromJson(x))),
        variation: json["variation"] == null
            ? []
            : List<dynamic>.from(json["variation"]!.map((x) => x)),
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
        "best_selling": bestSelling,
        "category": category?.toJson(),
        "sub_category": subCategory,
        "brand": brand,
        "gallery": gallery == null
            ? []
            : List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "variation": variation == null
            ? []
            : List<dynamic>.from(variation!.map((x) => x)),
      };
}

class Category {
  String? name;
  int? id;

  Category({
    required this.name,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
  int? id;

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
