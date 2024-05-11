import 'package:codedelaroute/app/data/json_data_provider.dart';
import 'package:codedelaroute/app/data/models/language_model.dart';
import 'package:codedelaroute/app/data/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSettingsController extends GetxController {
  final _langProvider = LanguageProvider();
  final _defaultLocal = const Locale('fr', 'FR');

  final _selectedLanguage = (null as Language?).obs;

  final _locale = const Locale('fr', 'FR').obs;
  final _fallbackLocale = const Locale('en', 'UK').obs;

  get locale => _locale.value;
  get fallbackLocale => _fallbackLocale.value;

  final _languages = <Language>[].obs;
  List<Language> get languages => _languages.value;
  get selectedLanguage => _selectedLanguage.value;

  @override
  void onInit() async {
    super.onInit();
    print("Home onInit");

    var selectedLocale = Get.deviceLocale;

    _languages.value = await _langProvider.loadLanguages();

    _selectedLanguage.value =
        _languages.firstWhere((el) => el.id == selectedLocale!.languageCode);
  }

  loadLanguages() async {}

  isLanguageSelected(Language lang) {
    return _selectedLanguage.value?.id == lang.id;
  }

  selectLanguage(Language lang) {
    _selectedLanguage.value = lang;
    Get.updateLocale(
        Locale(lang.locale!.split('_')[0], lang.locale!.split('_')[1]));
  }

  saveLanguage() {
    // if (!_selectedLanguage.value) return;
    // Language lang = _selectedLanguage.value!;
    // Get.updateLocale(
    //     Locale(lang.locale!.split('_')[0], lang.locale!.split('_')[1]));
  }

  setLocale(locale) {
    _locale.value = locale;
  }

  getDeviceLocale() {
    _locale.value = Get.deviceLocale ?? _defaultLocal;
  }
}
