// To parse this JSON data, do
//
//     final sellerModel = sellerModelFromJson(jsonString);

import 'dart:convert';

SellerModel sellerModelFromJson(String str) => SellerModel.fromJson(json.decode(str));

String sellerModelToJson(SellerModel data) => json.encode(data.toJson());

class SellerModel {
    Seller seller;
    List<dynamic> reviews;
    List<dynamic> products;

    SellerModel({
        required this.seller,
        required this.reviews,
        required this.products,
    });

    factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
        seller: Seller.fromJson(json["seller"]),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        products: List<dynamic>.from(json["products"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "seller": seller.toJson(),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x)),
    };
}

class Seller {
    int id;
    Country user;
    bool isGlobal;
    bool isGold;
    String shopName;
    Country country;
    String city;
    dynamic shopPicture;
    dynamic coverPicture;
    int soldProducts;
    DateTime createdAt;
    DateTime updatedAt;
    List<dynamic> sellerFollowers;
    dynamic address;
    int followers;
    String description;
    List<Section> section;
    dynamic totalRate;
    String shopPhone;
    bool isCertified;
    dynamic idNumber;
    dynamic idFile;

    Seller({
        required this.id,
        required this.user,
        required this.isGlobal,
        required this.isGold,
        required this.shopName,
        required this.country,
        required this.city,
        required this.shopPicture,
        required this.coverPicture,
        required this.soldProducts,
        required this.createdAt,
        required this.updatedAt,
        required this.sellerFollowers,
        required this.address,
        required this.followers,
        required this.description,
        required this.section,
        required this.totalRate,
        required this.shopPhone,
        required this.isCertified,
        required this.idNumber,
        required this.idFile,
    });

    factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        user: Country.fromJson(json["user"]),
        isGlobal: json["isGlobal"],
        isGold: json["isGold"],
        shopName: json["shopName"],
        country: Country.fromJson(json["country"]),
        city: json["city"],
        shopPicture: json["shopPicture"],
        coverPicture: json["coverPicture"],
        soldProducts: json["soldProducts"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        sellerFollowers: List<dynamic>.from(json["sellerFollowers"].map((x) => x)),
        address: json["address"],
        followers: json["followers"],
        description: json["description"],
        section: List<Section>.from(json["section"].map((x) => Section.fromJson(x))),
        totalRate: json["totalRate"],
        shopPhone: json["shopPhone"],
        isCertified: json["isCertified"],
        idNumber: json["idNumber"],
        idFile: json["idFile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "isGlobal": isGlobal,
        "isGold": isGold,
        "shopName": shopName,
        "country": country.toJson(),
        "city": city,
        "shopPicture": shopPicture,
        "coverPicture": coverPicture,
        "soldProducts": soldProducts,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "sellerFollowers": List<dynamic>.from(sellerFollowers.map((x) => x)),
        "address": address,
        "followers": followers,
        "description": description,
        "section": List<dynamic>.from(section.map((x) => x.toJson())),
        "totalRate": totalRate,
        "shopPhone": shopPhone,
        "isCertified": isCertified,
        "idNumber": idNumber,
        "idFile": idFile,
    };
}

class Country {
    String name;

    Country({
        required this.name,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Section {
    int id;
    String sectionName;

    Section({
        required this.id,
        required this.sectionName,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        sectionName: json["sectionName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sectionName": sectionName,
    };
}
