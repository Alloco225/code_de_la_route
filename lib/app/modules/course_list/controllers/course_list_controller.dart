import 'package:code_de_la_route/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CourseListController extends GetxController {
  //TODO: Implement CourseListController

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }


  gotoCourseDetail(courseId) {
    Get.toNamed(Routes.COURSE_DETAIL);
  }
}
