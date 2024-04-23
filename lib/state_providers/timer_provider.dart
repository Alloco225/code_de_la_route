// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TimerProvider extends ChangeNotifier {
//   Timer? _timer;
//   int _seconds = 0;
//   int _time = 0;
//   final int START_TIME = 10; // seconds


//   int get seconds => _seconds;
//   int get time => _time;

  
//   void startTimer() {
//     _time = START_TIME;
//     // timer?.cancel();
//     _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
//       if (widget.pause || forcePause) return;
//       setState(() {
//         time -= 0.1;
//       });
//       if (time < 0.2) {
//         widget.onTimeExpired();
//         timer.cancel();
//         // Emit time expired event
//         // You can define your custom event handling here
//       }
//     });
//   }

//   void stopTimer() {
//     _timer?.cancel();
//   }
// }
