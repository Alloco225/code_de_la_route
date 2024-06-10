import 'package:flutter/material.dart';

class FancyButtonWidget extends StatelessWidget {
  final String color;
  final String title;
  final VoidCallback onTap;
  final int flex;
  const FancyButtonWidget({
    super.key,
    this.color = 'orange',
    required this.title,
    required this.onTap,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    final colorsMixer = {
      'orange': {
        'light': Colors.orange.shade400,
        'dark': Colors.orange.shade700,
      },
      'blue': {
        'light': Colors.blue.shade400,
        'dark': Colors.blue.shade700,
      },
      'green': {
        'light': Colors.green.shade400,
        'dark': Colors.green.shade700,
      },
      'red': {
        'light': Colors.red.shade400,
        'dark': Colors.red.shade700,
      },
      'purple': {
        'light': Colors.purple.shade400,
        'dark': Colors.purple.shade700,
      },
      'yellow': {
        'light': Colors.yellow.shade400,
        'dark': Colors.yellow.shade700,
      },
      'pink': {
        'light': Colors.pink.shade400,
        'dark': Colors.pink.shade700,
      },
      'teal': {
        'light': Colors.teal.shade400,
        'dark': Colors.teal.shade700,
      },
      'cyan': {
        'light': Colors.cyan.shade400,
        'dark': Colors.cyan.shade700,
      },
      'indigo': {
        'light': Colors.indigo.shade400,
        'dark': Colors.indigo.shade700,
      },
      'lime': {
        'light': Colors.lime.shade400,
        'dark': Colors.lime.shade700,
      },
      'amber': {
        'light': Colors.amber.shade400,
        'dark': Colors.amber.shade700,
      },
      'brown': {
        'light': Colors.brown.shade400,
        'dark': Colors.brown.shade700,
      },
      'grey': {
        'light': Colors.grey.shade400,
        'dark': Colors.grey.shade700,
      },
      'blueGrey': {
        'light': Colors.blueGrey.shade400,
        'dark': Colors.blueGrey.shade700,
      },
      'deepOrange': {
        'light': Colors.deepOrange.shade400,
        'dark': Colors.deepOrange.shade700,
      },
      'deepPurple': {
        'light': Colors.deepPurple.shade400,
        'dark': Colors.deepPurple.shade700,
      },
      'lightBlue': {
        'light': Colors.lightBlue.shade400,
        'dark': Colors.lightBlue.shade700,
      },
      'lightGreen': {
        'light': Colors.lightGreen.shade400,
        'dark': Colors.lightGreen.shade700,
      },
      'orangeAccent': {
        'light': Colors.orangeAccent.shade400,
        'dark': Colors.orangeAccent.shade700,
      },
      'pinkAccent': {
        'light': Colors.pinkAccent.shade400,
        'dark': Colors.pinkAccent.shade700,
      },
      'purpleAccent': {
        'light': Colors.purpleAccent.shade400,
        'dark': Colors.purpleAccent.shade700,
      },
    };
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorsMixer[color]!['light'],
            border: Border.all(
              width: 3,
              color: colorsMixer[color]!['dark']!,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
