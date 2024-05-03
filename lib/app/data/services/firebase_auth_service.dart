import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../views/ui/snackbar.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Disable persistence on web platforms. Must be called on initialization:
  // final auth = FirebaseAuth.instanceFor(app: Firebase.app(), persistence: Persistence.NONE);
  // // To change it after initialization, use `setPersistence()`:
  // await auth.setPersistence(Persistence.LOCAL);

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException ${e.code} $e");

      if (e.code == 'email-already-in-use') {
        rethrow;
      } else {
        rethrow;
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException ${e.code} $e");

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        log('Invalid email or password.');
        rethrow;
      } else {
        log('An error occurred: ${e.code}');
        rethrow;
      }
    }
    return null;
  }
}
