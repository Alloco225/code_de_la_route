import 'package:flutter/material.dart';

class AIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double size;
  final double padding;
  final double radius;
  final bool animated;

  AIcon({
    required this.icon,
    required this.color,
    this.size = 30,
    this.padding = 10,
    this.radius = 10,
    this.animated = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: color,
        // [700]
        size: size,
      ),
    );
  }
}
