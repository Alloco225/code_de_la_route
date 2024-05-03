import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;

  final RxBool isAuth = false.obs;
  final RxBool isPremium = false.obs;

  void setIsAuth(bool newValue) {
    isAuth.value = newValue;
  }

  void setIsPremium(bool newValue) {
    isPremium.value = newValue;
  }
}
