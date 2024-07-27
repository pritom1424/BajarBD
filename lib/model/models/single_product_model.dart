import 'dart:convert';

class SingleProduct {
  int id;
  String title;
  String description;
  String shortDescription;
  int? categoryId;
  int? subcategoryId;
  int? brandId;
  String unitPrice;
  String? quantity;
  String? discount;
  String? discountPrice;
  String featureImage;
  bool isPublish;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  Category? category;
  Category? subCategory;
  Category? brand;
  List<Gallery> gallery;
  List<dynamic> variation;

  SingleProduct({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    this.categoryId,
    this.subcategoryId,
    this.brandId,
    required this.unitPrice,
    this.quantity,
    this.discount,
    this.discountPrice,
    required this.featureImage,
    required this.isPublish,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.category,
    this.subCategory,
    this.brand,
    required this.gallery,
    required this.variation,
  });

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
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
        isPublish: json["is_publish"] == 1,
        isActive: json["is_active"] == 1,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: json["category"] != null
            ? Category.fromJson(json["category"])
            : null,
        subCategory: json["sub_category"] != null
            ? Category.fromJson(json["sub_category"])
            : null,
        brand: json["brand"] != null ? Category.fromJson(json["brand"]) : null,
        gallery: json["gallery"] != null
            ? List<Gallery>.from(
                json["gallery"].map((x) => Gallery.fromJson(x)))
            : [],
        variation: json["variation"] != null
            ? List<dynamic>.from(json["variation"].map((x) => x))
            : [],
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
        "is_publish": isPublish ? 1 : 0,
        "is_active": isActive ? 1 : 0,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category?.toJson(),
        "sub_category": subCategory?.toJson(),
        "brand": brand?.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
        "variation": List<dynamic>.from(variation.map((x) => x)),
      };
}

class Category {
  String name;
  int id;

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
  int productId;
  String image;
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

// Function to convert JSON string to SingleProduct object
SingleProduct singleProductFromJson(String str) =>
    SingleProduct.fromJson(json.decode(str));

// Function to convert SingleProduct object to JSON string
String singleProductToJson(SingleProduct data) => json.encode(data.toJson());
