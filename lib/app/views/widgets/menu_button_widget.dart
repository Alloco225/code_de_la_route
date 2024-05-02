import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final TextAlign? textAlign;

  const MenuButtonWidget({
    super.key,
    required this.text,
    this.icon,
    this.textAlign = TextAlign.start,
    this.color,
    this.backgroundColor = Colors.transparent,
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
          side: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(0),
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
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
