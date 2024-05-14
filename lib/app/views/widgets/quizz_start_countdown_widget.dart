// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';

class QuizzStartCountdownWidget extends StatefulWidget {
  final Function() onStartQuizz;

  const QuizzStartCountdownWidget({super.key, required this.onStartQuizz});

  @override
  _QuizzStartCountdownWidgetState createState() =>
      _QuizzStartCountdownWidgetState();
}

class _QuizzStartCountdownWidgetState extends State<QuizzStartCountdownWidget> {
  int time = 2;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: time > 0 ? 1.0 : 0.0,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.blue[700]!.withOpacity(0.8),
              borderRadius: BorderRadius.circular(80),
            ),
            child: Center(
              child: Text(
                '$time',
                semanticsLabel: '$time',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        time--;
        if (time <= 0) {
          widget.onStartQuizz();
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
