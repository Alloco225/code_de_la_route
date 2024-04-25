import 'package:flutter/material.dart';

class QuestionOrderWidget extends StatefulWidget {
  final Map<String, dynamic> question;
  final bool showCorrectAnswer;

  const QuestionOrderWidget(
      {super.key, required this.question, this.showCorrectAnswer = false});

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
    answers = widget.question['correctOrder'].split(SEPARATOR);
    orderElementCount = answers.length;
    shuffleArray(answers);
    setState(() {});
  }

  void shuffleArray(List<String?> array) {
    array.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question['question'],
                semanticsLabel: widget.question['question'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey[800],
                ),
                child: Image.network(
                  widget.question['image'],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0),
              // Display selected order
              Row(
                children: List.generate(
                  orderElementCount,
                  (index) => GestureDetector(
                    onTap: () {
                      toggleOrderElement(answers[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: selectedOrder.contains(answers[index])
                            ? Colors.blueGrey[200]
                            : Colors.blueGrey[600],
                      ),
                      child: Text(
                        answers[index] ?? '',
                        semanticsLabel: answers[index] ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              // Display correct answer if showCorrectAnswer is true and answer is incorrect
              if (widget.showCorrectAnswer &&
                  selectedOrder.join(SEPARATOR) !=
                      widget.question['correctOrder'])
                Row(
                  children: List.generate(
                    widget.question['correctOrder'].split(SEPARATOR).length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green[500],
                      ),
                      child: Text(
                        widget.question['correctOrder']
                                .split(SEPARATOR)[index] ??
                            '',
                       semanticsLabel: widget.question['correctOrder']
                                .split(SEPARATOR)[index] ??
                            '',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Display answer buttons if showCorrectAnswer is false
          if (!widget.showCorrectAnswer)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                orderElementCount,
                (index) => GestureDetector(
                  onTap: () {
                    toggleOrderElement(answers[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blueGrey[600],
                    ),
                    child: Text(
                      answers[index] ?? '',
                      semanticsLabel: answers[index] ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
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
      answer['isCorrect'] = content == widget.question['correctOrder'];
      // Emit answer event
      // You can define your custom event handling here
    } else {
      // Emit answer event
      // You can define your custom event handling here
    }

    setState(() {});
  }
}
