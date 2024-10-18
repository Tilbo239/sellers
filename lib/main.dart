import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sellers/controllers/login_controller.dart';
import 'package:sellers/utils/constant/key_storage.dart';
import 'package:sellers/utils/routes/routes.dart';
import 'package:sellers/utils/theme/custom_themes/text_theme.dart';
import 'package:sellers/views/home.dart';
import 'package:sellers/views/login.dart';
import 'package:sellers/views/register.dart';
import 'package:sellers/views/splash_screen.dart';
import 'package:sellers/views/start_create_seller.dart';
import 'package:sellers/views/welcome.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xff0099ff),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await GetStorage.init(KeyStorage.userInformationKey);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final loginController = Get.put<LoginController>(LoginController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Sellers',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('fr')],
        // initialRoute: Routes.welcome,
        getPages: [
          GetPage(name: Routes.welcome, page: () => Welcome()),
          GetPage(name: Routes.login, page: () => LoginScreen()),
          GetPage(name: Routes.register, page: () => RegisterScreen()),
          GetPage(
            name: Routes.startCreateSeller,
            page: () => const StartCreateSeller(),
          ),
          GetPage(name: Routes.homeView, page: () => const Home()),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: kColorScheme,
            textTheme: TTextTeme.lightTextTheme,
            //Input Decoration Theme
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey, // Default border color
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey, // Default border color
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
            //ElevatedButtonTheme
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0099ff),
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: Color(0xff0099ff))),
        home: Obx(
          () {
            return loginController.isLoading.value
                ? const SplashScreen()
                : Welcome();
          },
        ));
  }
}
