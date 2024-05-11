import 'package:codedelaroute/app/data/json_data_provider.dart';
import 'package:codedelaroute/app/data/models/language_model.dart';
import 'package:codedelaroute/app/data/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSettingsController extends GetxController {


  @override
  void onInit() async {
    super.onInit();
    print("Home onInit");

    var selectedLocale = Get.deviceLocale;
  

  }

}
