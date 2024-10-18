// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  int id;
  String email;
  bool isVerified;
  String phone;
  String name;
  String gender;
  DateTime? birthday;
  DateTime createdAt;
  List<dynamic> sellers;
  String? userProfile;

  Register({
    required this.id,
    required this.email,
    required this.isVerified,
    required this.phone,
    required this.name,
    required this.gender,
    this.birthday,
    required this.createdAt,
    required this.sellers,
    this.userProfile,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        id: json["id"],
        email: json["email"],
        isVerified: json["isVerified"],
        phone: json["phone"],
        name: json["name"],
        gender: json["gender"],
        birthday: DateTime.parse(json["birthday"]),
        createdAt: DateTime.parse(json["createdAt"]),
        sellers: List<dynamic>.from(json["sellers"].map((x) => x)),
        // userProfile: json["user_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "isVerified": isVerified,
        "phone": phone,
        "name": name,
        "gender": gender,
        "birthday": birthday?.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "sellers": List<dynamic>.from(sellers.map((x) => x)),
        "user_profile": userProfile,
      };
}
