import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellers/models/section.dart';
import 'package:sellers/services/section_service.dart';
import 'package:sellers/utils/constant/key_storage.dart';
import 'package:sellers/utils/routes/routes.dart';

class SectionController extends GetxController {
  SectionList? sectionList;
  final GlobalKey<FormState> sellerKey = GlobalKey<FormState>();
  static final sectionStorage = GetStorage(KeyStorage.sectionList);
  late TextEditingController nameShopController,
      phoneController,
      cityController,
      descriptionController;
  var isLoading = false.obs;

  var hasRequestedSection =
      false.obs; // Nouvelle variable observable pour le suivi
  @override
  void onInit() {
    super.onInit();

    nameShopController = TextEditingController();
    cityController = TextEditingController();
    phoneController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameShopController.dispose();
    cityController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
  }

  void requestSection({
    XFile? xFileImageProfile,
    XFile? xFileCoverPicture,
    required int idCountry,
    required String phoneNumber,
  }) async {
    isLoading(true);
    try {
      sectionList = await SectionService.requestSection();
      sectionStorage.write(
        KeyStorage.sectionList,
        sectionListToJson(sectionList!),
      );
      // log(xFileImageProfile.toString());
      Get.toNamed(Routes.selectSection, arguments: {
        "nameShop": nameShopController.text,
        "city": cityController.text,
        "description": descriptionController.text,
        "phone": phoneNumber,
        "xFileImageProfile": xFileImageProfile,
        "xFileCoverPicture": xFileCoverPicture,
        "idCountry": idCountry,
      });
    } catch (e) {
      // print(e);
    } finally {
      isLoading(false);
    }
  }
}
