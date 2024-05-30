import 'dart:async';
import 'dart:developer';

import 'package:codedelaroute/app/helpers/utils.dart';
import 'package:codedelaroute/app/modules/quizz_game/controllers/quizz_game_controller.dart';
import 'package:codedelaroute/app/modules/quizz_list/controllers/quizz_list_controller.dart';
import 'package:codedelaroute/app/views/ui/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/services/firestore_service.dart';
import '../../../helpers/local_storage.dart';
import '../../../views/widgets/button_widget.dart';
import '../../auth/controllers/auth_controller.dart';

class QuizzEndedView extends StatefulWidget {
  final List<Map> correctAnswers;
  final int questionCount;

  final Function() onRestartQuizz;
  final Function() onGoHome;
  final Function() onReturnToQuizzList;

  const QuizzEndedView({
    super.key,
    required this.correctAnswers,
    required this.onRestartQuizz,
    required this.onReturnToQuizzList,
    required this.onGoHome,
    required this.questionCount,
  });

  @override
  _QuizzEndedViewState createState() => _QuizzEndedViewState();
}

class _QuizzEndedViewState extends State<QuizzEndedView>
    with TickerProviderStateMixin {
  late final AnimationController _coffettiPopAC =
      AnimationController(vsync: this);
  dynamic _confettiComposition;
  final _authController = Get.find<AuthController>();
  final _gameController = Get.find<QuizzGameController>();

  late FirestoreService firestoreService =
      FirestoreService(_authController.userId!);

  final LocalStorage _localStorage = LocalStorage();
  final storage = GetStorage();

  final globalKey = GlobalKey();

  final int MARK_TOTAL = 20;
  double score = 0;
  double percentage = 0;
  String url = "https://code-de-la-route.amane.dev";

  String get scoreText => '${score.toStringAsFixed(0)}/$MARK_TOTAL';

  String? get quizzId => _gameController.selectedQuizz?.id;

  Map<String, String> get shareData => {
        'title': "Est-ce que tu maitrises le Code de la Route ?",
        'text': "J'ai eu $scoreText au test de Code de la Route en ligne",
        'url': url,
      };

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

  void calcScore() async {
    final int total = widget.questionCount != 0 ? widget.questionCount : 1;

    int correctAnswerCount = widget.correctAnswers.length;

    percentage = (correctAnswerCount * 100) / total;
    // find percentage value in regard to MARK_TOTAL which is 100/5
    double coefficient = 100 / MARK_TOTAL;
    score = percentage / coefficient;

    // Save score online

    _saveScore(score);

    log("correct answers ${widget.correctAnswers}");
    List<String> correctlyAnsweredSigns = widget.correctAnswers
            .where((el) => el['signId'] != null)
            .map((e) => e['signId'] as String)
            .toList();

    log("calculated correctlyAnsweredSigns");

    log("correctly guessed signs $correctlyAnsweredSigns");

    _saveLearnedSigns(correctlyAnsweredSigns);

    _calculateAndSaveAverageScore();

    // save score
    // if (quizzId != null) {
    //   _quizzListController.updateQuizzScore(quizzId, score);
    //   storage.write(quizzId!, score);
    // }

    // final scoreProvider = ScoreProvider();
    // scoreProvider.saveScore(
    //   quizzId: _gameController.selectedQuizz!.id!,
    //   score: score,
    //   userId: null,
    // );
    setState(() {});
    if (score == MARK_TOTAL) {
      throwConfetti();
    }
  }

  Future<void> _saveScore(double score) async {
    log("saving score $score");
    if (_authController.userId == null) {
      await _localStorage.saveScore(quizzId!, score);
    } else {
      FirestoreService firestoreService =
          FirestoreService(_authController.userId!);
      await firestoreService.saveScore(quizzId!, score);
    }
  }

  void _calculateAndSaveAverageScore() async {
    double averageScore = await firestoreService.calculateAverageScore();

    // Save average score online
    await firestoreService.saveAverageScore(averageScore);
  }

  Future<void> _saveLearnedSigns(List<String> signIds) async {
    log("saving learned signs $signIds");
    if (_authController.userId == null) {
      await _localStorage.saveLearnedSigns(signIds);
    } else {
      FirestoreService firestoreService =
          FirestoreService(_authController.userId!);
      await firestoreService.addLearnedSigns(signIds);
    }
  }

  throwConfetti() {
    _coffettiPopAC
      ..duration = _confettiComposition?.duration ?? const Duration(seconds: 3)
      ..forward();
  }

  Future<bool> getShareLink(String platformShareLink) async {
    print("getShareLink $platformShareLink");

    String stringText = shareData.values.join('\n');
    String link = url;

    link = platformShareLink.replaceAll('REPLACE_WITH_LINK', stringText);
    print("link $link");

    Uri shareUrl = Uri.parse(link);
    if (await canLaunchUrl(shareUrl)) {
      await launchUrl(shareUrl);
      showSnackbarSuccess("Merci d'avoir partagé", context: context);
      return true;
    }
    // showSnackbarError("Lien de partage indisponible", context: context);
    // print("could not share");
    shareScore();

    return false;
  }

  void shareScore() async {
    String stringText = shareData.values.join('\n');

    var result = await Share.share(stringText);
    if (result.status == ShareResultStatus.success) {
      showSnackbarSuccess("Merci d'avoir partagé", context: context);
    }
    return;
  }

  void onCoffettiCompositionLoaded(composition) {
    _confettiComposition = composition;
  }

  get markBgColor {
    if (score == MARK_TOTAL) {
      return Colors.green;
    }
    if (score > MARK_TOTAL / 2) {
      return Colors.blue;
    }
    if (score > MARK_TOTAL / 3) {
      return Colors.red;
    }
    if (score > MARK_TOTAL / 4) {
      return Colors.orange;
    }
    return Colors.red.shade700;
  }

  List<Map> platformIcons = [
    {
      "icon": Ionicons.logo_whatsapp,
      "share_link": "whatsapp://send?text=REPLACE_WITH_LINK",
    },
    {
      "icon": Ionicons.logo_facebook,
      "share_link":
          "https://www.facebook.com/sharer/sharer.php?u=REPLACE_WITH_LINK",
    },
    {
      "icon": Ionicons.logo_twitter,
      "share_link":
          "https://www.linkedin.com/shareArticle?url=REPLACE_WITH_LINK",
    },
    {
      "icon": Ionicons.logo_linkedin,
      "share_link": "https://twitter.com/intent/tweet?url=REPLACE_WITH_LINK",
    },
  ];

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
                          color: percentageColor(percentage),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${score.toStringAsFixed(0)}/$MARK_TOTAL',
                          semanticsLabel:
                              "Note totale ${score.toStringAsFixed(0)}/$MARK_TOTAL'",
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
                    InkWell(
                      onTap: shareScore,
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.4),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Ionicons.arrow_redo_outline,
                            size: 30,
                          )),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: shareScore,
                      child: const Text(
                        "Partager mon score",
                        semanticsLabel: "Partager mon score",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: platformIcons
                              .map((e) => _buildPlatformButton(
                                  icon: e['icon'],
                                  onTap: () => getShareLink(e['share_link'])))
                              .toList()),
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

  Widget _buildPlatformButton({
    VoidCallback? onTap,
    IconData? icon,
  }) {
    return InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          size: 38,
        ));
  }
}
