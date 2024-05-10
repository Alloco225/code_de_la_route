import 'package:get/get.dart';

import '../../../data/db/db_data.dart';
import '../../../data/models/sign_model.dart';
import '../../../data/providers/sign_provider.dart';

class PanneauxController extends GetxController {
  //TODO: Implement PanneauxController
  final _categoryId = (null as String?).obs;
  final _categoryName = (null as String?).obs;
  final _quizzId = (null as int?).obs;
  final _isLoading = false.obs;

  final _signProvider = SignProvider();

  get categoryId => _categoryId.value;
  String? get categoryName => _categoryName.value;
  get quizzId => _quizzId.value;

  final _signsList = <Sign>[].obs;
  final _signs = <Sign>[].obs;

  List<Sign> get signs => _signs.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() async {
    super.onInit();
    print("Panneaux onInit");

    _isLoading.value = true;

    var routeParams = Get.arguments as Map?;

    print("Panneaux params $routeParams");

    _categoryId.value = routeParams?['categoryId'];
    _categoryName.value = routeParams?['categoryName'];

    _signsList.value = (await _signProvider.loadAllSigns()).cast<Sign>();

    _signs.value = _signsList.value;

    if (_categoryId.value != null) {
      _signs.value =
          _signsList.where((el) => el.categoryId == categoryId).toList();
    }

    _isLoading.value = false;

    print("QuizzGame onInit");
  }
}
