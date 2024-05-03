import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("Home onInit");
  }

  @override
  void onReady() {
    super.onReady();
    print("Home onReady");
  }

  @override
  void onClose() {
    super.onClose();
    print("Home onClose");
  }

  void increment() => count.value++;
}
