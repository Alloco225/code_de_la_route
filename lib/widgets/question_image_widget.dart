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
      if (question.answers![index].isCorrect == true) {
        return Colors.green[500]!;
      } else {
        if (selectedAnswer == question.answers![index]) {
          return Colors.red[500]!;
        } else {
          return Colors.grey[600]!;
        }
      }
    } else {
      if (selectedAnswer == question.answers![index]) {
        return Colors.orange[500]!;
      } else {
        return Colors.grey[400]!;
      }
    }
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
                          color: Colors.white,
                          backgroundColor: getButtonColor(index),
                          onPressed: () =>
                              onSelectAnswer(question.answers![index])),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  )

              //  GestureDetector(
              //   onTap: ,
              //   child: Container(
              //     margin: const EdgeInsets.only(bottom: 10.0),
              //     padding: const EdgeInsets.all(8.0),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10.0),
              //       color: ,
              //     ),
              //     child: Text(

              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           color: Colors.grey.shade800, fontWeight: FontWeight.w600),
              //     ),
              //   ),
              // ),
              ),
        ),
      ],
    );
  }
}
