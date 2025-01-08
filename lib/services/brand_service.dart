import 'package:sellers/models/brand_model.dart';
import 'package:http/http.dart' as http;
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/http_headers/http_headers.dart';
import 'package:sellers/utils/exception/exception.dart';

class BrandService {
  static Future<List<Brand>> requestSection() async {
    var response = await http.get(
      Uri.parse(ApiUrl.brand),
      headers: HttpHeaders.contentTypeAppliJson,
    );

    if (response.statusCode == 200) {
      return brandFromJson(response.body);
    } else {
      throw GeneralException();
    }
  }
}
