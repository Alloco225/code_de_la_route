import 'package:flutter/material.dart';

class AIconChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  AIconChip({
    required this.label,
    required this.icon,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color ?? Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(10),
              child: Icon(
                icon,
                color: (color != null && color != Colors.white)
                    ? Colors.white
                    : null,
              ),
            ),
            SizedBox(height: 5),
            Text("$label"),
          ],
        ),
      ),
    );
  }
}
