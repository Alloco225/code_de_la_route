import 'package:flutter/material.dart';

class BottomSheetModalWidget extends StatelessWidget {
  final Widget child;
  final String? title;
  const BottomSheetModalWidget({
    super.key,
    required this.child,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * .2,
        maxHeight: MediaQuery.of(context).size.height * .4,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade700,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      title!.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                  ),
                Expanded(
                  child: child,
                )
              ]),
        ),
      ),
    );
  }
}
