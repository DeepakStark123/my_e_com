// To parse this JSON data, do
//
//     final getSubCategoryModel = getSubCategoryModelFromJson(jsonString);

import 'dart:convert';

GetSubCategoryModel getSubCategoryModelFromJson(String str) => GetSubCategoryModel.fromJson(json.decode(str));

String getSubCategoryModelToJson(GetSubCategoryModel data) => json.encode(data.toJson());

class GetSubCategoryModel {
    String? code;
    String? message;
    List<Datum>? data;

    GetSubCategoryModel({
        this.code,
        this.message,
        this.data,
    });

    factory GetSubCategoryModel.fromJson(Map<String, dynamic> json) => GetSubCategoryModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? name;
    String? image;
    String? categoryId;
    List<BrandDatum>? brandData;

    Datum({
        this.id,
        this.name,
        this.image,
        this.categoryId,
        this.brandData,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        categoryId: json["category_id"],
        brandData: json["brandData"] == null ? [] : List<BrandDatum>.from(json["brandData"]!.map((x) => BrandDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "category_id": categoryId,
        "brandData": brandData == null ? [] : List<dynamic>.from(brandData!.map((x) => x.toJson())),
    };
}

class BrandDatum {
    String? id;
    Name? name;

    BrandDatum({
        this.id,
        this.name,
    });

    factory BrandDatum.fromJson(Map<String, dynamic> json) => BrandDatum(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
    };
}

// ignore: constant_identifier_names
enum Name { SS, SG, HRS }

final nameValues = EnumValues({
    "HRS": Name.HRS,
    "SG": Name.SG,
    "SS": Name.SS
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
