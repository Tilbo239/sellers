import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      return "Entrez la description";
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

  static bool checkLogin(GlobalKey<FormState> login) {
    final isValid = login.currentState!.validate();

    if (!isValid) {
      return isValid;
    }
    login.currentState!.save();

    return isValid;
  }
}
