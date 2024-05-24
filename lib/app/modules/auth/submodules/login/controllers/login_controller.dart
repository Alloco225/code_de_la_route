import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../data/services/firebase_auth_service.dart';
import '../../../../../helpers/utils.dart';
import '../../../../../views/ui/snackbar.dart';
import '../../../controllers/auth_controller.dart';

class LoginController extends GetxController {
  final authController = AuthController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final _usernameController = TextEditingController().obs;
  final _emailController = TextEditingController().obs;
  final _passwordController = TextEditingController().obs;

  final usernameNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  get usernameController => _usernameController.value;
  get emailController => _emailController.value;
  get passwordController => _passwordController.value;

  String get username => usernameController.text.toString().trim();
  String get email => emailController.text.toString().trim();
  String get password => passwordController.text.toString().trim();

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

  Future<bool> signIn(context) async {
    if (validateEmail(email) && validatePassword(password)) {
    } else {
      showSnackbarError("Invalid input for login.", context: context);
      return false;
    }

    _isSigning.value = true;
    log("signIn >> $email $password");

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      _isSigning.value = false;

      if (user != null) {
        showSnackbarSuccess("User is successfully signed in", context: context);
        String? token = await user.getIdToken();
        // user.uid
        log("user signed in $user $token");
        await authController.logUser(user: user, token: token);
        // Get.toNamed(Routes.WELCOME);
        return true;
      } else {
        showSnackbarError("some error occured", context: context);
        return false;
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
      return false;
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

        final userCred = await _firebaseAuth.signInWithCredential(credential);

        if (userCred.user != null) {
          //
          var token = await userCred.user!.getIdToken();
          authController.logUser(user: userCred.user, token: token);
        }
        // Get.toNamed(Routes.WELCOME);
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
      log("xx signInWithGoogle $e");

      showSnackbarError("some error occured $e", context: context);
    }
  }
}
