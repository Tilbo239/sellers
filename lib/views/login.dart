import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sellers/controllers/login_controller.dart';
import 'package:sellers/utils/routes/routes.dart';
import 'package:sellers/utils/validator_form/validator_form.dart';
import 'package:sellers/utils/widget/custom_scaffold.dart';
import 'package:sellers/utils/widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _obscureText = true.obs;
  final loginController = Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
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
                child: Form(
                  // autovalidateMode: AutovalidateMode.disabled,
                  key: loginController.loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Se connecter',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CustomTextFormField(
                        label: 'Email',
                        controller: loginController.emailController,
                        obscureText: false,
                        prefixIcon: const Icon(Icons.email_outlined),
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            ValidatorForm.validateEmail(email!),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          obscureText: _obscureText.value,
                          maxLines: 1,
                          label: 'Mot de passe',
                          controller: loginController.passwordController,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: const Text(
                              'Mot de passe oublié?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () async {
                          if (ValidatorForm.checkLogin(
                              loginController.loginKey)) {
                            final String email =
                                loginController.emailController.text.trim();
                            final password =
                                loginController.passwordController.text.trim();
                            loginController.loginUser(email, password);
                          }
                        }, child: Obx(() {
                          return loginController.isLoading.value
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : const Text('Se connecter');
                        })),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
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
                              'Se connecter avec',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            // onTap: () =>
                            child: Brand(
                              Brands.google,
                              size: 40,
                            ),
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
                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Vous n\'avez pas de compte ? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offNamed(Routes.register);
                            },
                            child: const Text(
                              'S\'enregistrer',
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
