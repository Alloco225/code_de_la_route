import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuizzesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzes List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('quizzes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<QueryDocumentSnapshot> quizDocuments = snapshot.data!.docs;
          return ListView.builder(
            itemCount: quizDocuments.length,
            itemBuilder: (context, index) {
              dynamic quizData = quizDocuments[index].data();
              String quizId = quizDocuments[index].id;
              String quizTitle = quizData['title'];
              bool userLoggedIn = FirebaseAuth.instance.currentUser != null;

              return ListTile(
                title: Text(quizTitle),
                subtitle: userLoggedIn
                    ? FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('scores')
                            .doc(quizId)
                            .collection('user_scores')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text('Loading...');
                          }
                          if (snapshot.hasData &&
                              snapshot.data!.exists &&
                              (snapshot.data! as Map).containsKey('score')
                              ) {
                            return Text(
                                'Your score: ${snapshot.data!['score']}');
                          } else {
                            return Text('Not attempted');
                          }
                        },
                      )
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
