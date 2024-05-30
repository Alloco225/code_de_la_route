import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final String userId;

  FirestoreService(this.userId);

  Future<void> saveScore(String quizId, double score) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('quizzes')
        .doc(quizId)
        .set({
      'score': score,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<double?> getScore(String quizId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('quizzes')
        .doc(quizId)
        .get();
    if (doc.exists) {
      return doc['score'] as double?;
    }
    return null;
  }

  Future<Map<String, double>> getAllScores() async {
    Map<String, double> scoresMap = {};

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('quizzes')
        .get();

    for (var doc in querySnapshot.docs) {
      scoresMap[doc.id] = doc['score'] as double;
    }

    return scoresMap;
  }

  Future<double> calculateAverageScore() async {
    Map<String, double> scoresMap = await getAllScores();

    if (scoresMap.isEmpty) {
      return 0; // Return 0 if there are no scores
    }

    double totalSum =
        scoresMap.values.reduce((value, element) => value + element);
    int totalCount = scoresMap.length;

    return totalSum / totalCount;
  }

  Future<void> saveAverageScore(double averageScore) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({
      'averageScore': averageScore,
    });
  }

  Future<int> countFullMarksQuizzes() async {
    Map<String, double> scoresMap = await getAllScores();
    int maxScore = 20;
    int fullMarksCount = 0;
    for (var score in scoresMap.values) {
      if (score == maxScore) {
        fullMarksCount++;
      }
    }

    return fullMarksCount;
  }

  Future<Map<String, dynamic>> getUserData() async {
    DocumentSnapshot userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userData.data() as Map<String, dynamic>;
  }

  Future<void> calculateRankings() async {
    // Retrieve user data
    Map<String, dynamic> userData = await getUserData();

    // Calculate ranking score based on criteria (e.g., quiz scores)
    int rankingScore = calculateRankingScore(userData);

    // Update user document with ranking score
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'rankingScore': rankingScore,
    });
  }

  int calculateRankingScore(Map<String, dynamic> userData) {
    // Example: Calculate ranking score based on quiz scores
    int totalScore = userData['totalScore'] ?? 0;
    int numberOfQuizzes = userData['numberOfQuizzes'] ??
        1; // Default to 1 to avoid division by zero
    return totalScore ~/ numberOfQuizzes; // Use integer division for simplicity
  }



  // 
  Future<List<String>> getLearnedSigns() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();
    if (doc.exists) {
      return (doc['learned_signs'] as List<dynamic>).cast<String>();
    }
    return [];
  }

  Future<void> saveLearnedSigns(List<String> signs) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({
      'learned_signs': signs,
    });
  }

  Future<void> addLearnedSigns(List<String> newSigns) async {
    List<String> currentSigns = await getLearnedSigns();
    List<String> updatedSigns = List.from(currentSigns);

    for (String sign in newSigns) {
      if (!updatedSigns.contains(sign)) {
        updatedSigns.add(sign);
      }
    }

    await saveLearnedSigns(updatedSigns);
  }
}
