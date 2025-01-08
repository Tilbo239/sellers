import 'package:http/http.dart' as http;
import 'package:sellers/models/seller.dart';
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/http_headers/http_headers.dart';
import 'package:sellers/utils/exception/exception.dart';

class GetSellerService {
  static Future<SellerModel> requestSeller({required int id}) async {
    var response = await http.get(
      Uri.parse("${ApiUrl.seller}$id/"),
      headers: HttpHeaders.contentTypeAppliJson,
    );

    if (response.statusCode == 200) {
      return sellerModelFromJson(response.body);
    } else {
      throw GeneralException();
    }
  }
}
