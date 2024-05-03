import 'package:code_de_la_route/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../data/services/firebase_auth_service.dart';
import '../../../../../views/ui/snackbar.dart';

class LoginController extends GetxController {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get username => usernameController.value.text;
  String get email => emailController.value.text;
  String get password => passwordController.value.text;

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

  void signIn() async {
    _isSigning.value = true;

    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    _isSigning.value = false;

    if (user != null) {
      showSnackbarSuccess("User is successfully signed in",
          context: Get.context!);
      Get.toNamed(Routes.WELCOME);
    } else {
      showSnackbarError("some error occured", context: Get.context!);
    }
  }

  signInWithGoogle() async {
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
    } catch (e) {
      showSnackbarError("some error occured $e", context: Get.context!);
    }
  }
}
