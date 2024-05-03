import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../data/services/firebase_auth_service.dart';
import '../../../../../helpers/utils.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../views/ui/snackbar.dart';
import '../../../controllers/auth_controller.dart';

class LoginController extends GetxController {
  final authController = AuthController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
  final _isSigning = false.obs;

  bool get isSigning => _isSigning.value;

  @override
  void onClose() {
    super.onClose();

    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void increment() => count.value++;

  void signIn(context) async {
    if (validateEmail(email) && validatePassword(password)) {
    } else {
      showSnackbarError("Invalid input for login.", context: context);
      return;
    }

    _isSigning.value = true;
    log("signIn $email $password");
    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      _isSigning.value = false;

      if (user != null) {
        showSnackbarSuccess("User is successfully signed in", context: context);
        authController.setUser(user);

        Get.toNamed(Routes.WELCOME);
      } else {
        showSnackbarError("some error occured", context: context);
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
      _isSigning.value = false;
    }
  }

  signInWithGoogle(context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Get.toNamed(Routes.WELCOME);
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
    }
  }
}
