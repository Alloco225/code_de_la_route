import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuizScoresWidget extends StatelessWidget {
  final String quizId;

  const QuizScoresWidget(this.quizId, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchQuizScores(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print("Error: ${snapshot.error}");
          return const Text("error");
        } else {
          List<Map<String, dynamic>> quizScores = snapshot.data!;
          if (quizScores.isEmpty) return const Text("pas encore noté");

          double completionPercentage =
              quizScores.fold(0, (acc, curr) => acc + (curr['score'] as int)) /
                  quizScores.length;
          var score = quizScores[0]['score'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (score != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Note moyenne:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${score ?? ''}/20",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              if (score == null) ...[
                const Text(
                  "Pas encore noté",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(2),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: completionPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange,
                      ),
                      height: 8,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchQuizScores() async {
    QuerySnapshot scoreSnapshots = await FirebaseFirestore.instance
        .collection('scores')
        .where('quizz_id', isEqualTo: quizId)
        .get();

    List<Map<String, dynamic>> quizScores = scoreSnapshots.docs
        .map((doc) => {
              'userId': (doc.data() as dynamic)['user_id'],
              'scoreValue': (doc.data() as dynamic)['score_value'],
            })
        .toList();

    return quizScores;
  }
}
