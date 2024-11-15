import 'dart:io';

import 'package:country_flags/country_flags.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sellers/controllers/section_controller.dart';
import 'package:sellers/models/countries.dart';
import 'package:sellers/models/section.dart';
import 'package:sellers/models/seller_new.dart';
import 'package:sellers/services/countries_service.dart';
import 'package:sellers/services/new_seller_service.dart';
import 'package:sellers/services/section_service.dart';
import 'package:sellers/utils/constant/countries.dart';
import 'package:sellers/utils/routes/routes.dart';
import 'package:sellers/utils/validator_form/validator_form.dart';
import 'package:sellers/utils/widget/build_profile_image.dart';
import 'package:sellers/utils/widget/cover_pictire.dart';
import 'package:sellers/utils/widget/custom_text.dart';
import 'package:sellers/utils/widget/custom_text_form_field.dart';
import 'package:sellers/utils/widget/snackbar_widget.dart';

// ignore: must_be_immutable
class CreateSeller extends StatelessWidget {
  CreateSeller({super.key, this.selectedCountry});

  final double height = Get.size.height / 3.5;
  final Map<String, dynamic>? selectedCountry;
  final sectionController = Get.put<SectionController>(SectionController());

  final focusNode = FocusNode();

  late String? nameShop, phoneNumber, city, description;
  late int idCountry;

