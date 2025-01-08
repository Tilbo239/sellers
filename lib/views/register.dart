import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sellers/controllers/registration_controller.dart';
import 'package:sellers/utils/routes/routes.dart';
import 'package:sellers/utils/validator_form/validator_form.dart';
import 'package:sellers/utils/widget/custom_scaffold.dart';
import 'package:sellers/utils/widget/custom_text_form_field.dart';
import 'package:sellers/utils/widget/snackbar_widget.dart';

const List<String> list = <String>['Masculin', 'Feminin', 'Aucun'];

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final agreePersonalData = true;
  final _obscureText = true.obs;

  final focusNode = FocusNode();

  final TextEditingController controller = TextEditingController();
  final registrationController =
      Get.put<RegistrationController>(RegistrationController());

  String sexe = "";
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    RxBool agreePersonalData = false.obs;
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: registrationController.registrationKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        'S\'enregistrer',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // full name
                      CustomTextFormField(
                        label: "Nom complet*",
                        hintText: "Entrer votre nom complet",
                        controller: registrationController.nameController,
                        prefixIcon: const Icon(
                          Icons.person_outline_sharp,
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        validator: (name) => ValidatorForm.validateName(name!),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextFormField(
                        label: "Email",
                        hintText: "Entrer votre adresse email",
                        controller: registrationController.emailController,
                        prefixIcon: const Icon(Icons.email_outlined),
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) =>
                            ValidatorForm.validateEmail(email!),
                      ),
                      // email
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              label: "Date de naissance",
                              controller: registrationController.dateController,
                              obscureText: false,
                              hintText: controller.text,
                              prefixIcon:
                                  const Icon(Icons.calendar_month_outlined),
                              readOnly: true,
                              onTap: () {
                                registrationController.selectDate();
                              },
                              validator: (date) =>
                                  ValidatorForm.validateDate(date!),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          DropdownMenu<String>(
                            hintText: "Sexe",
                            onSelected: (String? value) {
                              // This is called when the user selects an item.
                              sexe = value!;
                              // print(sexe);
                            },
                            menuStyle: MenuStyle(
                                elevation: WidgetStateProperty.all(2.0),
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white)),
                            dropdownMenuEntries:
                                list.map<DropdownMenuEntry<String>>(
                              (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all(
                                      LinearBorder.bottom(
                                        side: BorderSide(
                                          color: Colors.grey[200]!,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      IntlPhoneField(
                        focusNode: focusNode,
                        initialCountryCode: 'TD',
                        // controller: registrationController.phoneController,
                        autovalidateMode: AutovalidateMode.always,
                        disableLengthCheck: true,
                        pickerDialogStyle: PickerDialogStyle(
                          searchFieldInputDecoration: const InputDecoration(
                              labelText: "Recherche pays"),
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Numéro de téléphone',
                        ),
                        invalidNumberMessage: "Numéro de téléphone invalide",
                        validator: (value) async {
                          if (value == null || value.number.isEmpty) {
                            return 'Entre votre numéro de téléphone';
                          } else if (value.number.length < 8) {
                            return 'Numéro de téléphone invalide';
                          } else if (!GetUtils.isNum(value.number)) {
                            return "Numéro de téléphone invalide";
                          }
                          return null; // Return null if the input is valid
                        },
                        languageCode: "fr",
                        onChanged: (phone) {
                          phoneNumber = phone.completeNumber;
                          // print(phoneNumber);
                        },
                        onCountryChanged: (country) {
                          // print('Country changed to: ' + country.name);
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // password
                      Obx(
                        () => CustomTextFormField(
                          obscureText: _obscureText.value,
                          maxLines: 1,
                          label: 'Mot de passe',
                          controller: registrationController.passwordController,
                          prefixIcon: const Icon(Icons.lock_person_outlined),
                          keyboardType: TextInputType.text,
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onTap: () => _obscureText.value
                                ? _obscureText.value = false
                                : _obscureText.value = true,
                          ),
                          validator: (password) =>
                              ValidatorForm.validatePassword(password!),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // i agree to the processing
                      Obx(
                        () => Row(
                          children: [
                            Checkbox(
                              value: agreePersonalData.value,
                              onChanged: (bool? value) {
                                // print(value);
                                agreePersonalData.value = value!;
                              },
                              // activeColor: lightColorScheme.primary,
                            ),
                            const Text(
                              'J\'accepte les termes et conditions ',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (ValidatorForm.checkLogin(
                                  registrationController.registrationKey)) {
                                if (!agreePersonalData.value) {
                                  SnackBarWidgets.snackBar(
                                    "Inscription",
                                    "Veuillez accepter les termes et condition pour continuer",
                                    backgroundColor: Colors.black38,
                                    colorText: Colors.white,
                                    duration: const Duration(seconds: 5),
                                  );
                                  return;
                                }
                                if (sexe.isEmpty) {
                                  SnackBarWidgets.snackBar(
                                    "Inscription",
                                    "Veuillez selectionner votre sexe",
                                    backgroundColor: Colors.black38,
                                    colorText: Colors.white,
                                    duration: const Duration(seconds: 5),
                                  );
                                  return;
                                }
                                registrationController.registerUser(
                                  registrationController.emailController.text
                                      .trim(),
                                  registrationController.passwordController.text
                                      .trim(),
                                  registrationController.date,
                                  sexe == 'Aucun' ? "Masculin" : sexe,
                                  registrationController.nameController.text,
                                  phoneNumber.trim(),
                                );
                              }
                            },
                            child: Obx(
                              () => registrationController.isLoading.value
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Text('S\'enregistrer'),
                            )),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'S\'enregistrer avec',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // sign up social media logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Brand(
                            Brands.google,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Brand(
                            Brands.facebook,
                            size: 40,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Avez-vous déja un compte?',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offNamed(Routes.login);
                            },
                            child: const Text(
                              ' Se connecter',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
