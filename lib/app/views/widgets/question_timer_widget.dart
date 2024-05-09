import 'package:flutter/material.dart';

class QuestionTimerWidget extends StatefulWidget {
  final bool pause;
  final double percentage;
  final double time;
  final int? countDownTime;
  final Function() onTogglePause;
  final Function()? devPauseTimer;
  final Function() onTimeExpired;
  final Function() onInit;
  final Function() onDispose;

  const QuestionTimerWidget({
    super.key,
    this.pause = false,
    this.countDownTime,
    required this.percentage,
    required this.time,
    required this.onTogglePause,
    this.devPauseTimer,
    required this.onTimeExpired,
    required this.onInit,
    required this.onDispose,
  });

  @override
  _QuestionTimerWidgetState createState() => _QuestionTimerWidgetState();
}

class _QuestionTimerWidgetState extends State<QuestionTimerWidget> {
  final double _progressBarHeight = 13;

  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  void dispose() {
    widget.onDispose();
    super.dispose();
  }

  Color get percentageColor {
    if (widget.percentage <= .3) return Colors.red[500]!;
    if (widget.percentage <= .5) return Colors.orange[800]!;
    if (widget.percentage <= .8) return Colors.yellow[800]!;
    return Colors.blue[500]!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.onTogglePause,
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
              child: widget.percentage > .03
                  ? FractionallySizedBox(
                      widthFactor: widget.percentage,
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
            onTap: widget.devPauseTimer,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                widget.time.toStringAsFixed(0),
                semanticsLabel: widget.time.toStringAsFixed(0),
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
