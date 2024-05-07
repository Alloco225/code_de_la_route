import 'package:get/get.dart';

import '../middlewares/auth_guard.dart';
import '../middlewares/premium_guard.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/submodules/login/bindings/login_binding.dart';
import '../modules/auth/submodules/login/views/login_view.dart';
import '../modules/auth/submodules/register/bindings/register_binding.dart';
import '../modules/auth/submodules/register/views/register_view.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/course_detail/bindings/course_detail_binding.dart';
import '../modules/course_detail/views/course_detail_view.dart';
import '../modules/course_list/bindings/course_list_binding.dart';
import '../modules/course_list/views/course_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/panneaux/bindings/panneaux_binding.dart';
import '../modules/panneaux/views/panneaux_view.dart';
import '../modules/panneaux_categories/bindings/panneaux_categories_binding.dart';
import '../modules/panneaux_categories/views/panneaux_categories_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/quizz/bindings/quizz_binding.dart';
import '../modules/quizz/views/quizz_view.dart';
import '../modules/quizz_categories/bindings/quizz_categories_binding.dart';
import '../modules/quizz_categories/views/quizz_categories_view.dart';
import '../modules/quizz_detail/bindings/quizz_detail_binding.dart';
import '../modules/quizz_detail/views/quizz_detail_view.dart';
import '../modules/quizz_game/bindings/quizz_game_binding.dart';
import '../modules/quizz_game/views/quizz_game_view.dart';
import '../modules/quizz_levels/bindings/quizz_levels_binding.dart';
import '../modules/quizz_levels/views/quizz_levels_view.dart';
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
      page: () => HomeView(),
      binding: HomeBinding(),
      // middlewares: const [
      //   // PremiumGuard(),
      // ]
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
    GetPage(
      name: _Paths.QUIZZ_CATEGORIES,
      page: () => const QuizzCategoriesView(),
      binding: QuizzCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.QUIZZ_GAME,
      page: () => const QuizzGameView(),
      binding: QuizzGameBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_LIST,
      page: () => const CourseListView(),
      binding: CourseListBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_DETAIL,
      page: () => const CourseDetailView(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding(),
        middlewares: [
          // My middlewares here
          AuthGuard(),
          PremiumGuard(),
        ]),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => const LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PANNEAUX,
      page: () => const PanneauxView(),
      binding: PanneauxBinding(),
    ),
    GetPage(
      name: _Paths.PANNEAUX_CATEGORIES,
      page: () => PanneauxCategoriesView(),
      binding: PanneauxCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.QUIZZ_LEVELS,
      page: () => const QuizzLevelsView(),
      binding: QuizzLevelsBinding(),
    ),
  ];
}
