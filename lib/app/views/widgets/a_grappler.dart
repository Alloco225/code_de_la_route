import 'package:flutter/material.dart';

class AGrappler extends StatelessWidget {
  final double marginTop;
  final double marginBottom;
  const AGrappler({
    super.key,
    this.marginTop = 10,
    this.marginBottom = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
          width: 50,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(12.0))),
        ),
      ],
    );
  }
}
