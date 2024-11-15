// To parse this JSON data, do
//
//     final userInformation = userInformationFromJson(jsonString);

import 'dart:convert';

UserInformation userInformationFromJson(String str) =>
    UserInformation.fromJson(json.decode(str));

String userInformationToJson(UserInformation data) =>
    json.encode(data.toJson());

class UserInformation {
  User user;
  DefaultAddress? defaultAddress;
  int orders;

  UserInformation({
    required this.user,
    this.defaultAddress,
    required this.orders,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        user: User.fromJson(json["user"]),
        defaultAddress: json["defaultAddress"] == null
            ? json["defaultAddress"]
            : DefaultAddress.fromJson(json["defaultAddress"]),
        orders: json["orders"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "defaultAddress":
            defaultAddress == null ? defaultAddress : defaultAddress!.toJson(),
        "orders": orders,
      };
}

class DefaultAddress {
  int id;
  Country country;
  bool isDefault;
  String phone1;
  String? phone2;
  String address;
  String emailAddress;
  String? moreInformation;
  DateTime createdAt;
  String city;
  String name;

  DefaultAddress({
    required this.id,
    required this.country,
    required this.isDefault,
    required this.phone1,
    this.phone2,
    required this.address,
    required this.emailAddress,
    this.moreInformation,
    required this.createdAt,
    required this.city,
    required this.name,
  });

  factory DefaultAddress.fromJson(Map<String, dynamic> json) => DefaultAddress(
        id: json["id"] ?? 0,
        country: Country.fromJson(json["country"]),
        isDefault: json["isDefault"] ?? false,
        phone1: json["phone1"],
        phone2: json["phone2"],
        address: json["address"],
        emailAddress: json["emailAddress"],
        moreInformation: json["moreInformation"],
        createdAt: DateTime.parse(json["createdAt"]),
        city: json["city"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country.toJson(),
        "isDefault": isDefault,
        "phone1": phone1,
        "phone2": phone2,
        "address": address,
        "emailAddress": emailAddress,
        "moreInformation": moreInformation,
        "createdAt": createdAt.toIso8601String(),
        "city": city,
        "name": name,
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

class User {
  int id;
  String email;
  bool isVerified;
  String phone;
  String name;
  String gender;
  DateTime birthday;
  DateTime createdAt;
  List<Seller> sellers;
  String? userProfile;

  User({
    required this.id,
    required this.email,
    required this.isVerified,
    required this.phone,
    required this.name,
    required this.gender,
    required this.birthday,
    required this.createdAt,
    required this.sellers,
    this.userProfile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        isVerified: json["isVerified"],
        phone: json["phone"],
        name: json["name"],
        gender: json["gender"],
        birthday: DateTime.parse(json["birthday"]),
        createdAt: DateTime.parse(json["createdAt"]),
        sellers:
            List<Seller>.from(json["sellers"].map((x) => Seller.fromJson(x))),
        userProfile: json["user_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "isVerified": isVerified,
        "phone": phone,
        "name": name,
        "gender": gender,
        "birthday": birthday.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "sellers": List<dynamic>.from(sellers.map((x) => x.toJson())),
        "user_profile": userProfile,
      };
}

class Seller {
  int id;
  String shopName;
  String? shopPicture;
  String? coverPicture;

  Seller({
    required this.id,
    required this.shopName,
    this.shopPicture,
    this.coverPicture,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        shopName: json["shopName"],
        shopPicture: json["shopPicture"],
        coverPicture: json["coverPicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shopName": shopName,
        "shopPicture": shopPicture,
        "coverPicture": coverPicture,
      };
}
