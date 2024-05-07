import 'package:get/get.dart';

import '../controllers/panneaux_categories_controller.dart';

class PanneauxCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanneauxCategoriesController>(
      () => PanneauxCategoriesController(),
    );
  }
}
