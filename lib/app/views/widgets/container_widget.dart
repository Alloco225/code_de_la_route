import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final double? borderRadius;
  final EdgeInsets? padding;
  const ContainerWidget({super.key, this.color, this.child, this.borderRadius, this.padding });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color ?? Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: Border.all(
            color: Colors.white,
          )),
      child: child,
    );
  }
}
