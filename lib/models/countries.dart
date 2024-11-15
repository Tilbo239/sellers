// To parse this JSON data, do
//
//     final countries = countriesFromJson(jsonString);

import 'dart:convert';

List<Countries> countriesFromJson(String str) => List<Countries>.from(json.decode(str).map((x) => Countries.fromJson(x)));

String countriesToJson(List<Countries> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Countries {
    int id;
    String name;
    String code;

    Countries({
        required this.id,
        required this.name,
        required this.code,
    });

    factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        id: json["id"],
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
    };
}

