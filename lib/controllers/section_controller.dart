import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellers/models/section.dart';
import 'package:sellers/services/section_service.dart';

class SectionController extends GetxController {
  SectionList? sectionList;
  final GlobalKey<FormState> sellerKey = GlobalKey<FormState>();
  late TextEditingController nameShopController,
      phoneController,
      cityController,
      descriptionController;
  var isLoading = false.obs;
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

  void requestSection() async {
    isLoading(true);
    try {
      sectionList = await SectionService.requestSection();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
