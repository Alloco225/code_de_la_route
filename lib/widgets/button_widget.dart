import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final TextAlign? textAlign;

  const ButtonWidget({
    super.key,
    required this.text,
    this.icon,
    this.textAlign = TextAlign.start,
    required this.color,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        backgroundColor: backgroundColor,
        foregroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon),
          if (icon != null) const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              semanticsLabel: text,

              textAlign: textAlign,
              softWrap: true,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
