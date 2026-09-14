import 'package:codedelaroute/app/data/models/quizz_category_model.dart';
import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:codedelaroute/app/data/providers/sign_category_provider.dart';
import 'package:get/get.dart';

class QuizzCategoriesController extends GetxController {
  final count = 0.obs;
  final categories = <QuizzCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final signCategoryProvider = SignCategoryProvider();
    List<SignCategory> signCategories =
        await signCategoryProvider.loadSignCategory();
    categories.value = signCategories
        .map((sc) => QuizzCategory(
              id: sc.id ?? '',
              name: sc.name ?? '',
              image: sc.image,
            ))
        .toList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
