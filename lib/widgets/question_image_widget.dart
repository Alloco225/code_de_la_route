import 'package:cdlr/helpers/assets.dart';
import 'package:cdlr/models/question.dart';
import 'package:flutter/material.dart';

class QuestionImageWidget extends StatefulWidget {
  final Question question;
  final bool showCorrectAnswer;

  const QuestionImageWidget(
      {super.key, required this.question, this.showCorrectAnswer = false});

  @override
  _QuestionImageWidgetState createState() => _QuestionImageWidgetState();
}

class _QuestionImageWidgetState extends State<QuestionImageWidget> {
  dynamic selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.question.prompt,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blueGrey[800],
              ),
              child: Image.asset(
                getMediaPath(widget.question.image!),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            widget.question.answers!.length,
            (index) => GestureDetector(
              onTap: () {
                toggleSelectAnswer(widget.question.answers![index]);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: widget.showCorrectAnswer
                      ? (widget.question.answers![index].isCorrect == true
                          ? Colors.green[500]
                          : (selectedAnswer == widget.question.answers![index]
                              ? Colors.red[500]
                              : Colors.grey[600]))
                      : (selectedAnswer == widget.question.answers![index]
                          ? Colors.orange[500]
                          : Colors.grey[400]),
                ),
                child: Text(
                  widget.question.answers?[index].content ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade800, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void toggleSelectAnswer(dynamic answer) {
    if (widget.showCorrectAnswer) return;
    setState(() {
      selectedAnswer = answer;
    });
    if (selectedAnswer == answer) {
      // Emit submit answer event
      // You can define your custom event handling here
      print('Submit answer');
    } else {
      // Emit answer event
      // You can define your custom event handling here
      print('Answer');
    }
  }
}
