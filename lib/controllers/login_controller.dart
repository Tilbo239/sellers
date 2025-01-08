import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sellers/models/login_response_model.dart';
import 'package:sellers/models/seller.dart';
import 'package:sellers/models/user_information.dart';
import 'package:sellers/services/get_seller_service.dart';
import 'package:sellers/services/login_service.dart';
import 'package:sellers/services/user_information_service.dart';
import 'package:sellers/utils/constant/key_storage.dart';
import 'package:sellers/utils/exception/exception.dart';
import 'package:sellers/utils/routes/routes.dart';

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  static final _userInfoStorage = GetStorage(KeyStorage.userInformationKey);
  static final _tokenStorage = GetStorage();

  late Timer timer;

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  RxBool hasExpired = true.obs; //true if user is not connected, false if else
  RxBool isSeller = false.obs; //true if user is seller, false if else

  @override
  void onInit() {
    super.onInit();
    String? token = _tokenStorage.read(KeyStorage.tokenKEY);
    if (token != null) {
      hasExpired(JwtDecoder.isExpired(token));

      fetchUserInformation(token);
    } else {
      isLoading(true);

      timer = Timer(const Duration(seconds: 3), () {
        isLoading(false);
      });
    }

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser(String email, String password) async {
    try {
      isLoading(true);
      LoginResponse loginResponse =
          await LoginService.loginEmail(email, password);
      _tokenStorage.write(KeyStorage.tokenKEY, loginResponse.token);
      hasExpired(JwtDecoder.isExpired(loginResponse
          .token)); //assign  to hasExpired the value false if token is not expired
      // loginResponse.token
      fetchUserInformation(loginResponse.token);
    } catch (e) {
      if (e is IdentifiantsInvalidesException) {
        Get.back();
        //Display message error
      } else if (e is GenericAuthException) {
        Get.back();
        //Display message error
      } else {
        Get.back();
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchUserInformation(
    String token,
  ) async {
    isLoading(true);
    // _tokenStorage.remove(KeyStorage.tokenKEY);
    try {
      UserInformation userInformation =
          await UserInfoService.requestUserInformation(token: token);

      isSeller(userInformation
          .user.sellers.isNotEmpty); //if false the user is not seller yet
      if ((isSeller.value == true) && (hasExpired.value == false)) {
        // print(userInformation.user.sellers[0].id);
        SellerModel sellerModel = await GetSellerService.requestSeller(
          id: userInformation.user.sellers[0].id,
        );
        await Get.offAllNamed(Routes.homeView, arguments: {
          "seller": sellerModel,
          "userInformation": userInformation,
          "isNewSeller": false
        });
      } else if (!hasExpired.value && isSeller.value == false) {
        Get.offAllNamed(Routes.startCreateSeller);
      }

      _userInfoStorage.write(
        KeyStorage.userInformationKey,
        userInformation.toJson(),
      );
    } catch (e) {
      if (e is UnauthorizedException) {
        _tokenStorage.erase();
      } else {
        _tokenStorage.erase();
      }
    } finally {
      isLoading(false);
    }
  }
}
