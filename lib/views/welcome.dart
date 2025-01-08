import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sellers/utils/routes/routes.dart';
import 'package:sellers/utils/widget/elevatef_button_widget.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset('assets/lotties/welcome.json'),
            Lottie.asset(
              'assets/lotties/Sellers.json',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 3,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: ElevatedButtonWidget(
                  text: "Se connecter",
                  onPress: () {
                    Get.toNamed(Routes.login);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: ElevatedButtonWidget(
                text: "S'inscrire",
                onPress: () {
                  Get.toNamed(Routes.register);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
