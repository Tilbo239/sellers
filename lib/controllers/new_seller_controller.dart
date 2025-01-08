import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sellers/models/section.dart';
import 'package:sellers/models/seller_new.dart';
// import 'package:sellers/models/section.dart';
import 'package:sellers/services/new_seller_service.dart';
import 'package:sellers/services/post_profile_image.dart';
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/constant/key_storage.dart';
import 'package:sellers/utils/routes/routes.dart';

class NewSellerController extends GetxController {
  static final _tokenStorage = GetStorage();
  RxBool hasExpired = true.obs; //true if user is not connected, false if else
  var isLoading = false.obs;
  String? token;
  NewSeller? seller;

  @override
  void onInit() {
    super.onInit();

    token = _tokenStorage.read(KeyStorage.tokenKEY);
    if (token != null) hasExpired(JwtDecoder.isExpired(token!));

    if (hasExpired.value) Get.offNamed(Routes.login);
  }

  void requestNewSeller({
    // required String token,
    required String shopName,
    required String description,
    required String shopPhone,
    required int country,
    required List<int> sections,
    // required List<Section> dataSection,
    required String city,
    required XFile? xFileImageProfile,
    required XFile? xFileCoverPicture,
    required BuildContext context,
  }) async {
    isLoading(true);
    // await Future.delayed(const Duration(seconds: 5), () {
    //   print("object");
    // });
    // isLoading(false);
    seller = await NewSellerService.requestNewSeller(
      token: token!,
      shopName: shopName,
      description: description,
      shopPhone: shopPhone,
      country: country,
      sections: sections,
      city: city,
    ).then(
      (newSeller) async {
        print("GREAT JOB 1");
        int sellerID = newSeller.id;

        PostImageService.postProfileImage(
          sellerID: sellerID,
          token: token!,
          image: xFileImageProfile,
          url: ApiUrl.shopPicture,
          field: "shop_picture",
        ).then(
          (onValue) {
            print("GREAT JOB 2");
            PostImageService.postProfileImage(
              sellerID: sellerID,
              token: token!,
              image: xFileCoverPicture,
              url: ApiUrl.coverShopPicture,
              field: "cover_picture",
            ).then(
              (onValue) async {
                print("GREAT JOB 3");
                isLoading(false);

                if (context.mounted) {
                  await QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    title: "Félicitation",
                    text:
                        'Votre boutique a été créée avec succès\nContactez Mossosouk.com SARL pour valider votre boutique.\nVotre boutique et vos produits ne seront pas visibles par les utilisateurs avant cette étapes de validation.',
                    disableBackBtn: true,
                    barrierDismissible: false,
                    confirmBtnText: "Continuer",
                    onConfirmBtnTap: () {
                      Get.offAllNamed(
                        Routes.homeView,
                        arguments: {
                          "isNewSeller": true,
                          "shopName": seller!.shopName,
                        },
                      );
                    },
                  );
                }
              },
              onError: (error) {
                print("error1 $error");
              },
            );
          },
          onError: (error) {
            print("error2 $error");
          },
        );
      },
      onError: (error) {
        print("error3 $error");
      },
    );
  }
}
