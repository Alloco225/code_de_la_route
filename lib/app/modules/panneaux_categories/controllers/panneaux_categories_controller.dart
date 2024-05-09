import 'package:codedelaroute/app/data/db/db_data.dart';
import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:get/get.dart';

class PanneauxCategoriesController extends GetxController {
  final _categories = [...SIGN_CATEGORIES].obs;

  List<SignCategory> get categories => _categories.value;
}
