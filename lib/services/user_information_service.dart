import 'package:sellers/models/user_information.dart';
import 'package:http/http.dart' as http;
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/http_headers/http_headers.dart';
import 'package:sellers/utils/exception/exception.dart';

class UserInfoService {
  static Future<UserInformation> requestUserInformation(
      {required String token}) async {
    var response = await http.get(
      Uri.parse(ApiUrl.userInformation),
      headers: HttpHeaders.contentTypeAppliJsonWithToken(token),
    );

    if (response.statusCode == 200) {
      return userInformationFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw GeneralException();
    }
  }
}
