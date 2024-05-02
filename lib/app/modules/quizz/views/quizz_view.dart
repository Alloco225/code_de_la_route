import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/quizz_controller.dart';

class QuizzView extends GetView<QuizzController> {
  const QuizzView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizzView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuizzView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
