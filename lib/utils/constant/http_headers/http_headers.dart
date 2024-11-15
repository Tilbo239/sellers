class HttpHeaders {
  static Map<String, String> contentTypeAppliJson = {
    "Content-Type": "application/json"
  };

  static Map<String, String> contentTypeAppliJsonWithToken(String token) {
    return {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };
  }
}
