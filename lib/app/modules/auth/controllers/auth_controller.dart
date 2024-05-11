import 'dart:developer';

import 'package:codedelaroute/app/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../mixins/cache_manager.dart';

class AuthController extends GetxController with CacheManager {
  final firebaseAuthService = FirebaseAuthService();
  final _isAuth = false.obs;

  bool get isAuth => _isAuth.value;
  final _authUser = (null as User?).obs;
  User? get authUser => _authUser.value;

  logUser({User? user, String? token}) async {
    _authUser.value = user;
    log("logUser !!! $user, $token");
    _isAuth.value = true;
    //Token is cached
    await saveToken(token);
  }

  void logOut() {
    _authUser.value = null;
    _isAuth.value = false;
    removeToken();
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      _isAuth.value = true;
    }
  }
}
