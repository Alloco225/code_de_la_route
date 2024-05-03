import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/course_list_controller.dart';

class CourseListView extends GetView<CourseListController> {
  const CourseListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CourseListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CourseListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
