// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import 'package:get/get.dart';

// import "package:sliver_tools/sliver_tools.dart";
// import '../controllers/quizz_levels_controller.dart';

// class QuizzLevelsView extends GetView<QuizzLevelsController> {
//   QuizzLevelsView({super.key});

//   final quizzList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey.shade800,
//         // title: const Text(
//         //   'QuizzLevelsView',
//         //   style: TextStyle(color: Colors.white),
//         // ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Scrollbar(
//           child: CustomScrollView(
//             slivers: [
//               MultiSliver(
//                 children: [
//                   // CupertinoSliverRefreshControl(
//                   //   // onRefresh: () => model.load(),
//                   // ),
//                   NewsSection(
//                     model: model.topStories,
//                     infinite: false,
//                   ),
//                   NewsSection(
//                     model: model.newStories,
//                     infinite: true,
//                   ),
//                   SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   SizedBox buildQuizzContainer() {
//     return SizedBox(
//         height: 100,
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.white)),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.horizontal(left: Radius.circular(8)),
//                 child: Container(
//                   color: Colors.white,
//                   child: Image.asset(
//                       'assets/images/signalisation/585f8f29cb11b227491c3555.png'),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Quizz 1",
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.w800),
//                       ),
//                       const Text(
//                         "Note moyenne: 15/20",
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.w800),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: FractionallySizedBox(
//                             widthFactor: .5,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: Colors.blue,
//                               ),
//                               height: 4,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
