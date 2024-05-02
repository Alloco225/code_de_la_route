import 'package:flutter/material.dart';

import 'package:get/get.dart';

class QuizzDetailView extends GetView {
  const QuizzDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizzDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuizzDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
