import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellers/models/section.dart';
import 'package:sellers/services/section_service.dart';
import 'package:sellers/utils/widget/custom_text_form_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  RxBool isLoading = true.obs;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  SectionList? sectionList;
  List<Category>? categories;
  List<SubCategory>? subCategories;

  // static final sectionStorage = GetStorage(KeyStorage.sectionList);

  final _formKey = GlobalKey<FormState>();
  final _dropDownCustomBGKey1 = GlobalKey<DropdownSearchState<String>>();
  final _dropDownCustomBGKey2 = GlobalKey<DropdownSearchState<String>>();
  final _dropDownCustomBGKey3 = GlobalKey<DropdownSearchState<String>>();

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
        FutureBuilder(
          future: SectionService.requestSection(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Indicateur de chargement
            } else if (snapshot.hasError) {
              return Center(
                  child:
                      Text("Erreur : ${snapshot.error}")); // Message d'erreur
            } else if (!snapshot.hasData) {
              return const Center(
                  child: Text("Aucune section disponible.")); // Pas de données
            }
            sectionList = snapshot.data!;

            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
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
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              CustomTextFormField(
                                label: 'Nom du produit',
                                // controller: loginController.emailController,
                                obscureText: false,
                                // prefixIcon: const Icon(Icons.email_outlined),
                                keyboardType: TextInputType.name,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: (email) =>
                                // ValidatorForm.validateEmail(email!),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      label: 'Prix',
                                      // controller: loginController.emailController,
                                      obscureText: false,
                                      // prefixIcon: const Icon(Icons.email_outlined),
                                      keyboardType: TextInputType.name,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      // validator: (email) =>
                                      // ValidatorForm.validateEmail(email!),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: CustomTextFormField(
                                      label: 'Quantité',
                                      // controller: loginController.emailController,
                                      obscureText: false,
                                      // prefixIcon: const Icon(Icons.email_outlined),
                                      keyboardType: TextInputType.name,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      // validator: (email) =>
                                      // ValidatorForm.validateEmail(email!),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextFormField(
                                label: 'Courte description',
                                // controller: loginController.emailController,
                                obscureText: false,
                                // prefixIcon: const Icon(Icons.email_outlined),
                                keyboardType: TextInputType.name,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: (email) =>
                                // ValidatorForm.validateEmail(email!),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DropdownSearch<Section>(
                                key: _dropDownCustomBGKey1,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null) {
                                    return "Ajouter une categorie";
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
                                        .firstWhere((element) =>
                                            element.id == value!.id);
                                    // setState(() {
                                    // Modifiez l'état en toute sécurité ici
                                    categories = [];
                                    categories = section.categories;
                                    // });
                                  });

                                  // print(section.categories);
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
                              Row(
                                children: [
                                  Expanded(
                                    child: DropdownSearch<Category>(
                                      key: _dropDownCustomBGKey2,
                                      autoValidateMode: AutovalidateMode.always,
                                      selectedItem: categories?[0],
                                      validator: (value) {
                                        if (value == null) {
                                          return "Ajouter une categorie";
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

                                          subCategories =
                                              category.subCategories;

                                          print(category.subCategories);
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
                                      autoValidateMode: AutovalidateMode.always,
                                      validator: (value) {
                                        if (value == null) {
                                          return "Ajouter une categorie";
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
                                            borderSide: BorderSide(width: 0),
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
                  ],
                ),
              ),
            );
          },
        ),
        const Text(
          'Index 2: School',
          style: optionStyle,
        ),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        //   () => isLoading.value
        //       ? Scaffold(
        //           body: Center(
        //             child: CircularProgressIndicator.adaptive(),
        //           ),
        //         )
        //       :
        Scaffold(
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
            onTap: () async {
              // if (context.mounted) {
              //   await QuickAlert.show(
              //     context: context,
              //     type: QuickAlertType.success,
              //     title: "Félicitation",
              //     text:
              //         'Votre boutique a été créée avec succès\nContactez Mossosouk.com SARL pour valider votre boutique.\nVotre boutique et vos produits ne seront pas visibles par les utilisateurs avant cette étapes de validation.',
              //     disableBackBtn: true,
              //     barrierDismissible: false,
              //     confirmBtnText: "Continuer",
              //     onConfirmBtnTap: () {
              //       // Get.offAllNamed(Routes.homeView);
              //     },
              //   );
              // }
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions(context).elementAt(_selectedIndex),
      ),
      // FutureBuilder(
      //   future: SectionService.requestSection(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //           child: CircularProgressIndicator()); // Indicateur de chargement
      //     } else if (snapshot.hasError) {
      //       return Center(
      //           child: Text("Erreur : ${snapshot.error}")); // Message d'erreur
      //     } else if (!snapshot.hasData) {
      //       return const Center(
      //           child: Text("Aucune section disponible.")); // Pas de données
      //     }
      //     sectionList = snapshot.data!;

      //     return Center(
      //       child: _widgetOptions(context).elementAt(_selectedIndex),
      //     );
      //   },
      // ),

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
