import 'dart:async';

import 'package:code_de_la_route/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizzEnded extends StatefulWidget {
  final int correctAnswerCount;
  final int questionCount;
  final Function() onRestartQuizz;
  final Function() onGoHome;
  final Function() onReturnToQuizzList;

  const QuizzEnded({
    super.key,
    required this.correctAnswerCount,
    required this.onRestartQuizz,
    required this.onReturnToQuizzList,
    required this.onGoHome,
    required this.questionCount,
  });

  @override
  _QuizzEndedState createState() => _QuizzEndedState();
}

class _QuizzEndedState extends State<QuizzEnded> with TickerProviderStateMixin {
  late final AnimationController _coffettiPopAC =
      AnimationController(vsync: this);
  dynamic _confettiComposition;

  final int MARK_TOTAL = 20;
  double score = 0;

  @override
  void initState() {
    super.initState();
    calcScore();
    // TODO add a gsap animation on the score calculating
  }

  @override
  void dispose() {
    _coffettiPopAC.dispose();
    super.dispose();
  }

  void calcScore() {
    final int total = widget.questionCount != 0 ? widget.questionCount : 1;

    double percentage = (widget.correctAnswerCount * 100) / total;
    // find percentage value in regard to MARK_TOTAL which is 100/5
    double coefficient = 100 / MARK_TOTAL;
    setState(() {
      score = percentage / coefficient;
    });
    if (score == MARK_TOTAL) {
      throwConfetti();
    }
  }

  throwConfetti() {
    _coffettiPopAC
      ..duration = _confettiComposition?.duration ?? const Duration(seconds: 3)
      ..forward();
  }

  String getShareLink(String platform) {
    if (platform.isEmpty) return '';

    String url = "https://code-de-la-route.amane.dev";

    String scoreText = '${score.toStringAsFixed(0)}/$MARK_TOTAL';
    Map<String, String> data = {
      'title': "Euss, esseu tu peux ?",
      'text': "J'ai eu $scoreText au test de Code de la Route en ligne",
      'url': url,
    };
    String stringText = data.values.join('\n');

    String link = url;
    if (platform == "whatsapp") {
      link = "whatsapp://send?text=$stringText";
    } else if (platform == "facebook") {
      link = "https://www.facebook.com/sharer/sharer.php?u=$stringText";
    } else if (platform == "linkedin") {
      link = "https://www.linkedin.com/shareArticle?url=$stringText";
    } else if (platform == "twitter") {
      link = "https://twitter.com/intent/tweet?url=$stringText";
    }

    return link;
  }

  void shareScore(BuildContext context, String platform) async {
    print("shareScore $platform");
    String stringToShare = "https://code-de-la-route.amane.dev";
    // String link = "";

    if (platform.isEmpty) {
      String scoreText = '${score.toStringAsFixed(0)}/$MARK_TOTAL';
      Map<String, String> data = {
        'title': "Euss, esseu tu peux ?",
        'text': "J'ai eu $scoreText au test de Code de la Route en ligne",
        'url': stringToShare,
      };
      String stringText = data.values.join('\n');

      if (!await canLaunch(stringText)) {
        await Clipboard.setData(ClipboardData(text: stringText));
        // Show toast: "Copié dans le presse papier"
      } else {
        await Share.share(stringText);
      }
      return;
    }
  }

  void onCoffettiCompositionLoaded(composition) {
    _confettiComposition = composition;
  }

  get markBgColor {
    if (score <= MARK_TOTAL / 3) {
      return Colors.orange;
    }
    if (score <= MARK_TOTAL / 2) {
      return Colors.red;
    }
    if (score < MARK_TOTAL) {
      return Colors.blue;
    }
    if (score == MARK_TOTAL) {
      return Colors.green;
    }
    return Colors.red.shade700;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Stack(
        children: [
          Lottie.asset(
            'assets/animations/confetti-pop.anim.json',
            controller: _coffettiPopAC,
            onLoaded: onCoffettiCompositionLoaded,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * .3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Quizz Terminé",
                  semanticsLabel: "Quizz Terminé",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: markBgColor,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${score.toStringAsFixed(0)}/$MARK_TOTAL',
                          semanticsLabel: "Note totale ${score.toStringAsFixed(0)}/$MARK_TOTAL'",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.4),
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(
                          Ionicons.arrow_redo_outline,
                          size: 30,
                        )),
                    const SizedBox(height: 20),
                    const Text(
                      "Partager mon score",
                      semanticsLabel: "Partager mon score",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Ionicons.logo_whatsapp,
                            size: 38,
                          ),
                          Icon(
                            Ionicons.logo_facebook,
                            size: 38,
                          ),
                          Icon(
                            Ionicons.logo_twitter,
                            size: 38,
                          ),
                          Icon(
                            Ionicons.logo_linkedin,
                            size: 38,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              text: "Retour",
                              icon: Ionicons.arrow_back,
                              color: Colors.white,
                              backgroundColor: Colors.blue,
                              onPressed: widget.onReturnToQuizzList,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ButtonWidget(
                              text: "Réessayer",
                              icon: Ionicons.refresh_outline,
                              color: Colors.white,
                              backgroundColor: Colors.green,
                              onPressed: widget.onRestartQuizz,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              text: "Menu",
                              icon: Ionicons.home_outline,
                              color: Colors.white,
                              backgroundColor: Colors.red,
                              onPressed: widget.onGoHome,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
