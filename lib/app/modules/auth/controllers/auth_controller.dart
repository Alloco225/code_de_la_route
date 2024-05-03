import 'package:codedelaroute/app/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final firebaseAuthService = FirebaseAuthService();

  bool get isAuth => _authUser.value != null;
  final _authUser = (null as User?).obs;
  User? get authUser => _authUser.value;

  setUser(User? user) {
    _authUser.value = user;
  }

  logout() {
    _authUser.value = null;
    // TODO clear cache n stuff
  }
}
