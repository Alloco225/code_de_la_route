import 'package:codedelaroute/app/data/db/db_data.dart';
import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:codedelaroute/app/modules/quizz/providers/sign_provider.dart';
import 'package:get/get.dart';

import '../../../data/providers/sign_category_provider.dart';

class PanneauxCategoriesController extends GetxController {
  final _isLoading = true.obs;
  final provider = SignCategoryProvider();

  // final _categories = [...SIGN_CATEGORIES].obs;
  final _categories = <SignCategory>[].obs;

  List<SignCategory> get categories => _categories.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _isLoading.value = true;
    _categories.value = await provider.loadSignCategory();
    _isLoading.value = false;
  }
}
