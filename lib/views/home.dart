import 'dart:developer';
import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellers/models/brand_model.dart';
import 'package:sellers/models/countries.dart';
import 'package:sellers/models/section.dart';
import 'package:sellers/services/brand_service.dart';
import 'package:sellers/services/countries_service.dart';
import 'package:sellers/services/section_service.dart';
import 'package:sellers/utils/constant/api_url/url.dart';
import 'package:sellers/utils/validator_form/validator_form.dart';
import 'package:sellers/utils/widget/custom_text_form_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // RxBool isLoading = true.obs;

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  SectionList? sectionList;
  List<Category>? categories;
  List<SubCategory>? subCategories;

  // static final sectionStorage = GetStorage(KeyStorage.sectionList);

  final _formKey = GlobalKey<FormState>();
  final _dropDownCustomBGKey1 = GlobalKey<DropdownSearchState<String>>();
  final _dropDownCustomBGKey2 = GlobalKey<DropdownSearchState<String>>();
  final _dropDownCustomBGKey3 = GlobalKey<DropdownSearchState<String>>();
  final _dropDownCustomBGKey4 = GlobalKey<DropdownSearchState<String>>();
  final _dropDownCustomBGKey5 = GlobalKey<DropdownSearchState<String>>();

  late TextEditingController productNameController,
      priceController,
      quantityController,
      shortDescriptionController,
      descriptionController,
      weightController;

  List<File> selectedImages = [];

  File? selectedImage;

  int? idSection, idCategorie, idSubCategory, idCountry, idBrand;

  late bool isLoading;

  requestSection() async {
    isLoading = true;
    sectionList = await SectionService.requestSection();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    requestSection();

    setState(() {});

    productNameController = TextEditingController();
    priceController = TextEditingController();
    quantityController = TextEditingController();
    shortDescriptionController = TextEditingController();
    descriptionController = TextEditingController();
    weightController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    productNameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    shortDescriptionController.dispose();
    descriptionController.dispose();
    weightController.dispose();
  }

  Future<void> addImages() async {
    final picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage(
      maxWidth: 800, // can be customized
      maxHeight: 600, // can be customized
    );

    if (images.isNotEmpty) {
      for (XFile image in images) {
        setState(() {
          selectedImages.add(File(image.path));
        });
      }
    }
  }

  Future<void> addImage() async {
    try {
      final picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      setState(() {
        selectedImage = File(image.path);
      });
    } on PlatformException {}
  }

  void deleteImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  final Map<String, dynamic> sellerData = {
    "id": 74,
    "user": {"name": "Vegeta"},
    "isGlobal": false,
    "isGold": false,
    "shopName": "Ma boutique",
    "country": {"name": "Angola"},
    "city": "Nous",
    "shopPicture": "${ApiUrl.imageLink}4a72ea076167e80fc4007200fd9cca1a.jpg",
    "coverPicture": "${ApiUrl.imageLink}e22c556ab8ce184da491eb10f052e702.jpg",
    "soldProducts": 0,
    "createdAt": "2024-12-19T10:09:32-05:00",
    "updatedAt": "2024-12-19T10:09:44-05:00",
    "followers": 0,
    "description": "nndndnndf fbd d",
    "section": [
      {"id": 7, "sectionName": "Santé & Beauté"}
    ],
    "shopPhone": "0023567567345",
    "isCertified": false,
  };

  List<Widget> _widgetOptions(BuildContext context) => <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2, // Nombre de colonnes
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              buildDashboardCard(
                  icon: Icons.inventory,
                  title: "Mes Produits",
                  value:
                      Get.arguments["seller"].products.length.toString() ?? "0",
                  widget: const Text(
                    "Ajouter",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1; // Exemple : aller à un autre index
                    });
                  }),
              buildDashboardCard(
                icon: Icons.store,
                title: "Visiter Boutiques",
                value: "0",
                widget: const SizedBox.shrink(),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2; // Exemple : aller à un autre index
                  });
                },
              ),
              buildDashboardCard(
                icon: Icons.inventory,
                title: "Produits Vendus",
                value: Get.arguments["seller"].seller.soldProducts.toString() ??
                    "0",
                widget: const SizedBox.shrink(),
                onTap: () {},
              ),
              buildDashboardCard(
                icon: Icons.star,
                title: "abonnés",
                value:
                    Get.arguments["seller"].seller.followers.toString() ?? "0",
                widget: const SizedBox.shrink(),
                onTap: () {},
              ),
            ],
          ),
        ),
        // FutureBuilder(
        //   future: SectionService.requestSection(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //           child:
        //               CircularProgressIndicator()); // Indicateur de chargement
        //     } else if (snapshot.hasError) {
        //       return Center(
        //           child:
        //               Text("Erreur : ${snapshot.error}")); // Message d'erreur
        //     } else if (!snapshot.hasData) {
        //       return const Center(
        //           child: Text("Aucune section disponible.")); // Pas de données
        //     }
        //     sectionList = snapshot.data!;

        //     return
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informations du produit",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 25),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 2.0, right: 2.0, top: 5),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                          children: [
                            CustomTextFormField(
                                label: 'Nom du produit',
                                controller: productNameController,
                                obscureText: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (name) =>
                                    ValidatorForm.validateProductName(name!)),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    label: 'Prix',
                                    controller: priceController,
                                    obscureText: false,
                                    textInputAction: TextInputAction.next,
                                    // prefixIcon: const Icon(Icons.email_outlined),
                                    keyboardType: TextInputType.number,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (price) =>
                                        ValidatorForm.validateProductPrice(
                                            price!),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: CustomTextFormField(
                                    label: 'Quantité',
                                    controller: quantityController,
                                    obscureText: false,
                                    textInputAction: TextInputAction.next,
                                    // prefixIcon: const Icon(Icons.email_outlined),
                                    keyboardType: TextInputType.number,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (quantity) =>
                                        ValidatorForm.validateProductQuantity(
                                            quantity!),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              label: 'Courte description',
                              controller: shortDescriptionController,
                              obscureText: false,
                              textInputAction: TextInputAction.next,
                              // prefixIcon: const Icon(Icons.email_outlined),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (description) =>
                                  ValidatorForm.validateDescription(
                                      description!),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DropdownSearch<Section>(
                              key: _dropDownCustomBGKey1,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoratorProps: const DropDownDecoratorProps(
                                decoration: InputDecoration(
                                    labelText: "Rayon du produit",
                                    helperText: "Selectionnez  un rayon"),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Selectionnez un rayon du produit";
                                }
                                return null;
                              },
                              itemAsString: (Section? section) =>
                                  section!.sectionName,
                              items: (f, cs) async {
                                return sectionList!.sections;
                              },
                              compareFn: (item, selectedItem) =>
                                  item.id ==
                                  selectedItem.id, // Example comparison logic
                              onChanged: (value) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  var section = sectionList!.sections
                                      .firstWhere(
                                          (element) => element.id == value!.id);
                                  // setState(() {
                                  // Modifiez l'état en toute sécurité ici
                                  categories = [];
                                  categories = section.categories;

                                  idSection = value!.id;
                                  print(idSection.toString());
                                  // });
                                });

                                // print(section.categories);
                              },
                              popupProps: PopupProps.dialog(
                                showSearchBox: true,
                                dialogProps: DialogProps(
                                  clipBehavior: Clip.antiAlias,
                                  shape: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 0),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownSearch<Category>(
                                    key: _dropDownCustomBGKey2,
                                    autoValidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoratorProps:
                                        const DropDownDecoratorProps(
                                      decoration: InputDecoration(
                                          labelText: "Catégorie",
                                          helperText:
                                              "Selectionnez une catégorie"),
                                    ),
                                    selectedItem: categories?[0],
                                    validator: (value) {
                                      if (value == null) {
                                        return "Selectionnez une categorie";
                                      }
                                      return null;
                                    },
                                    itemAsString: (Category? category) =>
                                        category!.categoryName,
                                    items: (f, cs) {
                                      return categories ?? [];
                                    },
                                    compareFn: (item, selectedItem) =>
                                        item.id ==
                                        selectedItem
                                            .id, // Example comparison logic
                                    onChanged: (value) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        // setState(() {
                                        subCategories = [];
                                        var category = categories!.firstWhere(
                                            (element) =>
                                                element.id == value!.id);

                                        subCategories = category.subCategories;

                                        idCategorie = value!.id;
                                        print(idCategorie);
                                        // });
                                      });
                                    },
                                    popupProps: PopupProps.dialog(
                                      showSearchBox: true,
                                      dialogProps: DialogProps(
                                        clipBehavior: Clip.antiAlias,
                                        shape: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(width: 0),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: DropdownSearch<SubCategory>(
                                    key: _dropDownCustomBGKey3,
                                    selectedItem: subCategories?[0],
                                    autoValidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoratorProps:
                                        const DropDownDecoratorProps(
                                      decoration: InputDecoration(
                                          labelText: "Sous-catégorie",
                                          helperText:
                                              "Selectionnez  une sous-catégorie"),
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return "Selectionnez une categorie";
                                      }
                                      return null;
                                    },
                                    itemAsString:
                                        (SubCategory? subCategories) =>
                                            subCategories!.subCategoryName,
                                    items: (f, cs) {
                                      return subCategories ?? [];
                                    },
                                    compareFn: (item, selectedItem) =>
                                        item.id ==
                                        selectedItem
                                            .id, // Example comparison logic
                                    onChanged: (value) {
                                      idSubCategory = value!.id;
                                      print(idSubCategory);
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        // setState(() {
                                        // subCategories = [];
                                        // var category = categories!
                                        //     .firstWhere((element) => element.id == value!.id);

                                        // subCategories = category.subCategories;

                                        // print(category.subCategories);
                                        // });
                                      });
                                      // var section = sectionList.sections
                                      // .firstWhere((element) => element.id == value!.id);
                                      // setState(() {
                                      //   subCategories = [];
                                      //   categories = section.categories;
                                      // });
                                    },
                                    popupProps: PopupProps.dialog(
                                      showSearchBox: true,
                                      dialogProps: DialogProps(
                                        clipBehavior: Clip.antiAlias,
                                        shape: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(width: 0),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(),
                  Text(
                    "Spécification du produit",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 25),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 2.0, right: 2.0, top: 5),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                          children: [
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            DropdownSearch<Brand>(
                              key: _dropDownCustomBGKey4,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoratorProps: const DropDownDecoratorProps(
                                decoration: InputDecoration(
                                    labelText: "Marque du produit",
                                    helperText: "Selectionner la marque"),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Selectionnez la marque";
                                }
                                return null;
                              },
                              itemAsString: (Brand? brand) => brand!.brandName,
                              items: (f, cs) async {
                                return BrandService.requestSection();
                              },
                              compareFn: (item, selectedItem) =>
                                  item.id ==
                                  selectedItem.id, // Example comparison logic
                              onChanged: (value) {
                                idBrand = value!.id;
                                print(idBrand);
                              },
                              popupProps: PopupProps.dialog(
                                showSearchBox: false,
                                dialogProps: DialogProps(
                                  clipBehavior: Clip.antiAlias,
                                  shape: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 0),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DropdownSearch<Countries>(
                              key: _dropDownCustomBGKey5,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoratorProps: const DropDownDecoratorProps(
                                decoration: InputDecoration(
                                    labelText: "Pays de fabrication",
                                    helperText: "Selectionner un pays"),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Selectionner un pays";
                                }
                                return null;
                              },
                              itemAsString: (Countries? countries) =>
                                  countries!.name,
                              items: (f, cs) async {
                                return CountriesService.requestCountries();
                              },
                              compareFn: (item, selectedItem) =>
                                  item.id ==
                                  selectedItem.id, // Example comparison logic
                              onChanged: (value) {
                                idCountry = value!.id;
                                print(idCountry);
                              },
                              popupProps: PopupProps.dialog(
                                showSearchBox: false,
                                dialogProps: DialogProps(
                                  clipBehavior: Clip.antiAlias,
                                  shape: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 0),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              label: 'Description détaillée',
                              controller: descriptionController,
                              obscureText: false,
                              textInputAction: TextInputAction.next,
                              // prefixIcon: const Icon(Icons.email_outlined),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (descriptionn) => ValidatorForm
                                  .validateProductDetailDescription(
                                      descriptionn!),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              label: 'Poids du produit',
                              controller: weightController,
                              obscureText: false,
                              textInputAction: TextInputAction.done,
                              // prefixIcon: const Icon(Icons.email_outlined),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (weight) =>
                                  ValidatorForm.validateProductWeight(
                                weight!,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(),
                  Text(
                    "Images du produit",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 5, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: addImage,
                                child: const Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      // padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                                      children: [
                                        Text(
                                          'Image principale',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_photo_alternate_rounded,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          'Sélectionner une image',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (selectedImage != null)
                                Stack(
                                  children: [
                                    Image.file(
                                      selectedImage!,
                                      width: 50,
                                      height: 50,
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedImage = null;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.cancel,
                                          color: Colors
                                              .red, // Pour rendre l'icône plus visible
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: addImages,
                                child: const Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      // padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                                      children: [
                                        Text(
                                          'Autres images',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_photo_alternate_rounded,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          'Sélectionner autres',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (selectedImages.isNotEmpty)
                                Wrap(
                                  children: selectedImages
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    int index = entry.key;
                                    File image = entry.value;
                                    return Stack(
                                      children: [
                                        Image.file(
                                          image,
                                          width: 50,
                                          height: 50,
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              deleteImage(index);
                                            },
                                            child: const Icon(
                                              Icons.cancel,
                                              color: Colors
                                                  .red, // Pour rendre l'icône plus visible
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (ValidatorForm.isValidated(_formKey)) {
                          log("message");
                        }

                        // log(isNumeric("2444555").toString());
                      },
                      child: const Text("Ajouter"),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        // },
        // )
        ,
        SingleChildScrollView(
          child: Column(
            children: [
              // Cover Picture
              Stack(
                children: [
                  Image.asset(
                    "assets/images/casque06.jpg",
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    bottom: 16,
                    left: 16,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/personne.png"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Seller Name and Description
              // Column(
              //   children: [
              //     Divider(),
              //     Text(
              //       "Nom du vendeur",
              //       style: TextStyle(
              //         fontSize: 22,
              //       ),
              //     ),
              //     Text(
              //       sellerData['user']['name'],
              //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              // Text(
              //   sellerData['description'] ?? "Pas de description",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 16),
              // Cards for other information
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.white12,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InfoCard(
                            title: "Pays",
                            content: sellerData['country']['name'],
                          ),
                          InfoCard(
                            title: "Ville",
                            content: sellerData['city'],
                          ),
                          InfoCard(
                            title: "Téléphone",
                            content: sellerData['shopPhone'],
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.white12,
                      child: InfoCard(
                        title: "Produits vendus",
                        content: "${sellerData['soldProducts']}",
                      ),
                    ),
                    // InfoCard(
                    //   title: "Section",
                    //   content: sellerData['section']
                    //           .map((section) => section['sectionName'])
                    //           .join(', ') ??
                    //       "Aucune section",
                    // ),
                    // InfoCard(
                    //   title: "Followers",
                    //   content: "${sellerData['followers']}",
                    // ),
                    // InfoCard(
                    //   title: "Certification",
                    //   content: sellerData['isCertified']
                    //       ? "Certifié"
                    //       : "Non certifié",
                    // ),
                    InfoCard(
                      title: "Créé le",
                      content: sellerData['createdAt'],
                    ),
                    InfoCard(
                      title: "Mis à jour le",
                      content: sellerData['updatedAt'],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments["isNewSeller"]
            ? Get.arguments["shopName"]
            : Get.arguments["seller"].seller.shopName),
        actions: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                Icons.person,
                color: Colors.blue,
                size: 30,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: _widgetOptions(context).elementAt(_selectedIndex),
            ),

      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.lightBlue,
        // iconSize: 16,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Ajouter produit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Ma Boutique',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      // ),
    );
  }
}

Widget buildDashboardCard({
  required IconData icon,
  required String title,
  required String value,
  required VoidCallback onTap,
  Widget? widget,
}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
            // SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                widget!
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(content),
    );
  }
}
