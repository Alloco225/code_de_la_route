import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quizz_detail_controller.dart';

class QuizzDetailView extends GetView<QuizzDetailController> {
  const QuizzDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizzDetailView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
          child: Text(
            'QuizzDetailView is working : ${controller.quizz?.id}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
