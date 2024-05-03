import 'package:flutter/material.dart';

class InfoModal extends StatelessWidget {
  const InfoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: const Text("Info Modal"),
      ),
    );
  }
}
