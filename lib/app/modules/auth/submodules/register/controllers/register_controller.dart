import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/services/firebase_auth_service.dart';
import '../../../../../views/ui/snackbar.dart';

class RegisterController extends GetxController {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  String get username => usernameController.value.text;
  String get email => emailController.value.text;
  String get password => passwordController.value.text;

  final count = 0.obs;
  final _isSigningUp = false.obs;

  bool get isSigningUp => _isSigningUp.value;

  @override
  void onClose() {
    super.onClose();

    usernameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }

  void increment() => count.value++;

  void signUp() async {
    _isSigningUp.value = true;
    log("signUp $email $password");

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    _isSigningUp.value = false;
    if (user != null) {
      showSnackbarSuccess("User is successfully created",
          context: Get.context!);
      // Get.toNamed(Routes.HOME);
    } else {
      showSnackbarError("Some error happend", context: Get.context!);
    }
  }
}
