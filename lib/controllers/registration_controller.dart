import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sellers/services/registration_service.dart';
import 'package:sellers/utils/exception/exception.dart';
import 'package:sellers/utils/routes/routes.dart';
import 'package:sellers/utils/widget/snackbar_widget.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> registrationKey = GlobalKey<FormState>();
  var selectesDate = DateTime.now().obs;
  var isLoading = false.obs;

  // late TextEditingController ;
  late TextEditingController emailController,
      passwordController,
      dateController,
      nameController,
      phoneController;
  String date = '';
  RxString message = "".obs;

  @override
  void onInit() {
    super.onInit();

    dateController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    dateController.dispose();
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  void registerUser(
    String email,
    String password,
    String birthday,
    String gender,
    String username,
    String phone,
  ) async {
    isLoading(true);
    try {
      await RegistrationService.registerUser(
        email,
        password,
        birthday,
        gender,
        username,
        phone,
      );

      Get.offNamed(Routes.login);
    } on PhoneExistException {

      message.value = "Il y'a déjà un compte avec ce numéro";
      SnackBarWidgets.snackBar(
        "Inscription",
        message.value,
        backgroundColor: Colors.black38,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    } on EmailAlreadyExistException {
      message.value ="Il y'a déjà un compte avec cette adresse";
      SnackBarWidgets.snackBar(
        "Inscription",
        message.value,
        backgroundColor: Colors.black38,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    } on InvalidNameException {
      message.value = "Votre nom doit avoir au moins 5 caractères.";
      SnackBarWidgets.snackBar(
        "Inscription",
        message.value,
        backgroundColor: Colors.black38,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    } on WeakPasswwordException {
      message.value = "Le mot de passe doit avoir au minimum 6 caratères.";
      SnackBarWidgets.snackBar(
        "Inscription",
        message.value,
        backgroundColor: Colors.black38,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    } on InvalidGenderException {
      message.value = "Choisisser masculin ou feminin !";
      SnackBarWidgets.snackBar(
        "Inscription",
        message.value,
        backgroundColor: Colors.black38,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    } on InvalidPhoneNumberException {
      message.value =
          "Numéro de téléphone invalide. Ressayer avec un format valide svp.";
          SnackBarWidgets.snackBar(
        "Inscription",
        message.value,
        backgroundColor: Colors.black38,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    } catch (e) {
      message.value = "Erreur lors de la création du compte";
      SnackBarWidgets.snackBar(
        "Inscription",
        message.value,
        backgroundColor: Colors.black38,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      // if (e is PhoneExistException) {
      //   message = "Il y'a déjà un compte avec ce numéro";
      // } else if (e is EmailAlreadyExistException) {
      //   message = " Il y'a déjà un compte avec cette adresse";
      // } else if (e is InvalidNameException) {
      //   message = "Votre nom doit avoir au moins 5 caractères.";
      // } else if (e is WeakPasswwordException) {
      //   message = "Le mot de passe doit avoir au minimum 6 caratères.";
      // } else if (e is InvalidGenderException) {
      //   message = "Choisisser masculin ou feminin !";
      // } else if (e is InvalidPhoneNumberException) {
      //   message =
      //       "Numéro de téléphone invalide. Ressayer avec un format valide svp.";
      // } else if (e is InvalidDateException) {
      //   message = "L'âge requis est au moins 5 ans";
      // } else {}
    } finally {
      emailController.clear();
      nameController.clear();
      phoneController.clear();
      passwordController.clear();
      registrationKey.currentState!.reset();
      
      isLoading(false);
    }
  }

  selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectesDate.value,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      currentDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.input,
      keyboardType: TextInputType.number,
      cancelText: "Annuler",
      helpText: "",
      fieldLabelText: "Entrer une date",
      errorFormatText: "Entrer une date valide",
      errorInvalidText: 'entrer une plage de dates valide',
      locale: const Locale('fr', 'FR'),
    );

    if (pickedDate != null && pickedDate != selectesDate.value) {
      selectesDate.value = pickedDate;
      dateController.text = DateFormat('dd.MM.yyyy').format(pickedDate);
      date = DateFormat('dd.MM.yyyy').format(pickedDate);
      // print("object" + date);
    } else {
      dateController.text = DateFormat('dd.MM.yyyy').format(DateTime.now());
      date = DateFormat('dd.MM.yyyy').format(DateTime.now());
      // print("object" + date);
    }
  }
}
