import 'package:http/http.dart' as http;
import 'package:sellers/models/countries.dart';
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/http_headers/http_headers.dart';
import 'package:sellers/utils/exception/exception.dart';

class CountriesService {
  static Future<List<Countries>> requestUserInformation() async {
    var response = await http.get(
      Uri.parse(ApiUrl.countries),
      headers: HttpHeaders.contentTypeAppliJson,
    );

    if (response.statusCode == 200) {
      return countriesFromJson(response.body);
    } else {
      throw GeneralException();
    }
  }
}
