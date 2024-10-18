// To parse this JSON data, do
//
//     final sectionList = sectionListFromJson(jsonString);

import 'dart:convert';

SectionList sectionListFromJson(String str) => SectionList.fromJson(json.decode(str));

String sectionListToJson(SectionList data) => json.encode(data.toJson());

class SectionList {
    List<Section> sections;

    SectionList({
        required this.sections,
    });

    factory SectionList.fromJson(Map<String, dynamic> json) => SectionList(
        sections: List<Section>.from(json["sections"].map((x) => Section.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
    };
}

class Section {
    int id;
    String sectionName;
    String mobileIcon;
    List<Category> categories;
    int view;

    Section({
        required this.id,
        required this.sectionName,
        required this.mobileIcon,
        required this.categories,
        required this.view,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        sectionName: json["sectionName"],
        mobileIcon: json["mobileIcon"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        view: json["view"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sectionName": sectionName,
        "mobileIcon": mobileIcon,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "view": view,
    };
}

class Category {
    int id;
    String categoryName;
    List<SubCategory> subCategories;

    Category({
        required this.id,
        required this.categoryName,
        required this.subCategories,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["categoryName"],
        subCategories: List<SubCategory>.from(json["subCategories"].map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "subCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
    };
}

class SubCategory {
    int id;
    String subCategoryName;
    int view;

    SubCategory({
        required this.id,
        required this.subCategoryName,
        required this.view,
    });

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        subCategoryName: json["subCategoryName"],
        view: json["view"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subCategoryName": subCategoryName,
        "view": view,
    };
}
