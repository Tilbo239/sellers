class ApiUrl {
  //Base Url Production
  // static String baseUrl = "https://www.mossosouk.com/api";

  //Base Url local
  static const baseUrl = "https://www.mssk.app/api";

  //Post url
  static const loginEmail = "$baseUrl/login_check";
  static const loginSocial = "$baseUrl/token_request_handler/";
  static const userInformation = "$baseUrl/user/account/";
  static const registration = "$baseUrl/user/";
  static const countries = "$baseUrl/country";
  static const section = "$baseUrl/section";
  static const newSeller = "$baseUrl/seller/";

  static String imageLink = "$baseUrl/uploads/images/product_images/";

  static String iconsLink = "$baseUrl/uploads/images/mobile_icon/";
  // static String iconsLink =
  //     "https://www.mossosouk.com/api/uploads/images/mobile_icon/";
  //Get url
  //Delete url
}
