// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/panneaux/bindings/panneaux_binding.dart';
import '../modules/panneaux/views/panneaux_view.dart';
import '../modules/panneaux_categories/bindings/panneaux_categories_binding.dart';
import '../modules/panneaux_categories/views/panneaux_categories_view.dart';
import '../modules/quizz_game/bindings/quizz_game_binding.dart';
import '../modules/quizz_game/views/quizz_game_view.dart';
import '../modules/quizz_list/bindings/quizz_list_binding.dart';
import '../modules/quizz_list/views/quizz_list_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      // middlewares: const [
      //   // PremiumGuard(),
      // ]
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.QUIZZ_LIST,
      page: () => const QuizzListView(),
      binding: QuizzListBinding(),
    ),
    GetPage(
      name: _Paths.QUIZZ_GAME,
      page: () => const QuizzGameView(),
      binding: QuizzGameBinding(),
    ),
    GetPage(
      name: _Paths.PANNEAUX,
      page: () => const PanneauxView(),
      binding: PanneauxBinding(),
    ),
    GetPage(
      name: _Paths.PANNEAUX_CATEGORIES,
      page: () => const PanneauxCategoriesView(),
      binding: PanneauxCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
