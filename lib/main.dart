import 'package:codedelaroute/app/const/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/i10n/app_translations.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  var locale = const Locale('fr', 'FR');

  runApp(
    GetMaterialApp(
      initialBinding: HomeBinding(),
      title: "Code de la Route",
      locale: locale,
      translations: Messages(),
      theme: kDarkTheme,
      localizationsDelegates: const [],
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
