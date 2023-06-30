// To parse this JSON data, do
//
//     final getProductListModel = getProductListModelFromJson(jsonString);

import 'dart:convert';

GetProductListModel getProductListModelFromJson(String str) => GetProductListModel.fromJson(json.decode(str));

String getProductListModelToJson(GetProductListModel data) => json.encode(data.toJson());

class GetProductListModel {
    String? code;
    String? message;
    Data? data;

    GetProductListModel({
        this.code,
        this.message,
        this.data,
    });

    factory GetProductListModel.fromJson(Map<String, dynamic> json) => GetProductListModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    List<Product>? products;
    String? category;
    List<dynamic>? brands;
    List<dynamic>? variants;
    List<dynamic>? subCategories;
    int? maxSellingPrice;
    int? minSellingPrice;
    dynamic categoryDetail;
    dynamic subCategoryDetail;
    dynamic brandBanner;
    Pagination? pagination;

    Data({
        this.products,
        this.category,
        this.brands,
        this.variants,
        this.subCategories,
        this.maxSellingPrice,
        this.minSellingPrice,
        this.categoryDetail,
        this.subCategoryDetail,
        this.brandBanner,
        this.pagination,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        category: json["category"],
        brands: json["brands"] == null ? [] : List<dynamic>.from(json["brands"]!.map((x) => x)),
        variants: json["variants"] == null ? [] : List<dynamic>.from(json["variants"]!.map((x) => x)),
        subCategories: json["subCategories"] == null ? [] : List<dynamic>.from(json["subCategories"]!.map((x) => x)),
        maxSellingPrice: json["maxSellingPrice"],
        minSellingPrice: json["minSellingPrice"],
        categoryDetail: json["category_detail"],
        subCategoryDetail: json["sub_category_detail"],
        brandBanner: json["brandBanner"],
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "category": category,
        "brands": brands == null ? [] : List<dynamic>.from(brands!.map((x) => x)),
        "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
        "subCategories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x)),
        "maxSellingPrice": maxSellingPrice,
        "minSellingPrice": minSellingPrice,
        "category_detail": categoryDetail,
        "sub_category_detail": subCategoryDetail,
        "brandBanner": brandBanner,
        "pagination": pagination?.toJson(),
    };
}

class Pagination {
    int? currentPage;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    String? nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    Pagination({
        this.currentPage,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Product {
    String? id;
    String? title;
    String? categoryId;
    String? subCategoryId;
    String? brandId;
    BrandName? brandName;
    String? productVariantId;
    String? price;
    String? sellingPrice;
    String? discount;
    VariantDetail? variantDetail;
    SubVariantDetail? subVariantDetail;
    String? singleImage;
    String? ratingAverage;
    String? ratingCount;
    List<dynamic>? productOutlets;
    int? wishlistExist;

    Product({
        this.id,
        this.title,
        this.categoryId,
        this.subCategoryId,
        this.brandId,
        this.brandName,
        this.productVariantId,
        this.price,
        this.sellingPrice,
        this.discount,
        this.variantDetail,
        this.subVariantDetail,
        this.singleImage,
        this.ratingAverage,
        this.ratingCount,
        this.productOutlets,
        this.wishlistExist,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        brandId: json["brand_id"],
        brandName: brandNameValues.map[json["brand_name"]]!,
        productVariantId: json["product_variant_id"],
        price: json["price"],
        sellingPrice: json["selling_price"],
        discount: json["discount"],
        variantDetail: json["variant_detail"] == null ? null : VariantDetail.fromJson(json["variant_detail"]),
        subVariantDetail: json["sub_variant_detail"] == null ? null : SubVariantDetail.fromJson(json["sub_variant_detail"]),
        singleImage: json["single_image"],
        ratingAverage: json["rating_average"],
        ratingCount: json["rating_count"],
        productOutlets: json["product_outlets"] == null ? [] : List<dynamic>.from(json["product_outlets"]!.map((x) => x)),
        wishlistExist: json["wishlistExist"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "brand_id": brandId,
        "brand_name": brandNameValues.reverse[brandName],
        "product_variant_id": productVariantId,
        "price": price,
        "selling_price": sellingPrice,
        "discount": discount,
        "variant_detail": variantDetail?.toJson(),
        "sub_variant_detail": subVariantDetail?.toJson(),
        "single_image": singleImage,
        "rating_average": ratingAverage,
        "rating_count": ratingCount,
        "product_outlets": productOutlets == null ? [] : List<dynamic>.from(productOutlets!.map((x) => x)),
        "wishlistExist": wishlistExist,
    };
}

// ignore: constant_identifier_names
enum BrandName { SS }

final brandNameValues = EnumValues({
    "SS": BrandName.SS
});

class SubVariantDetail {
    int? id;
    int? variantId;
    String? name;
    int? sequenceNo;
    String? code;
    int? status;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    SubVariantDetail({
        this.id,
        this.variantId,
        this.name,
        this.sequenceNo,
        this.code,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory SubVariantDetail.fromJson(Map<String, dynamic> json) => SubVariantDetail(
        id: json["id"],
        variantId: json["variant_id"],
        name: json["name"],
        sequenceNo: json["sequence_no"],
        code: json["code"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "variant_id": variantId,
        "name": name,
        "sequence_no": sequenceNo,
        "code": code,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class VariantDetail {
    int? id;
    Name? name;
    int? status;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? type;

    VariantDetail({
        this.id,
        this.name,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.type,
    });

    factory VariantDetail.fromJson(Map<String, dynamic> json) => VariantDetail(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "type": type,
    };
}

// ignore: constant_identifier_names
enum Name { SIZE }

final nameValues = EnumValues({
    "Size": Name.SIZE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
