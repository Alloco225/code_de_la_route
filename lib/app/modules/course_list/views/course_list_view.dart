import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/course_list_controller.dart';

class CourseListView extends GetView<CourseListController> {
  const CourseListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CourseListView'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (ctx, i) => ListTile(
          onTap: () => controller.gotoCourseDetail(i),
          title: const Text("Cours n°1"),
          leading: const Icon(Icons.directions),
        ),
        separatorBuilder: (ctx, i) => const Divider(),
      ),
    );
  }
}
