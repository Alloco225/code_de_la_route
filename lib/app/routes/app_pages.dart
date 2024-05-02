import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/quizz/bindings/quizz_binding.dart';
import '../modules/quizz/views/quizz_view.dart';
import '../modules/quizz_detail/bindings/quizz_detail_binding.dart';
import '../modules/quizz_detail/views/quizz_detail_view.dart';
import '../modules/quizz_list/bindings/quizz_list_binding.dart';
import '../modules/quizz_list/views/quizz_list_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.QUIZZ,
      page: () => const QuizzView(),
      binding: QuizzBinding(),
    ),
    GetPage(
      name: _Paths.QUIZZ_LIST,
      page: () => const QuizzListView(),
      binding: QuizzListBinding(),
    ),
    GetPage(
      name: _Paths.QUIZZ_DETAIL,
      page: () => const QuizzDetailView(),
      binding: QuizzDetailBinding(),
    ),
  ];
}
