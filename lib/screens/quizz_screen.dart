import 'package:flutter/material.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({super.key});

  @override
  State<QuizzScreen> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: const Icon(Icons.arrow_back),
                ),
                const Text("Question 1/20"),
                Container(
                  child: const Icon(Icons.bookmark),
                ),
              ],
            ),
            Expanded(
                child: Container(
              child: const Column(
                children: [
                  Text("De quel signe s'agit-il ?"),
                  Placeholder(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Answers
                      Card(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Answer 1",
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
