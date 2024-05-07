import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/panneaux_categories_controller.dart';

class PanneauxCategoriesView extends GetView<PanneauxCategoriesController> {
  const PanneauxCategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PanneauxCategoriesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PanneauxCategoriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
