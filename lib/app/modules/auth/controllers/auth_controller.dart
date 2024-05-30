import 'dart:developer';

import 'package:codedelaroute/app/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../../quizz_list/controllers/quizz_list_controller.dart';
import '../mixins/cache_manager.dart';

class AuthController extends GetxController with CacheManager {
  final firebaseAuthService = FirebaseAuthService();
  final quizzListController = Get.find<QuizzListController>();
  final storage = GetStorage();

  final _isAuth = false.obs;

  bool get isAuth => _isAuth.value;
  final _authUser = (null as User?).obs;
  User? get authUser => _authUser.value;

  logUser({User? user, String? token}) async {
    _authUser.value = user;
    log("logUser !!! $user, $token");
    log("userInfo !!! ${user?.displayName}, ${user?.email}, ${user?.photoURL}");
    _isAuth.value = true;
    //Token is cached
    await saveToken(token);
  }

  updateUser(User? user) {
    if (user == null) {
      logOut();
    } else {
      _authUser.value = user;
      _isAuth.value = true;
    }
  }

  updateUserScore() async {
    if (authUser == null) {
      return;
    }

    for (var quizz in quizzListController.quizzList) {
      if (quizz.id != null) {
        var score = storage.read(quizz.id!);

        //
        // firebaseAuthService.updateQuizzScore(quizz.id!, score);
        break;
      }
    }
  }


final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> unlockAchievement(String userId, String achievementId) async {
  DocumentReference userDoc = _firestore.collection('users').doc(userId);
  await userDoc.update({
    'achievements.$achievementId': {
      'unlocked': true,
      'dateUnlocked': FieldValue.serverTimestamp(),
    }
  });
}

Future<void> checkAndUnlockAchievements(String userId, Map<String, dynamic> userProgress) async {
  // Fetch all achievements
  QuerySnapshot achievementsSnapshot = await _firestore.collection('achievements').get();
  for (var achievementDoc in achievementsSnapshot.docs) {
    Map<String, dynamic> achievement = achievementDoc.data() as Map<String, dynamic>;
    String achievementId = achievementDoc.id;
    Map<String, dynamic> conditions = achievement['conditions'];

    // Check if the user meets the conditions to unlock this achievement
    bool conditionsMet = conditions.entries.every((condition) {
      String key = condition.key;
      dynamic value = condition.value;
      return userProgress[key] >= value;
    });

    if (conditionsMet) {
      await unlockAchievement(userId, achievementId);
    }
  }
}


  void logOut() {
    _authUser.value = null;
    _isAuth.value = false;
    removeToken();
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      _isAuth.value = true;
    }
  }
}
