import 'package:cdlr/helpers/assets.dart';
import 'package:cdlr/data/models/question.dart';
import 'package:cdlr/widgets/button_widget.dart';
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
      if (question.answers![index].isCorrect != true &&
          selectedAnswer != question.answers![index]) {
        return Colors.black;
      }
    }
    if (selectedAnswer != question.answers![index]) {
      return Colors.black;
    }
    return Colors.white;
  }

  Color getButtonBgColor(index) {
    if (isCorrectAnswerVisible) {
      if (question.answers![index].isCorrect == true) {
        return Colors.green[500]!;
      }
      if (selectedAnswer == question.answers![index]) {
        return Colors.red[500]!;
      }
      return Colors.grey[700]!;
    }
    if (selectedAnswer == question.answers![index]) {
      return Colors.orange[500]!;
    }
    return Colors.white;
  }

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
              question.answers!.length,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ButtonWidget(
                          text: question.answers?[index].content ?? '',
                          textAlign: TextAlign.center,
                          color: getButtonColor(index),
                          backgroundColor: getButtonBgColor(index),
                          onPressed: () =>
                              onSelectAnswer(question.answers![index])),
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
