import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingWidget extends StatelessWidget {
  double size;
  double padding;
  double strokeWidth;
  Color? color;
  LoadingWidget({
    super.key,
    this.size = 150,
    this.padding = 20,
    this.color,
    this.strokeWidth = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
              child: SizedBox(
            width: size + padding,
            height: size + padding,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              color: color ?? Colors.blueGrey.shade900,
            ),
          )),
          Center(
            child: Image.asset(
              'assets/images/favicon.png',
              width: size,
              height: size,
            ),
          )
        ],
      ),
    );
  }
}
