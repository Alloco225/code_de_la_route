import 'package:flutter/material.dart';

class FancyButtonWidget extends StatelessWidget {
  final String color;
  final String? title;
  final IconData? icon;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final int flex;

  const FancyButtonWidget({
    super.key,
    this.color = 'orange',
    this.title,
    this.icon,
    required this.onTap,
    this.onLongPress,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    final colorsMixer = {
      'orange': {
        'light': Colors.orange,
        'dark': Colors.orange.shade900,
      },
      'blue': {
        'light': Colors.blue,
        'dark': Colors.blue.shade900,
      },
      'green': {
        'light': Colors.green,
        'dark': Colors.green.shade900,
      },
      'red': {
        'light': Colors.red,
        'dark': Colors.red.shade900,
        // 'text': Colors.red.shade900,
      },
      'purple': {
        'light': Colors.purple,
        'dark': Colors.purple.shade900,
      },
      'yellow': {
        'light': Colors.yellow,
        'dark': Colors.yellow.shade900,
      },
      'pink': {
        'light': Colors.pink,
        'dark': Colors.pink.shade900,
      },
      'teal': {
        'light': Colors.teal,
        'dark': Colors.teal.shade900,
      },
      'cyan': {
        'light': Colors.cyan,
        'dark': Colors.cyan.shade900,
      },
      'indigo': {
        'light': Colors.indigo,
        'dark': Colors.indigo.shade900,
      },
      'lime': {
        'light': Colors.lime,
        'dark': Colors.lime.shade900,
      },
      'amber': {
        'light': Colors.amber,
        'dark': Colors.amber.shade900,
      },
      'brown': {
        'light': Colors.brown,
        'dark': Colors.brown.shade900,
      },
      'grey': {
        'light': Colors.grey,
        'dark': Colors.grey.shade900,
      },
      'blueGrey': {
        'light': Colors.blueGrey,
        'dark': Colors.blueGrey.shade900,
      },
      'deepOrange': {
        'light': Colors.deepOrange,
        'dark': Colors.deepOrange.shade900,
      },
      'deepPurple': {
        'light': Colors.deepPurple,
        'dark': Colors.deepPurple.shade900,
      },
      'lightBlue': {
        'light': Colors.lightBlue,
        'dark': Colors.lightBlue.shade900,
      },
      'lightGreen': {
        'light': Colors.lightGreen,
        'dark': Colors.lightGreen.shade900,
      },
    };

    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: colorsMixer[color]!['light'],
            border: Border.all(
              width: 3,
              color: colorsMixer[color]!['dark']!,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: colorsMixer[color]!['text'] ?? Colors.white,
                ),
              if (icon != null) const SizedBox(width: 10),
              Text(
                title!.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colorsMixer[color]!['text'] ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
