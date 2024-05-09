import 'package:flutter/material.dart';

class BorderButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final TextAlign? textAlign;

  const BorderButtonWidget({
    super.key,
    required this.text,
    this.icon,
    this.textAlign = TextAlign.start,
    this.color,
    this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) Icon(icon),
              if (icon != null) const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text.toUpperCase(),
                  semanticsLabel: text,
                  textAlign: textAlign,
                  softWrap: true,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ));
  }
}
