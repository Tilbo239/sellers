import 'dart:convert';

import 'package:sellers/models/seller_new.dart';
import 'package:http/http.dart' as http;
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/http_headers/http_headers.dart';
import 'package:sellers/utils/exception/exception.dart';

class NewSellerService {
  static Future<NewSeller> requestNewSeller({
    required String token,
    required String shopName,
    required String description,
    required String shopPhone,
    required int country,
    required List sections,
    required String city,
  }) async {
    Map<String, dynamic> body = {
      "shop_name": shopName,
      "description": description,
      "shop_phone": shopPhone,
      "country": country,
      "sections": sections,
      "city": city,
    };
    var response = await http.post(
      Uri.parse(ApiUrl.newSeller),
      headers: HttpHeaders.contentTypeAppliJsonWithToken(token),
      body: jsonEncode(body),
    );
    print("${response.statusCode}");

    if (response.statusCode == 201) {
      print("------------->OK");
      return newSellerFromJson(response.body);
    } else {
      throw GeneralException();
    }
  }
}
