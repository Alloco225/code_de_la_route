import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/quizz_list_controller.dart';

class QuizzListView extends GetView<QuizzListController> {
  const QuizzListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizzListView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Appbar
          const Row(
            children: [],
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.quizzes.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // onTap: () => gotoQuizz(controller.quizzes[i].id
                    // ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.white)),
                    tileColor: Colors.grey.withOpacity(.2),
                    leading: controller.quizzes[i].icon != null
                        ? Icon(controller.quizzes[i].icon)
                        : null,
                    title: Text(
                      controller.quizzes[i].level ?? 'Quizz $i',
                      semanticsLabel: controller.quizzes[i].level ?? 'Quizz $i',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
