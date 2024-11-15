// import 'package:chips_choice/chips_choice.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellers/controllers/section_controller.dart';
import 'package:sellers/models/section.dart';
import 'package:sellers/utils/widget/custom_text.dart';

class SelectSection extends StatefulWidget {
  SelectSection({super.key});

  @override
  State<SelectSection> createState() => _SelectSectionState();
}

class _SelectSectionState extends State<SelectSection> {
  // Liste des choix sélectionnés
  bool isSeleted = false;

  final sectionController = Get.find<SectionController>();

  List<Section> multipleSelected = [];

  void setMultipleSelected(List<Section> value) {
    setState(() => multipleSelected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choisir les catégories"),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // spacing: 10,
            children: [
              const SizedBox(
                height: 40,
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 8,
                    right: 8,
                    bottom: 20,
                  ),
                  child: CustomText(
                    text: "Selectionnez la(les) catégorie(s) de produit",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InlineChoice<Section>(
                multiple: true,
                clearable: true,
                value: multipleSelected,
                onChanged: setMultipleSelected,
                itemCount: sectionController.sectionList!.sections.length,
                itemBuilder: (selection, i) {
                  return ChoiceChip(
                    selected: selection
                        .selected(sectionController.sectionList!.sections[i]),
                    onSelected: selection.onSelected(
                      sectionController.sectionList!.sections[i],
                    ),
                    label: Text(
                      sectionController.sectionList!.sections[i].sectionName,
                    ),
                    elevation: 2,
                    checkmarkColor: const Color(
                      0xff0099ff,
                    ),
                    side: const BorderSide(
                      color: Color(
                        0xff0099ff,
                      ),
                    ),
                    selectedColor: Colors.white,
                  );
                },
                listBuilder: ChoiceList.createWrapped(
                  spacing: 5,
                  runSpacing: 3,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                ),
              )
            ]),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 0,
        elevation: 0,
        shadowColor: Colors.transparent,
        child: ElevatedButton(
            onPressed: () async {
              // }

              //Get serction list
            },
            child:
                // Obx(() {
                // return sectionController.isLoading.value
                //     ? const Padding(
                //         padding: EdgeInsets.symmetric(vertical: 5),
                //         child: CircularProgressIndicator(
                //           valueColor: AlwaysStoppedAnimation<Color>(
                //             Colors.white,
                //           ),
                //         ),
                //       )
                //     :
                const Text('Enregistrer ma boutique')
            // })
            ),
      ),
    );
  }
}
