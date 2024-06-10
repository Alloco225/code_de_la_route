import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codedelaroute/app/const/theme.dart';
import 'package:codedelaroute/app/modules/settings/controllers/theme_settings_controller.dart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/i10n/app_translations.dart';
import 'app/modules/auth/services/auth_service.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await GetStorage.init();

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  log("Loaded App");

  await Get.putAsync(() => AuthService().init());

  var locale = Get.deviceLocale;

  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;

  Get.put(() => ThemeSettingsController().setTheme(isDarkMode));

  // var locale = const Locale('fr', 'FR');

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

      // supportedLocales: const [
      //   Locale('en', 'US'), // English
      //   Locale('fr', 'FR'), // Spanish
      //   // Add more locales as needed
      // ],
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // locale: AppSettings.locale,
      // fallbackLocale: AppSettings.fallbackLocale,
    ),
  );
}
