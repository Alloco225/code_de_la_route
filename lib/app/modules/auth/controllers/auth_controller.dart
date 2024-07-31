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

  Future<Map?> unlockAchievementByKey(String userId, String key) async {
    log("Unlocking achievement with key $key for user $userId");

    // Fetch the user's document
    DocumentReference userDoc = _firestore.collection('users').doc(userId);
    DocumentSnapshot userSnapshot = await userDoc.get();

    // Check if the user's document exists
    if (!userSnapshot.exists) {
      log("user snapshot not found");
      return null;
    }

    Map? achievement = await getAchievementByKey(key);
    log("achievement $achievement");
    if (achievement == null) return null;

    Map userData = userSnapshot.data() as Map;
    log("User $userData");
    if (userData.containsKey('achievements')) {
      log("user achievments");
      Map<String, dynamic> achievements = userData['achievements'];
      log("user achievments list $achievements");

      // Check if the achievement with the specific key is unlocked
      bool alreadyUnlocked = achievements.containsKey(achievement['id']) &&
          achievements[achievement['id']]['unlocked'] == true;

      if (alreadyUnlocked) {
        log("Achievement already unlocked");
        return null;
      }
    }

    await userDoc.update({
      "achievements.${achievement['id']}": {
        'unlocked': true,
        'dateUnlocked': FieldValue.serverTimestamp(),
      }
    });

    return achievement;
  }

  Future<List<Map>> checkAndUnlockAchievements(
      String userId, double userAverageScore) async {
    // Fetch all achievements
    QuerySnapshot achievementsSnapshot =
        await _firestore.collection('achievements').get();
    List<Map> unlockedAchievements = [];

    for (var achievementDoc in achievementsSnapshot.docs) {
      Map<String, dynamic> achievement =
          achievementDoc.data() as Map<String, dynamic>;

      String achievementId = achievementDoc.id;
      String achievementKey = achievement['key'];

      int? requiredProgress =
          achievement['conditions']['completedQuizzPercentage'];
      //
      if (requiredProgress == null) {
        continue;
      }
      if (userAverageScore >= requiredProgress) {
        // await unlockAchievement(userId, achievementId);
        Map? unlockedAchievement =
            await unlockAchievementByKey(userId, achievementKey);
        if (unlockedAchievement != null) {
          unlockedAchievements.add(unlockedAchievement);
        }
      }
    }

    return unlockedAchievements;
  }

  Future<Map<String, dynamic>?> getAchievementByKey(String key) async {
    log("getAchievementByKey $key");
    try {
      CollectionReference achievements =
          FirebaseFirestore.instance.collection('achievements');
      QuerySnapshot querySnapshot =
          await achievements.where('key', isEqualTo: key).get();

      if (querySnapshot.docs.isEmpty) {
        return null; // No achievement found with the provided key
      }

      // Assuming key is unique, so we take the first result
      DocumentSnapshot achievementDoc = querySnapshot.docs.first;
      Map<String, dynamic> achievementData =
          achievementDoc.data() as Map<String, dynamic>;
      achievementData['id'] = achievementDoc.id;

      return achievementData;
    } catch (e) {
      log('Error getting achievement by key: $e');
      return null;
    }
  }

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

  Future<void> deleteUserAccount() async {
    log("logout user");
    try {
      if (authUser != null) {
        await authUser!.delete();
        log('User account deleted successfully.');
      } else {
        log('No user is currently signed in.');
      }
    } catch (e) {
      log('Error deleting user account: $e');
    }
  }

  Future<void> deleteUserAccountData() async {
    try {
      // Delete the user document from Firestore
      DocumentReference userDoc = _firestore.collection('users').doc(userId);


    // Reference to the quizzes subcollection
      CollectionReference quizzesCollection = userDoc.collection('quizzes');

      // Fetch all documents in the quizzes subcollection
      QuerySnapshot quizzesSnapshot = await quizzesCollection.get();

      // Delete each document in the quizzes subcollection
      for (DocumentSnapshot quizDoc in quizzesSnapshot.docs) {
        await quizDoc.reference.delete();
      }
      await userDoc.delete();

      storage.erase();

      log('User account data deleted successfully.');
    } catch (e) {
      log('Error deleting user account data: $e');
    }
  }
}
