import 'package:cdlr/widgets/question_timer_widget.dart';
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Question 1/20",
                ),
              ],
            ),
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const QuestionTimerWidget(),
                  const Text(
                    "De quel signe s'agit-il ?",
                  ),
                  Container(
                    child: const Placeholder(),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ),

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
                      ),

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
                      ),

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
                      ),
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
