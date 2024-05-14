import 'package:codedelaroute/app/modules/home/views/home_view.dart';
import 'package:codedelaroute/app/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  Future<void> initializeSettings() async =>
      await Future.delayed(const Duration(seconds: 2));

  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return Scaffold(body: HomeView());
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return const Scaffold(
        body: Center(
            child: LoadingWidget(
      size: 250,
      padding: 30,
    )));
  }
}
