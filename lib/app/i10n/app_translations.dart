import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'login': "Login",
          'email': "Email",
          'password': "Password",
          'login_google': "Sign in with Google",
          'login_facebook': "Sign in with Facebook",
          'no_account_question': "Don't have an account?",
          'register': "Register?",
          'profile': "Profile",
          //
          'settings': "Settings",
          'theme': "Theme",
          'dark': "Dark",
          'light': "Light",
          'music': "Music",
          'language': "Language",
          'on': "Yes",
          'off': "Non",
          //
          'back': "Back",
          //
          'signs': "Signs",
          'quizz': "Quizz",
          'slogan': "Driving safely is easy",
          'title_signs': "Road signs",
          'all_signs': "Tous",
          'obligation_signs': "Obligation",
          'danger_signs': "Danger",
          'interdiction_signs': "Interdiction",
          'indication_signs': "Indication",
          'direction_signs': "Direction",
          'signaling': "Road signs",
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        },
        // 'de_DE': {
        //   'hello': 'Hallo Welt',
        // }
      };
}

class AppTexts {}
