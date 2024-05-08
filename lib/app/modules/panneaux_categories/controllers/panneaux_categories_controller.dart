import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:get/get.dart';

class PanneauxCategoriesController extends GetxController {
  final _categories = [
    SignCategory(
      id: "OBLIGATION",
      name: "OBLIGATION",
      image: "assets/images/signalisation/585f9250cb11b227491c357d.png",
    ),
    SignCategory(
      id: "DANGER",
      name: "DANGER",
      image: "assets/images/signalisation/585f900ecb11b227491c356e.png",
    ),
    SignCategory(
      id: "INTERDICTION",
      name: "INTERDICTION",
      image: "assets/images/signalisation/585f900ecb11b227491c356e.png",
    ),
    SignCategory(
      id: "INDICATION",
      name: "INDICATION",
      image: "assets/images/signalisation/585f900ecb11b227491c356e.png",
    ),
    SignCategory(
      id: "PARKING",
      name: "PARKING",
      image: "assets/images/signalisation/585f900ecb11b227491c356e.png",
    ),
    SignCategory(
      id: "TEMPORAIRE",
      name: "TEMPORAIRE",
      image: "assets/images/signalisation/585f900ecb11b227491c356e.png",
    ),
  ].obs;

  List<SignCategory> get categories => _categories.value;
}
