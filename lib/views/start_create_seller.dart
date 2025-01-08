import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:sellers/utils/constant/key_storage.dart';
import 'package:sellers/utils/routes/routes.dart';
import 'package:sellers/utils/widget/custom_text.dart';
import 'package:sellers/views/create_seller.dart';
import 'package:sellers/views/step_to_create_seller.dart';

class StartCreateSeller extends StatelessWidget {
  const StartCreateSeller({super.key});
  // static final _userInfoStorage = GetStorage(KeyStorage.userInformationKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(235, 200, 219, 230),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lotties/createShop.json',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  CustomText(
                    text:
                        "Il est très facile de vendre en ligne sur Mossosouk Sellers",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomText(
                    text:
                        "Juste 4 étapes pour créer votre Boutique et commencer à vendre",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Get.to(const StepToCreateSeller());
                    },
                    label: CustomText(
                      text: "Lire les étapes",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20, color: Colors.blue),
                    ),
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.blue,
                      size: 20,
                    ),
                    iconAlignment: IconAlignment.end,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.createSeller);
                    },
                    child: const CustomText(text: "Créer ma boutique"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
