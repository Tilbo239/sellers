import 'dart:convert';

import 'package:sellers/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/http_headers/http_headers.dart';
import 'package:sellers/utils/exception/exception.dart';

class RegistrationService {
  static Future<Register> registerUser(
    String email,
    String password,
    String birthday,
    String gender,
    String username,
    String phone,
  ) async {
    Map<String, String> body = {
      "name": username,
      "email": email,
      "phone": phone,
      "password": password,
      "gender": gender,
      "birthday": birthday,
    };

    var response = await http.post(Uri.parse(ApiUrl.registration),
        headers: HttpHeaders.contentTypeAppliJson, body: jsonEncode(body));

    if (response.statusCode == 201) {
      // print("Bonjour");
      return registerFromJson(response.body);
    } else {
      final error = jsonDecode(response.body)["errors"];

      // print(error['email']);
      // print(error['phone']);

      if ((error["email"] == "Il y'a déjà un compte avec cette adresse")) {
        // print("object1");
        throw EmailAlreadyExistException;
      } else if (error["name"] ==
          "Votre nom doit avoir au moins 5 caractères.") {
        throw InvalidNameException;
      } else if (error["password"] ==
          "Le mot de passe doit avoir au minimum 6 caratères.") {
        throw WeakPasswwordException;
      } else if (error["gender"] == "Choisisser masculin ou feminin !") {
        throw InvalidGenderException;
      } else if (error["phone"] == "Il y'a déjà un compte avec ce numéro") {
        //  print("object2");
        throw PhoneExistException;
      } else if (error["birthday"] == "L'âge doit être {{ limit }} ans.") {
        throw InvalidDateException;
      } else {
        //  print("object3");
        throw GeneralException;
      }
    }
    //  else if (error["phone"] ==
    //     "Numéro de téléphone invalide. Ressayer avec un format valide svp.") {
    //   throw InvalidPhoneNumberException();
    // }
  }
}
