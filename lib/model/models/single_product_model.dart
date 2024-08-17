import 'dart:convert';

SingleProductModel singleProductModelFromJson(String str) =>
    SingleProductModel.fromJson(json.decode(str));

String singleProductModelToJson(SingleProductModel data) =>
    json.encode(data.toJson());

class SingleProductModel {
  int id;
  String? title;
  String? description;
  String? shortDescription;
  int? categoryId;
  int? subcategoryId;
  int? brandId;
  String? unitPrice;
  String? quantity;
  String? discount;
  String? discountPrice;
  String? featureImage;
  bool? featureProduct;
  bool? hotDeal;
  String? slug;
  int? isPublish;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;
  Category? subCategory;
  Brand? brand;
  List<dynamic>? gallery;
  List<dynamic>? variation;

  SingleProductModel({
    required this.id,
    this.title,
    this.description,
    this.shortDescription,
    this.categoryId,
    this.subcategoryId,
    this.brandId,
    this.unitPrice,
    this.quantity,
    this.discount,
    this.discountPrice,
    this.featureImage,
    this.featureProduct,
    this.hotDeal,
    this.slug,
    this.isPublish,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.subCategory,
    this.brand,
    this.gallery,
    this.variation,
  });

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      SingleProductModel(
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
        featureProduct: json["feature_product"] == null
            ? null
            : json["feature_product"] == 1,
        hotDeal: json["hot_deal"] == null ? null : json["hot_deal"] == 1,
        slug: json["slug"],
        isPublish: json["is_publish"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        subCategory: json["sub_category"] == null
            ? null
            : Category.fromJson(json["sub_category"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        gallery: json["gallery"] == null
            ? null
            : List<dynamic>.from(json["gallery"].map((x) => x)),
        variation: json["variation"] == null
            ? null
            : List<dynamic>.from(json["variation"].map((x) => x)),
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
        "feature_product": featureProduct == null
            ? null
            : featureProduct!
                ? 1
                : 0,
        "hot_deal": hotDeal == null
            ? null
            : hotDeal!
                ? 1
                : 0,
        "slug": slug,
        "is_publish": isPublish,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category": category?.toJson(),
        "sub_category": subCategory?.toJson(),
        "brand": brand?.toJson(),
        "gallery":
            gallery == null ? null : List<dynamic>.from(gallery!.map((x) => x)),
        "variation": variation == null
            ? null
            : List<dynamic>.from(variation!.map((x) => x)),
      };
}

class Category {
  String? name;
  int? id;

  Category({
    this.name,
    this.id,
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

class Brand {
  String? name;
  int? id;

  Brand({
    this.name,
    this.id,
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
