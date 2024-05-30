import 'dart:developer';

import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final usernameNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  String get username => usernameController.text;
  String get email => emailController.text;
  String get password => passwordController.text;

  final count = 0.obs;
  final _isSigningUp = false.obs;

  get isSigningUp => _isSigningUp.value;

  void increment() => count.value++;

  Future<bool> signUp(context) async {
    if (validateEmail(email) &&
        validateUsername(username) &&
        validatePassword(password)) {
    } else {
      showSnackbarError("Invalid input for registration.", context: context);
      return false;
    }

    _isSigningUp.value = true;

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      _isSigningUp.value = false;
      if (user != null) {
        await user.updateDisplayName(username);
        showSnackbarSuccess("User is successfully created", context: context);
        String? token = await user.getIdToken();

        // Navigator.pushNamed(context, "/home");
        authController.logUser(user: user, token: token);


      // Create user document in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({
          'email': email,
          'achievements': {},
          'learned_signs': [],
          'level': null,
          'points': 0,
          'username': username,
          'country': '',
        });

        return true;
      }
      showSnackbarError("Some error happend", context: context);
      return false;
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
      return false;
    } catch (e) {
      showSnackbarError("some error occured $e", context: context);
      return false;
    } finally {
      _isSigningUp.value = false;
    }
  }
}
