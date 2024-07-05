import 'dart:developer';

import 'package:codedelaroute/app/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../mixins/cache_manager.dart';

class AuthController extends GetxController with CacheManager {
  final firebaseAuthService = FirebaseAuthService();


  final storage = GetStorage();

  final _isAuth = false.obs;

  bool get isAuth => _isAuth.value;
  final _authUser = (null as User?).obs;
  User? get authUser => _authUser.value;
  String? get userId => authUser?.uid;

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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> unlockAchievement(String userId, String achievementId) async {
    log("Unlocking achievement $achievementId for user $userId");
    DocumentReference userDoc = _firestore.collection('users').doc(userId);
    await userDoc.update({
      'achievements.$achievementId': {
        'unlocked': true,
        'dateUnlocked': FieldValue.serverTimestamp(),
      }
    });
  }

  Future<bool> unlockAchievementByKey(String userId, String key) async {
    log("Unlocking achievement with key $key for user $userId");

    // Fetch the user's document
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(userId);
    DocumentSnapshot userSnapshot = await userDoc.get();

    // Check if the user's document exists
    if (!userSnapshot.exists) {
      return false;
    }

    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
    Map<String, dynamic> achievements = userData['achievements'] ?? {};

    // Find the achievement with the specified key and update it
    achievements.forEach((achievementId, achievementData) {
      if (achievementData['key'] == key) {
        achievements[achievementId] = {
          ...achievementData,
          'unlocked': true,
          'dateUnlocked': FieldValue.serverTimestamp(),
        };
      }
    });

    // Update the user's achievements in Firestore
    await userDoc.update({
      'achievements': achievements,
    });
    return true;
  }

  Future<void> checkAndUnlockAchievements(
      String userId, Map<String, dynamic> userProgress) async {
    // Fetch all achievements
    QuerySnapshot achievementsSnapshot =
        await _firestore.collection('achievements').get();

    for (var achievementDoc in achievementsSnapshot.docs) {
      Map<String, dynamic> achievement =
          achievementDoc.data() as Map<String, dynamic>;
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

  // Future<void> checkAndUnlockAchievements_(
  //     String userId, Map<String, dynamic> userProgress) async {
  //   // Fetch all achievements
  //   QuerySnapshot achievementsSnapshot =
  //       await FirebaseFirestore.instance.collection('achievements').get();

  //   // Fetch user's unlocked achievements
  //   DocumentSnapshot userDoc =
  //       await FirebaseFirestore.instance.collection('users').doc(userId).get();
  //   List<String> unlockedAchievements = [];
  //   if (userDoc.exists && userDoc.data()['achievements'] != null) {
  //     unlockedAchievements = List<String>.from(userDoc['unlockedAchievements']);
  //   }

  //   for (var achievementDoc in achievementsSnapshot.docs) {
  //     String achievementId = achievementDoc.id;

  //     // Skip if the achievement is already unlocked
  //     if (unlockedAchievements.contains(achievementId)) {
  //       continue;
  //     }

  //     Map<String, dynamic> achievement =
  //         achievementDoc.data() as Map<String, dynamic>;
  //     Map<String, dynamic> conditions = achievement['conditions'];

  //     // Check if the user meets the conditions to unlock this achievement
  //     bool conditionsMet = conditions.entries.every((condition) {
  //       String key = condition.key;
  //       dynamic value = condition.value;
  //       return userProgress[key] >= value;
  //     });

  //     if (conditionsMet) {
  //       await unlockAchievement(userId, achievementId);
  //     }
  //   }
  // }


  Future<void> logOut() async {
    try {
      _authUser.value = null;
      _isAuth.value = false;
      await removeToken();
      log('User signed out successfully.');
    } catch (e) {
      log('Error signing out: $e');
      rethrow;
    }
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      _isAuth.value = true;
    }
  }
}
