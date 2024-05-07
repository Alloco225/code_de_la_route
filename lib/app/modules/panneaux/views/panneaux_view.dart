import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/panneaux_controller.dart';

class PanneauxView extends GetView<PanneauxController> {
  const PanneauxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PanneauxView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PanneauxView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
