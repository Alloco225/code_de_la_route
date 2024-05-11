import 'dart:developer';

import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../data/services/firebase_auth_service.dart';
import '../../../../../helpers/utils.dart';
import '../../../../../views/ui/snackbar.dart';

class RegisterController extends GetxController {
  final authController = AuthController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final _usernameController = TextEditingController().obs;
  final _emailController = TextEditingController().obs;
  final _passwordController = TextEditingController().obs;

  get usernameController => _usernameController.value;
  get emailController => _emailController.value;
  get passwordController => _passwordController.value;

  String get username => usernameController.text;
  String get email => emailController.text;
  String get password => passwordController.text;

  final count = 0.obs;
  final _isSigningUp = false.obs;

  get isSigningUp => _isSigningUp.value;

  void increment() => count.value++;

  void signUp(context) async {
    if (validateEmail(email) &&
        validateUsername(username) &&
        validatePassword(password)) {
    } else {
      showSnackbarError("Invalid input for registration.", context: context);
      return;
    }

    _isSigningUp.value = true;

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      _isSigningUp.value = false;
      if (user != null) {
        showSnackbarSuccess("User is successfully created", context: context);
        String? token = await user.getIdToken();

        // Navigator.pushNamed(context, "/home");
        authController.logUser(user: user, token: token);
        Get.toNamed(Routes.WELCOME);
      } else {
        showSnackbarError("Some error happend", context: context);
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException ${e.code} $e");

      if (e.code == 'invalid-email ') {
        // TODO link with translations table
        showSnackbarError('invalid-email ', context: context);
      }
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showSnackbarError('Invalid email or password.', context: context);
      } else {
        log('An error occurred: ${e.code}');
        showSnackbarError('An error occurred.', context: context);
      }
    } catch (e) {
      showSnackbarError("some error occured $e", context: context);
    } finally {
      _isSigningUp.value = false;
    }
  }
}
