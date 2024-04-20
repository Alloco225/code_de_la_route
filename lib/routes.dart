import 'package:cdlr/screens/home_screen.dart';
import 'package:cdlr/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static String splash = "/splash";
  static String home = "/home";
  static String welcome = "/welcome";
  static String menu = "/menu";
  static String readArticle = "/readArticle";
  static String savedArticles = "/savedArticles";
  static String cards = "/cards";

  static Map<String, WidgetBuilder> routes = {
    splash: (ctx) => const SplashScreen(),
    home: (ctx) => const HomeScreen(),
    // welcome: (ctx) => SwiperPage(),
    // menu: (ctx) => MenuScreen(),
    // readArticle: (ctx) => ReadArticleScreen(),
    // savedArticles: (ctx) => SavedArticlesScreen(),
    // cards: (ctx) => CardsScreen(),
  };
}
