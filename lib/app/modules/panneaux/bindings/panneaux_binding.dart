import 'package:get/get.dart';

import '../controllers/panneaux_controller.dart';

class PanneauxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanneauxController>(
      () => PanneauxController(),
    );
  }
}
