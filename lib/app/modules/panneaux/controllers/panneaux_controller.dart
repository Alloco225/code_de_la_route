import 'package:codedelaroute/app/modules/quizz/sign_model.dart';
import 'package:get/get.dart';

class PanneauxController extends GetxController {
  //TODO: Implement PanneauxController
  final _categoryId = (null as String?).obs;
  final _categoryName = (null as String?).obs;
  final _quizzId = (null as int?).obs;
  final _isLoading = false.obs;

  get categoryId => _categoryId.value;
  get categoryName => _categoryName.value;
  get quizzId => _quizzId.value;

  final _signs = <Sign>[].obs;

  List<Sign> get signs => _signs.value;

  @override
  void onInit() {
    super.onInit();
    print("Panneaux onInit");

    var routeParams = Get.arguments as Map?;

    print("Panneaux params $routeParams");

    _categoryId.value = routeParams?['categoryId'];
    _categoryName.value = routeParams?['categoryName'];

    // _selectedQuizz.value = QUIZZES.firstWhereOrNull(
    //     (el) => el.categoryId == categoryId && el.id == quizzId);

    _isLoading.value = false;

    print("QuizzGame onInit");
  }
}
