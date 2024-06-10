import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/sign_model.dart';
import '../../../data/providers/sign_provider.dart';

class PanneauxController extends GetxController {
  final _categoryId = (null as String?).obs;
  final _categoryName = (null as String?).obs;
  final _quizzId = (null as int?).obs;
  final _isLoading = false.obs;

  var sliderController = PageController();

  final _signProvider = SignProvider();

  String? get categoryId => _categoryId.value;
  String? get categoryName => _categoryName.value;
  get quizzId => _quizzId.value;

  final _signsList = <Sign>[].obs;
  final _signs = <Sign>[].obs;

  final _selectedSignIndex = 0.obs;

  get selectedSignIndex => _selectedSignIndex.value;
  Sign get sign => signs[selectedSignIndex];

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

    _signsList.value = await _signProvider.loadAllSigns();

    _signs.value = _signsList.value;

    if (_categoryId.value != null) {
      _signs.value =
          _signsList.where((el) => el.categoryId == categoryId).toList();
    }

    _isLoading.value = false;

    print("QuizzGame onInit");
  }

  showSign(signId) {
    var index = signs.indexWhere((el) => el.id == signId);
    log("showSign $signId");
    if (index != -1) {
      _selectedSignIndex.value = index;
      sliderController = PageController(initialPage: index);
    }
  }

  _animatePageTo(index) {
    sliderController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  nextSign() {
    if (_selectedSignIndex.value < signs.length - 1) {
      _selectedSignIndex.value++;
      _animatePageTo(_selectedSignIndex.value);
    }
  }

  prevSign() {
    if (_selectedSignIndex.value > 0) {
      _selectedSignIndex.value--;
      _animatePageTo(_selectedSignIndex.value);
    }
  }

  updateSignIndex(index) {
    _selectedSignIndex.value = index;
  }
}
