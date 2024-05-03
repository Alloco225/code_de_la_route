import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  const CourseDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CourseDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CourseDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
