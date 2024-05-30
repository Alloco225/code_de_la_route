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
}
