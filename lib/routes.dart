import 'package:code_de_la_route/screens/home_screen.dart';
import 'package:code_de_la_route/screens/quizz_list_screen.dart';
import 'package:code_de_la_route/screens/quizz_detail_screen.dart';
import 'package:code_de_la_route/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static String splash = "/splash";
  static String home = "/home";
  static String quizzList = "/quizzList";
  static String quizzDetails = "/quizzDetails";
  static String welcome = "/welcome";
  static String menu = "/menu";
  static String readArticle = "/readArticle";
  static String savedArticles = "/savedArticles";
  static String cards = "/cards";

  static Map<String, WidgetBuilder> routes = {
    splash: (ctx) => const SplashScreen(),
    home: (ctx) => const HomeScreen(),
    quizzList: (ctx) => const QuizzListScreen(),
    quizzDetails: (ctx) => QuizzDetailScreen(),
    // welcome: (ctx) => SwiperPage(),
    // menu: (ctx) => MenuScreen(),
    // readArticle: (ctx) => ReadArticleScreen(),
    // savedArticles: (ctx) => SavedArticlesScreen(),
    // cards: (ctx) => CardsScreen(),
  };
}
