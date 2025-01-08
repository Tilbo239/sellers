// To parse this JSON data, do
//
//     final brand = brandFromJson(jsonString);

import 'dart:convert';

List<Brand> brandFromJson(String str) => List<Brand>.from(json.decode(str).map((x) => Brand.fromJson(x)));

String brandToJson(List<Brand> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Brand {
    int id;
    String brandName;
    String? image;

    Brand({
        required this.id,
        required this.brandName,
        required this.image,
    });

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        brandName: json["brandName"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brandName": brandName,
        "image": image,
    };
}
