import 'package:get/get.dart';

import '../controllers/course_list_controller.dart';

class CourseListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseListController>(
      () => CourseListController(),
    );
  }
}
