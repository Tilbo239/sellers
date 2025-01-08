// To parse this JSON data, do
//
//     final newSeller = newSellerFromJson(jsonString);

import 'dart:convert';

NewSeller newSellerFromJson(String str) => NewSeller.fromJson(json.decode(str));

String newSellerToJson(NewSeller data) => json.encode(data.toJson());

class NewSeller {
    int id;
    Country user;
    bool isGlobal;
    bool isGold;
    String shopName;
    Country country;
    String city;
    String? shopPicture;
    String? coverPicture;
    int soldProducts;
    DateTime createdAt;
    DateTime updatedAt;
    List<dynamic> sellerFollowers;
    dynamic address;
    int followers;
    String description;
    List<SectionNew> section;
    dynamic totalRate;
    String shopPhone;
    bool isCertified;
    dynamic idNumber;
    dynamic idFile;

    NewSeller({
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

    factory NewSeller.fromJson(Map<String, dynamic> json) => NewSeller(
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
        section: List<SectionNew>.from(json["section"].map((x) => SectionNew.fromJson(x))),
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

class SectionNew {
    int id;
    String sectionName;

    SectionNew({
        required this.id,
        required this.sectionName,
    });

    factory SectionNew.fromJson(Map<String, dynamic> json) => SectionNew(
        id: json["id"],
        sectionName: json["sectionName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sectionName": sectionName,
    };
}
