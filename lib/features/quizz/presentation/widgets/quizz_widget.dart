import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/errors/failure.dart';
import 'quizz_image_widget.dart';
import '../../business/entities/quizz_entity.dart';
import '../providers/quizz_provider.dart';

class QuizzWidget extends StatelessWidget {
  const QuizzWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizzEntity? quizz = Provider.of<QuizzProvider>(context).quizz;
    Failure? failure = Provider.of<QuizzProvider>(context).failure;
    late Widget widget;
    if (quizz != null) {
      widget = QuizzImageWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 20, right: 20, top: 10),
                child: SingleChildScrollView(
                  child: FittedBox(
                    child: Text(
                      "Hello",
                      // '#${quizz.id} ${quizz.name.toUpperCase()}',
                      style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.black45,
                          ),
                        ],
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.all(10),
            //   width: double.infinity,
            //   padding: const EdgeInsets.symmetric(horizontal: 5),
            //   child: Wrap(
            //     alignment: WrapAlignment.center,
            //     spacing: 5,
            //     runSpacing: 5,
            //     children: List.generate(
            //       quizz.types.length,
            //       (index) => Chip(
            //         backgroundColor: Colors.white,
            //         label: Text(
            //           quizz.types.elementAt(index).type.name.toUpperCase(),
            //           style: const TextStyle(fontSize: 20),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    } else if (failure != null) {
      widget = Expanded(
        child: Center(
          child: Text(
            failure.errorMessage,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
      widget = const Expanded(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.orangeAccent,
          ),
        ),
      );
    }
    return widget;
  }
}