  @override
  Widget build(BuildContext context) {
    Rx<File?> imageProfile = Rx<File?>(null);
    Rx<File?> coverPicture = Rx<File?>(null);

    XFile? xFileImageProfile;

    XFile? xFileCoverPicture;
    final top = height - (Get.size.height / 5) / 2;

    return Obx(
      () => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: Get.size.height / 3,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      child: buildCoverImage(height, coverPicture),
                      onTap: () async {
                        try {
                          xFileCoverPicture = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (xFileCoverPicture == null) return;

                          final imageTemporary = File(xFileCoverPicture!.path);
                          coverPicture.value = imageTemporary;
                        } on PlatformException catch (e) {}
                      },
                    ),
                    Positioned(
                      top: top,
                      right: Get.width / 1.9,
                      child: InkWell(
                        child: buildProfileImage(height, imageProfile),
                        onTap: () async {
                          // QuickAlert.show(
                          //   context: context,
                          //   type: QuickAlertType.loading,
                          //   barrierDismissible: false,
                          //   // title: 'Loading',
                          //   // text: 'Fetching your data',
                          // );
                          // await Future.delayed(Duration(seconds: 5));
                          // Get.back();

                          try {
                            xFileImageProfile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (xFileImageProfile == null) return;

                            final imageTemporary =
                                File(xFileImageProfile!.path);
                            imageProfile.value = imageTemporary;
                          } on PlatformException catch (e) {}
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 20.0),
                child: Form(
                  key: sectionController.sellerKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        label: "Nom de la boutique",
                        hintText: "Entrer le nom de la boutique",
                        controller: sectionController.nameShopController,
                        prefixIcon: const Icon(
                          Icons.person_outline_sharp,
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        validator: (name) =>
                            ValidatorForm.validateNameShop(name!),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      DropdownSearch<Countries>(
                        items: (f, cs) =>
                            countriesFromJson(CountriesJson.countries),
                        // CountriesService.requestUserInformation(),
                        validator: (country) =>
                            ValidatorForm.validateCountry(country),
                        suffixProps: const DropdownSuffixProps(
                          clearButtonProps: ClearButtonProps(isVisible: true),
                        ),
                        compareFn: (Countries item, Countries selectedItem) =>
                            item.id == selectedItem.id,
                        dropdownBuilder: (context, selectedItem) {
                          if (selectedItem == null) {
                            return const SizedBox.shrink();
                          }

                          return Text(selectedItem.name);
                        },
                        decoratorProps: const DropDownDecoratorProps(
                          decoration: InputDecoration(labelText: "Pays"),
                        ),
                        popupProps: PopupProps.dialog(
                          disableFilter:
                              true, //data will be filtered by the backend
                          // showSearchBox: true,
                          showSelectedItems: true,
                          itemBuilder: (ctx, item, isDisabled, isSelected) {
                            // print(item.name);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 5,
                                  bottom: 5,
                                ),
                                child: Row(
                                  children: [
                                    CountryFlag.fromCountryCode(
                                      item.code,
                                      height: 15,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        item.name,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        onChanged: (country) => idCountry = country!.id,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextFormField(
                        label: "Ville",
                        hintText: "Entrer le nom de la ville",
                        controller: sectionController.cityController,
                        prefixIcon: const Icon(
                          Icons.location_city_outlined,
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        validator: (name) =>
                            ValidatorForm.validateNameCity(name!),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      IntlPhoneField(
                        focusNode: focusNode,
                        initialCountryCode: 'TD',
                        // controller: sectionController.phoneController,
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
                          print(phoneNumber);
                        },
                        onCountryChanged: (country) {
                          // print('Country changed to: ' + country.name);
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextFormField(
                        label: "Description",
                        hintText: "Description de la boutique",
                        minLines: 1,
                        maxLines: 10,
                        controller: sectionController.descriptionController,
                        prefixIcon: const Icon(
                          Icons.description_outlined,
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.multiline,
                        validator: (name) =>
                            ValidatorForm.validateDescription(name!),
                      ),
                    ],
                  ),
                ),
              ),
            )
            // SliverToBoxAdapter(child: DropdownSearch()
            // DropdownButtonFormField<Map<String, dynamic>>(
            //   decoration: InputDecoration(
            //     labelText: 'Choisir votre pays',
            //     border: OutlineInputBorder(),
            //   ),
            //   value: selectedCountry,
            //   icon: Icon(
            //     Icons.arrow_drop_down_outlined,
            //   ), // Flash icon next to the dropdown
            //   items: Countries.countries.map((country) {
            //     return DropdownMenuItem<Map<String, dynamic>>(
            //       value: country,
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            // CountryFlag.fromCountryCode(
            //   country["code"].toString(),
            //   height: 15,
            //   width: 20,
            // ), // Flash icon for each item
            //           // SizedBox(width: 8),
            //           Text(country['name'].toString()),
            //         ],
            //       ),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     // setState(() {
            //     //   selectedCountry = value;
            //     // });
            //   },
            // ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 0,
          elevation: 0,
          shadowColor: Colors.transparent,
          child: ElevatedButton(
              onPressed: () async {
                // NewSeller newSeller = await NewSellerService.requestNewSeller(
                //   token:
                //       "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3MzE2NzE2NDAsImV4cCI6MTczMjI3NjQ0MCwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoidGVzdDIwMjdAbW9zc29zb3VrLmNvbSJ9.JWuPr555LSiBRdJId5qlE9rhe0B721A0hJInEhAUaVCO2m7nMVLifcmFte7ISUVpwlcskn4aWjxqS3zaPpBoT9Vud7UrOI_wUq2PvSUUrJam7pxHdOriYpGCzDc2mIS5je5hz-C2uhfXAlRPCQMGmNQKFazHDbVcSw-LvX3NQ-x5iKa7GO05xNzAzjHk_MU6wu-DIoz4YB_tNxoTriDH5zyi82QRPoiPyQnaQnk6W9iJIO5JwmbOlt5a5Wnc81hK0C5O9EWj1OnX4E1IfLsCJwvAwic0FYiEYTzWkU6UKp0GI8ns8lWQg3LlMT-g2EkByyXJqVfBeeeB8QUXVOrKMw",
                //   shopName: "Black Shop",
                //   description: "all black dress code",
                //   shopPhone: "+2357485777485",
                //   country: 215,
                //   sections: [2, 5],
                //   city: "Ndjamena",
                // );

                // print(newSeller.section[0].sectionName);
                if (xFileCoverPicture == null || xFileImageProfile == null) {
                  SnackBarWidgets.snackBar(
                    "Erreur",
                    "insérer la photo de profil et de couverture",
                  );
                  return;
                }
                if (ValidatorForm.checkLogin(sectionController.sellerKey)) {
                  // nameShop = sectionController.nameShopController.text;
                  // description = sectionController.descriptionController.text;
                  // city = sectionController.cityController.text;
                  // print("$nameShop $description $city $idCountry $phoneNumber");
                  // sectionController.requestSection();

                  sectionController.requestSection(
                    xFileCoverPicture: xFileCoverPicture,
                    xFileImageProfile: xFileImageProfile,
                  );
                }
              },
              child: sectionController.isLoading.value
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    )
                  : const Text('Suivant')),
        ),
        //     ListView(
        //   children: [
        //     Stack(
        //       alignment: Alignment.center,
        //       clipBehavior: Clip.none,
        //       children: [
        //         buildCoverImage(height),
        //         Positioned(
        //           top: top,
        //           child: buildProfileImage(height),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
