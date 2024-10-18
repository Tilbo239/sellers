import 'package:sellers/models/section.dart';
import 'package:http/http.dart' as http;
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/http_headers/http_headers.dart';
import 'package:sellers/utils/exception/exception.dart';

class SectionService {
  static Future<SectionList> requestSection() async {
    var response = await http.get(
      Uri.parse(ApiUrl.section),
      headers: HttpHeaders.contentTypeAppliJson,
    );

    if (response.statusCode == 200) {
      return sectionListFromJson(response.body);
    } else {
      throw GeneralException();
    }
  }
}