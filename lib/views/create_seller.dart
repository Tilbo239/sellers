import 'package:country_flags/country_flags.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sellers/controllers/section_controller.dart';
import 'package:sellers/models/countries.dart';
import 'package:sellers/models/section.dart';
import 'package:sellers/services/countries_service.dart';
import 'package:sellers/services/section_service.dart';
import 'package:sellers/utils/constant/countries.dart';
import 'package:sellers/utils/validator_form/validator_form.dart';
import 'package:sellers/utils/widget/build_profile_image.dart';
import 'package:sellers/utils/widget/cover_pictire.dart';
import 'package:sellers/utils/widget/custom_text.dart';
import 'package:sellers/utils/widget/custom_text_form_field.dart';

class CreateSeller extends StatelessWidget {
  CreateSeller({super.key, this.selectedCountry});

  final double height = Get.size.height / 3.5;
  final Map<String, dynamic>? selectedCountry;
  final sectionController = Get.put<SectionController>(SectionController());

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final top = height - (Get.size.height / 5) / 2;

    return Scaffold(
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
                  buildCoverImage(height),
                  Positioned(
                    top: top,
                    right: Get.width / 1.9,
                    child: buildProfileImage(height),
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
                      onChanged: (value) => print(value?.name),
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
                        searchFieldInputDecoration:
                            const InputDecoration(labelText: "Recherche pays"),
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
                        // phoneNumber = phone.completeNumber;
                        // print(phoneNumber);
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
        child: ElevatedButton(
          onPressed: () async {
            if (ValidatorForm.checkLogin(sectionController.sellerKey)) {
              print("object");
            }
            // SectionList sectionList = await SectionService.requestSection();
            // var section = sectionList.sections;

            // for (var section in section) {
            //   print(section.mobileIcon);
            // }
          },
          child: Text("SUIVANT"),
        ),
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
    );
  }
}
