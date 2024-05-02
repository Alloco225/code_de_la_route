import 'package:flutter/material.dart';

import 'package:get/get.dart';

class QuizzPausedView extends GetView {
  const QuizzPausedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizzPausedView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuizzPausedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
