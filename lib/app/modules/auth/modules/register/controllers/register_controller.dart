import 'dart:developer';

import 'package:code_de_la_route/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../data/services/firebase_auth_service.dart';
import '../../../../../views/ui/snackbar.dart';

class RegisterController extends GetxController {
  final FirebaseAuthService _auth = FirebaseAuthService();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get username => usernameController.text;
  String get email => emailController.text;
  String get password => passwordController.text;

  final count = 0.obs;
  final _isSigningUp = false.obs;

  get isSigningUp => _isSigningUp.value;

  void increment() => count.value++;

  void signUp() async {
    _isSigningUp.value = true;
    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      _isSigningUp.value = false;
      if (user != null) {
        showSnackbarSuccess("User is successfully created",
            context: Get.context!);
        // Navigator.pushNamed(context, "/home");
        Get.toNamed(Routes.WELCOME);
      } else {
        showSnackbarError("Some error happend", context: Get.context!);
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException ${e.code} $e");

      if (e.code == 'invalid-email ') {
        // TODO link with translations table
        showSnackbarError('invalid-email ', context: Get.context!);
      }
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showSnackbarError('Invalid email or password.', context: Get.context!);
      } else {
        log('An error occurred: ${e.code}');
        showSnackbarError('An error occurred.', context: Get.context!);
      }
    } catch (e) {
      showSnackbarError("some error occured $e", context: Get.context!);
    }
  }
}
