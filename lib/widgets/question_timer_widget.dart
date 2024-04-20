import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionTimerWidget extends StatefulWidget {
  final bool pause;
  final int? countDownTime;

  const QuestionTimerWidget(
      {super.key, this.pause = false, this.countDownTime});

  @override
  _QuestionTimerWidgetState createState() => _QuestionTimerWidgetState();
}

class _QuestionTimerWidgetState extends State<QuestionTimerWidget> {
  late bool forcePause;
  final int START_TIME = 10; // seconds
  late double time; // seconds
  late Timer? timer;

  final double _progressBarHeight = 13;

  @override
  void initState() {
    super.initState();
    forcePause = false;
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    time = remainingTime;
    // timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (widget.pause || forcePause) return;
      setState(() {
        time -= 0.1;
      });
      if (time < 0.2) {
        timer.cancel();
        // Emit time expired event
        // You can define your custom event handling here
      }
    });
  }

  double get percentage => ((time * 100) / (remainingTime ?? 1)) / 100;

  Color get percentageColor {
    if (percentage <= .3) return Colors.red[500]!;
    if (percentage <= .5) return Colors.orange[800]!;
    if (percentage <= .8) return Colors.yellow[800]!;
    return Colors.blue[500]!;
  }

  double get remainingTime =>
      widget.countDownTime?.toDouble() ?? START_TIME.toDouble();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Emit pause game event
              // You can define your custom event handling here
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.grey[200],
              ),
              child: const Icon(
                Icons.pause,
                size: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.6,
              height: _progressBarHeight,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: percentage > .03
                  ? FractionallySizedBox(
                      widthFactor: percentage,
                      alignment: AlignmentDirectional.centerStart,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: percentageColor,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                forcePause = !forcePause;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                time.toStringAsFixed(0),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
