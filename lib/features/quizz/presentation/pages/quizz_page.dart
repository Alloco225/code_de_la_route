import 'package:flutter/material.dart';
import '../widgets/quizz_widget.dart';
import '../widgets/search_quizz_widget.dart';

class QuizzPage extends StatelessWidget {
  const QuizzPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          QuizzWidget(),
          SearchQuizzWidget(),
        ],
      ),
    );
  }
}
