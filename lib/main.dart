import 'dart:developer';

import 'package:codedelaroute/app/const/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/i10n/app_translations.dart';
import 'app/modules/auth/services/auth_service.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  log("Loaded App");

  await Get.putAsync(() => AuthService().init());

  var locale = Get.deviceLocale;

  runApp(
    GetMaterialApp(
      initialBinding: HomeBinding(),
      title: "Code de la Route",
      // theme: AppSettings.theme,
      locale: locale,
      translations: Messages(), // your translations
      theme: kDarkTheme,
      localizationsDelegates: const [
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('fr', 'FR'), // Spanish
        // Add more locales as needed
      ],
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // locale: AppSettings.locale,
      // fallbackLocale: AppSettings.fallbackLocale,
    ),
  );
}
