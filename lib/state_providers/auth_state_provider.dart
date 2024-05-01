import 'dart:async';

import 'package:code_de_la_route/helpers/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

const cooldownTimeBetweenAnswers = 2000; // in miliseconds

class AuthStateProvider extends ChangeNotifier {
  _n() {
    notifyListeners();
  }


  authenticate() async {
    // Disable persistence on web platforms. Must be called on initialization:
    final auth = FirebaseAuth.instanceFor(
        app: Firebase.app(), persistence: Persistence.NONE);
// To change it after initialization, use `setPersistence()`:
    await auth.setPersistence(Persistence.LOCAL);
  }
}
