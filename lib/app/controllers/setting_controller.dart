import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {

  final _defaultLocal = const Locale('fr', 'FR');

  final _locale = const Locale('fr', 'FR').obs;
  final _fallbackLocale = const Locale('en', 'UK').obs;

  get locale => _locale.value;
  get fallbackLocale => _fallbackLocale.value;

  setLocale(locale) {
    _locale.value = locale;
  }

  getDeviceLocale() {
    _locale.value = Get.deviceLocale ?? _defaultLocal;
  }

}
