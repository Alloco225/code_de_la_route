// ignore_for_file: invalid_use_of_protected_member
import 'package:codedelaroute/app/data/models/sign_category_model.dart';
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
    super.onInit();
    _isLoading.value = true;
    _categories.value = await provider.loadSignCategory();
    _isLoading.value = false;
  }
}
