import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../helpers/utils.dart';

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

 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3.0),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          // border: Border(
          //     bottom: BorderSide(
          //         // color: Colors.white,
          //         ))
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                Ionicons.pause_outline,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 10),
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
                          color: percentageColor(widget.percentage),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: widget.devPauseTimer,
            child: Text(
              widget.time.toStringAsFixed(0),
              semanticsLabel: widget.time.toStringAsFixed(0),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
