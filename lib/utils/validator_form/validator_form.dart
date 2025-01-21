import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:sellers/models/countries.dart';

class ValidatorForm {
  static String? validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      return "Email invalide";
    } else {
      return null;
    }
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Entrez un mot de passe';
    }
    if (password.length < 7) {
      return 'Mot de passe court';
    }
    return null;
  }

  static String? validateDate(String date) {
    if (date.isEmpty) {
      return 'Choisir une date';
    }
    return null;
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return "Entrez votre nom";
    } else if (name.length <= 3) {
      return "Nom trop court";
    } else {
      return null;
    }
  }

  static String? validateNameShop(String name) {
    if (name.isEmpty) {
      return "Entrez votre nom";
    } else {
      return null;
    }
  }

  static String? validateNameCity(String name) {
    if (name.isEmpty) {
      return "Entrez votre ville";
    } else if (name.length < 3) {
      return "Nom de ville trop court";
    } else {
      return null;
    }
  }

  static String? validateDescription(String name) {
    if (name.isEmpty) {
      return "Entrez la description de la boutique";
    } else if (name.length < 10) {
      return "Description trop courte";
    } else {
      return null;
    }
  }

  static String? validateCountry(Countries? countries) {
    if (countries == null) {
      return "Selectionnez votre pays";
    } else {
      return null;
    }
  }

  static String? validateProductName(String name) {
    if (name.isEmpty) {
      return "Entrez le nom du  produit";
    } else {
      return null;
    }
  }

  static bool isNumeric(String str) {
    // if (str.isEmpty) return false;
    final numericRegex = RegExp(r'^[0-9]+$');
    return numericRegex.hasMatch(str);
  }

  static String? validateProductPrice(String price) {
    if (price.isEmpty) {
      return "Entrez le prix du produit";
    } else if (!isNumeric(price)) {
      return "Valeur incorrecte";
    } else {
      return null;
    }
  }

  static String? validateProductQuantity(String quantity) {
    if (quantity.isEmpty) {
      return "Entrez la quantité du produit";
    } else if (!isNumeric(quantity)) {
      return "Valeur incorrecte";
    } else {
      return null;
    }
  }

  static String? validateProductDescription(String desciption) {
    if (desciption.isEmpty) {
      return "Entrez la desciption du produit";
    } else {
      return null;
    }
  }

  static String? validateProductDetailDescription(String description) {
    if (description.isEmpty) {
      return "Entrez la desciption du produit";
    } else if (description.length < 150) {
      return "Description courte";
    } else {
      return null;
    }
  }

  static String? validateProductWeight(String weight) {
    if (!isNumeric(weight)) {
      return "Valeur incorrecte";
    } else if (weight.isEmpty) {
      return null;
    } else {
      return null;
    }
  }

  static bool isValidated(GlobalKey<FormState> globalFormKey) {
    final isValid = globalFormKey.currentState!.validate();

    if (!isValid) {
      return isValid;
    }
    globalFormKey.currentState!.save();

    return isValid;
  }
}
