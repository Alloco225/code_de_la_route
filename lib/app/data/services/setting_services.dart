import 'package:get/get.dart';

class SettingsService extends GetxService {
  Future<SettingsService> init() async => this;

  final RxBool isSettings = false.obs;
  final RxBool isPremium = false.obs;

  void setIsAuth(bool newValue) {
    // isAuth.value = newValue;
  }

  void setIsPremium(bool newValue) {
    isPremium.value = newValue;
  }
}
