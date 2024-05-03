import 'dart:developer';

import 'package:code_de_la_route/app/const/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/const/app_settings.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  log("Loaded App");

  runApp(
    GetMaterialApp(
      initialBinding: HomeBinding(),
      title: "Code de la Route",
      // theme: AppSettings.theme,
      theme: kDarkTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: AppSettings.locale,
      fallbackLocale: AppSettings.fallbackLocale,
    ),
  );
}
