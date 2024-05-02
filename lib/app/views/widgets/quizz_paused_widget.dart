import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'button_widget.dart';

class QuizzPausedWidget extends StatelessWidget {
  final Function() onResume;
  final Function() onQuit;

  const QuizzPausedWidget(
      {super.key, required this.onResume, required this.onQuit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                // color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'PAUSE',
                  semanticsLabel: 'PAUSE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                IconButton(
                  onPressed: onResume,
                  icon: const Icon(
                    Icons.pause_circle_outline,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                        text: 'Continuer',
                        icon: Ionicons.play_outline,
                        color: Colors.white,
                        backgroundColor: Colors.blue,
                        onPressed: onResume),
                    const SizedBox(width: 20),
                    ButtonWidget(
                        text: 'Abandonner',
                        icon: Ionicons.trash_outline,
                        color: Colors.white,
                        backgroundColor: Colors.red,
                        onPressed: onQuit),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
