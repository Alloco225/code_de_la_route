import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaderboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchLeaderboard(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> leaderboard = snapshot.data!;
          return ListView.builder(
            itemCount: leaderboard.length,
            itemBuilder: (context, index) {
              var user = leaderboard[index];
              return ListTile(
                title: Text('Rank ${index + 1}: ${user['userId']}'),
                subtitle: Text('Total Score: ${user['totalScore']}'),
              );
            },
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchLeaderboard() async {
    QuerySnapshot scoreSnapshots =
        await FirebaseFirestore.instance.collection('scores').get();

    Map<String, int> userScores = {};

    scoreSnapshots.docs.forEach((doc) {
      String userId = (doc.data() as dynamic)['user_id'] as String;
      int score = (doc.data() as dynamic)['score_value'] as int;
      userScores[userId] = (userScores[userId] ?? 0) + score;
    });

    List<Map<String, dynamic>> leaderboard = userScores.entries
        .map((entry) => {'userId': entry.key, 'totalScore': entry.value})
        .toList();

    leaderboard.sort((a, b) => b['totalScore'].compareTo(a['totalScore']));

    return leaderboard;
  }
}
