
import 'package:get/get.dart';

class ThemeSettingsController extends GetxController {
  final _isDarkTheme = true.obs;
  bool get isDarkTheme => _isDarkTheme.value;


  @override
  void onInit() async {
    super.onInit();
  }

  setTheme(bool isDark) {
    _isDarkTheme.value = isDark;
  }

  toggleTheme(){
    _isDarkTheme.value = !_isDarkTheme.value;
  }
}
