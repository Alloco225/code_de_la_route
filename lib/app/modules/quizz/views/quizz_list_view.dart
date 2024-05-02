import 'package:flutter/material.dart';

import 'package:get/get.dart';

class QuizzListView extends GetView {
  const QuizzListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizzListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuizzListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
