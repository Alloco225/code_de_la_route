import 'package:flutter/material.dart';

class QuizzPausedWidget extends StatelessWidget {
  final Function() onResume;
  final Function() onQuit;

  const QuizzPausedWidget(
      {super.key, required this.onResume, required this.onQuit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade500.withOpacity(.6),
      child: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'PAUSE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              const Icon(
                Icons.pause_circle_outline,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: onResume,
                    icon: const Icon(Icons.play_arrow, color: Colors.white),
                    label: const Text(
                      'Continuer',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: onQuit,
                    icon: const Icon(Icons.delete_outline, color: Colors.white),
                    label: const Text(
                      'Abandonner',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
