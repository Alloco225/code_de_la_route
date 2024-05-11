import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;

  final RxBool _isAuth = false.obs;
  final RxBool _isPremium = false.obs;

  get isAuth => _isAuth.value;
  get isPremium => _isPremium.value;

  void setIsAuth(bool newValue) {
    _isAuth.value = newValue;
  }

  void setIsPremium(bool newValue) {
    _isPremium.value = newValue;
  }
}
