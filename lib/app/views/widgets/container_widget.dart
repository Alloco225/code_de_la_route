import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final double? borderRadius;
  final double? width;
  final bool? hasBorder;
  final EdgeInsets? padding;
  const ContainerWidget(
      {super.key,
      this.color,
      this.child,
      this.width,
      this.borderRadius,
      this.padding,
      this.hasBorder = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color ?? Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: !hasBorder!
              ? null
              : Border.all(
                  color: Colors.white,
                )),
      child: child,
    );
  }
}
