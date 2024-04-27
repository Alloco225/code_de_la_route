import 'package:code_de_la_route/data/data.dart';
import 'package:code_de_la_route/helpers/assets.dart';
import 'package:code_de_la_route/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionOrderWidget extends StatefulWidget {
  final Question question;
  final bool isCorrectAnswerVisible;
  final Function(dynamic answer) onSelectAnswer;
  final dynamic selectedAnswer;

  const QuestionOrderWidget({
    super.key,
    required this.question,
    required this.isCorrectAnswerVisible,
    required this.onSelectAnswer,
    required this.selectedAnswer,
  });

  @override
  _QuestionOrderWidgetState createState() => _QuestionOrderWidgetState();
}

class _QuestionOrderWidgetState extends State<QuestionOrderWidget> {
  late List<String?> answers;
  late int orderElementCount;
  late List<String> selectedOrder;
  final String SEPARATOR = ', ';

  @override
  void initState() {
    super.initState();
    answers = [];
    orderElementCount = 0;
    selectedOrder = [];
    initQuestion();
  }

  void initQuestion() {
    answers = widget.question.correctOrder?.split(SEPARATOR) as List<String>;
    print("answers $answers");
    orderElementCount = answers.length;
    shuffleArray(answers);
    setState(() {});
  }

  void shuffleArray(List<String?> array) {
    array.shuffle();
  }

  void toggleOrderElement(String? element) {
    if (element == null) return;

    if (selectedOrder.contains(element)) {
      selectedOrder.remove(element);
      answers[answers.indexOf(null)] = element;
    } else {
      answers[answers.indexOf(element)] = null;
      selectedOrder.add(element);
    }

    String content = selectedOrder.join(SEPARATOR);
    Map<String, dynamic> answer = {'content': content};

    if (selectedOrder.length == orderElementCount) {
      answer['isCorrect'] = content == widget.question.correctOrder;
      // Emit answer event
      // You can define your custom event handling here
    } else {
      // Emit answer event
      // You can define your custom event handling here
    }

    setState(() {});
  }

  Color getButtonColor(index) {
    // if (widget.isCorrectAnswerVisible) {
    //   if (answers![index].isCorrect == true) return Colors.white;
    // }
    // if (selectedAnswer == answers![index]) return Colors.white;
    return Colors.black;
  }

  Color getButtonBgColor(index) {
    // if (isCorrectAnswerVisible) {
    //   if (answers![index].isCorrect == true) {
    //     return Colors.green[500]!;
    //   }
    //   if (selectedAnswer == answers![index]) {
    //     return Colors.red[500]!;
    //   }
    //   return Colors.grey[700]!;
    // }
    // if (selectedAnswer == answers![index]) {
    //   return Colors.orange[500]!;
    // }
    return Colors.white;
  }

  // List<Answer>? get answers => widget.question.answers;

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
              semanticsLabel: widget.question.prompt,
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
                getMediaPath(widget.question.image!),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
        SizedBox(
          height: 80,
          child: Row(children: [
            for (var index = 0; index < answers.length; index++)
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      // child: Container(
                      //   color: Colors.blueGrey.shade700,
                      // ),
                      child: DragTarget<ButtonWidget>(
                        onWillAcceptWithDetails: (data) {
                          print("onWillAcceptWithDetails $data");
                          return true;
                        },
                        onAcceptWithDetails: (data) {
                          print("onAcceptWithDetails $data");
                        },
                        onLeave: (data) {
                          print("onLeave");
                        },
                        builder: (BuildContext context,
                            List<ButtonWidget?> candidateData,
                            List<dynamic> rejectedData) {
                          return Container(
                            color: Colors.blueGrey.shade700,
                          );
                        },
                      ),
                    ),
                    if (index < answers.length - 1)
                      const SizedBox(
                        width: 10,
                      )
                  ],
                ),
              ),
          ]),
        ),
        SizedBox(
          height: 80,
          child: Row(children: [
            for (var index = 0; index < answers.length; index++)
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Draggable<ButtonWidget>(
                        feedback: ButtonWidget(
                          onPressed: () {},
                          text: answers[index] ?? '',
                        ),
                        child: ButtonWidget(
                          onPressed: () {},
                          text: answers[index] ?? '',
                        ),
                      ),

                      //  Container(
                      //   color: Colors.blueGrey.shade700,
                      //   child: Text(answers[index] ?? ''),
                      // ),
                    ),
                    if (index < answers.length - 1)
                      const SizedBox(
                        width: 10,
                      )
                  ],
                ),
              ),
          ]),
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: List.generate(
        //       answers.length,
        //       (index) => Column(
        //             crossAxisAlignment: CrossAxisAlignment.stretch,
        //             children: [
        //               ButtonWidget(
        //                   // text: answers![index].content ?? '',
        //                   text: "Button",
        //                   textAlign: TextAlign.center,
        //                   color: getButtonColor(index),
        //                   backgroundColor: getButtonBgColor(index),
        //                   onPressed: () =>
        //                       widget.onSelectAnswer(answers[index])),
        //               const SizedBox(
        //                 height: 5,
        //               ),
        //             ],
        //           )),
        // ),
      ],
    );
  }
}
