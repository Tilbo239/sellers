import 'dart:convert';

import 'package:sellers/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/http_headers/http_headers.dart';
import 'package:sellers/utils/exception/exception.dart';

class LoginService {
   
  static Future<LoginResponse> loginEmail(
    String email,
    String password,
  ) async {
    Map<String, String> body = {"username": email, "password": password};

    var response = await http.post(Uri.parse(ApiUrl.loginEmail),
        headers: HttpHeaders.contentTypeAppliJson, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return loginResponseFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw IdentifiantsInvalidesException;
    } else {
      throw GenericAuthException;
    }
  }

  static Future<LoginResponse> socialLogin({
    required String token,
    required String media,
  }) async {
    Map<String, dynamic> body = {"token": token};

    var response = await http.post(
      Uri.parse(ApiUrl.loginSocial + media),
      body: jsonEncode(body),
      headers: HttpHeaders.contentTypeAppliJson,
    );

    if (response.statusCode == 200) {
      return loginResponseFromJson(response.body);
    } else {
      throw GenericAuthException;
    }
  }
}
