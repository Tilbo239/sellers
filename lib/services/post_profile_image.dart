import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sellers/utils/exception/exception.dart';

class PostImageService {
  static Future<void> postProfileImage({
    required int sellerID,
    required String token,
    required XFile? image,
    required String url,
    required String field,
  }) async {
    print("----------> $url$sellerID");
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
        "$url$sellerID",
      ),
    );

    final data = await image!.readAsBytes();

    request.headers['Authorization'] = "Bearer $token";

    request.files.add(http.MultipartFile(
      field,
      http.ByteStream.fromBytes(data),
      data.length,
      filename: image.name,
    ));

    final streamedResponse = await request.send();

    final response = await http.Response.fromStream(streamedResponse);

    print(
        "-------------> OKKkkkkkkk ${streamedResponse.statusCode} ${response.body}");
    if (streamedResponse.statusCode == 200) {
      print(response.body);
    } else {
      throw GeneralException;
    }
  }
}
