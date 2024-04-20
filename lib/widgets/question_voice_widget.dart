import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuestionVoiceWidget extends StatefulWidget {
  final Map<String, dynamic> question;
  final bool showCorrectAnswer;

  const QuestionVoiceWidget(
      {super.key, required this.question, this.showCorrectAnswer = false});

  @override
  _QuestionVoiceWidgetState createState() => _QuestionVoiceWidgetState();
}

class _QuestionVoiceWidgetState extends State<QuestionVoiceWidget> {
  late String? answer;
  late bool isListening;
  late SpeechRecognition speechRecognition;

  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    answer = null;
    isListening = false;
    speechRecognition = SpeechRecognition();
    initSpeechRecognition();
  }

  void initSpeechRecognition() {
    speechRecognition.init(
        onStart: () {
          if (kDebugMode) {
            print('Record started');
          }
          setState(() {
            isListening = true;
          });
        },
        onResult: (List<dynamic> results) {
          print('Record ended');
          setState(() {
            isListening = false;
            answer = results[0][0]['transcript'];
          });
          if (answer != null) {
            print(
                'Correct answers: ${widget.question['correctAnswers']}, Answer: $answer');
            isCorrect = widget.question['correctAnswers']
                .contains(answer!.toLowerCase());
            // Emit answer event
            // You can define your custom event handling here
          }
        },
        onError: (String error) {
          print('Error: $error');
        },
        language: 'fr-FR');
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
              answer != null
                  ? Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isListening
                            ? Colors.blue[500]
                            : (isCorrect ? Colors.green[500] : Colors.red[500]),
                      ),
                      child: Text(
                        answer!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          FloatingActionButton(
            onPressed: () {
              if (!isListening) {
                speechRecognition.start();
              }
            },
            backgroundColor:
                isListening ? Colors.blue[500] : Colors.white.withOpacity(0.15),
            child: Icon(
              Icons.mic_outlined,
              color: isListening ? Colors.white : Colors.blue[500],
              size: 36.0,
            ),
          ),
        ],
      ),
    );
  }
}

class SpeechRecognition {
  late Function() onStart;
  late Function(List<dynamic>) onResult;
  late Function(String) onError;
  late String language;

  void init({
    required Function() onStart,
    required Function(List<dynamic>) onResult,
    required Function(String) onError,
    required String language,
  }) {
    this.onStart = onStart;
    this.onResult = onResult;
    this.onError = onError;
    this.language = language;
  }

  void start() {
    // Simulate speech recognition start
    // You can implement actual speech recognition logic here
    onStart();
    // Simulate speech recognition result
    List<dynamic> results = [
      [
        {'transcript': 'Sample answer'},
      ],
    ];
    onResult(results);
  }
}
