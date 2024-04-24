import 'package:code_de_la_route/data/data.dart';
import 'package:code_de_la_route/helpers/assets.dart';
import 'package:code_de_la_route/data/models/question.dart';
import 'package:code_de_la_route/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class QuestionImageWidget extends StatelessWidget {
  final Question question;
  final bool isCorrectAnswerVisible;
  final dynamic selectedAnswer;
  final Function(dynamic answer) onSelectAnswer;

  const QuestionImageWidget({
    super.key,
    required this.question,
    required this.isCorrectAnswerVisible,
    required this.onSelectAnswer,
    required this.selectedAnswer,
  });

  Color getButtonColor(index) {
    if (isCorrectAnswerVisible) {
      if (answers![index].isCorrect == true) return Colors.white;
    }
    if (selectedAnswer == answers![index]) return Colors.white;
    return Colors.black;
  }

  Color getButtonBgColor(index) {
    if (isCorrectAnswerVisible) {
      if (answers![index].isCorrect == true) {
        return Colors.green[500]!;
      }
      if (selectedAnswer == answers![index]) {
        return Colors.red[500]!;
      }
      return Colors.grey[700]!;
    }
    if (selectedAnswer == answers![index]) {
      return Colors.orange[500]!;
    }
    return Colors.white;
  }

  List<Answer>? get answers => question.answers;

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
              question.prompt,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blueGrey[800],
              ),
              child: Image.asset(
                getMediaPath(question.image!),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
              answers!.length,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ButtonWidget(
                          text: answers?[index].content ?? '',
                          textAlign: TextAlign.center,
                          color: getButtonColor(index),
                          backgroundColor: getButtonBgColor(index),
                          onPressed: () => onSelectAnswer(answers![index])),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  )),
        ),
      ],
    );
  }
}
