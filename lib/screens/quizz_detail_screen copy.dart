// import 'package:cdlr/db/db.dart';
// import 'package:cdlr/helpers/assets.dart';
// import 'package:cdlr/models/question.dart';
// import 'package:cdlr/models/quizz.dart';
// import 'package:cdlr/models/quizz_category.dart';
// import 'package:cdlr/widgets/question_image_widget.dart';
// import 'package:cdlr/widgets/question_timer_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../routes.dart';

// class QuizzDetailScreen extends StatefulWidget {
//   const QuizzDetailScreen({super.key});

//   @override
//   State<QuizzDetailScreen> createState() => _QuizzDetailScreenState();
// }

// class _QuizzDetailScreenState extends State<QuizzDetailScreen> {
//   late Quizz quizz;
//   late String categoryId;
//   late int quizzId;
//   int currentQuestionIndex = 0;
//   bool showCorrectAnswer = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     //

//     initPage();
//   }

//   initPage() {
//     Map? params = ModalRoute.of(context)?.settings.arguments as Map?;

//     categoryId = params?['categoryId'];
//     quizzId = params?['quizzId'];

//     setState(() {
//       quizz = QUIZZES
//           .firstWhere((el) => el.categoryId == categoryId && el.id == quizzId);
//     });
//   }

//   startQuizz() {
//     currentQuestionIndex = 0;

//     setState(() {});
//   }

//   List<Question> get questions => quizz.questions;
//   Question get currentQuestion => questions[currentQuestionIndex];

//   Widget get getQuestionWidget {
//     if (currentQuestion.type == "image") {
//       return QuestionImageWidget(
//           question: currentQuestion, showCorrectAnswer: showCorrectAnswer);
//     }
//     return Container();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             //
//             const SizedBox(
//               height: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Question ${currentQuestionIndex + 1}/${questions.length}",
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Column(
//                 children: [
//                   const QuestionTimerWidget(),
//                   Expanded(child: getQuestionWidget),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
