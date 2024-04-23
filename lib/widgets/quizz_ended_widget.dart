import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizzEnded extends StatefulWidget {
  final int correctAnswerCount;
  final int questionCount;

  const QuizzEnded({
    super.key,
    required this.correctAnswerCount,
    required this.questionCount,
  });

  @override
  _QuizzEndedState createState() => _QuizzEndedState();
}

class _QuizzEndedState extends State<QuizzEnded> {
  final int MARK_TOTAL = 20;
  double score = 0;

  @override
  void initState() {
    super.initState();
    calcScore();
    // TODO add a gsap animation on the score calculating
  }

  void calcScore() {
    double percentage =
        (widget.correctAnswerCount * 100) / (widget.questionCount ?? 0);
    // find percentage value in regard to MARK_TOTAL which is 100/5
    double coefficient = 100 / MARK_TOTAL;
    setState(() {
      score = percentage / coefficient;
    });
    if (score == MARK_TOTAL) {
      throwConfetti();
    }
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

  void goBackToQuizzList(BuildContext context) {
    Navigator.pop(context);
  }

  void goToMenu(BuildContext context) {
    // Navigate to menu screen
  }

  void restart(BuildContext context) {
    // Emit restart event
  }

  void shareScore(BuildContext context, String platform) async {
    print("shareScore $platform");
    String stringToShare = "https://code-de-la-route.amane.dev";
    String link = "";

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

  void throwConfetti() {
    Future.delayed(const Duration(milliseconds: 500), () {
      print("confetti !!");
      // Start confetti animation
      Future.delayed(const Duration(seconds: 2), () {
        // Stop confetti animation after 2 seconds
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Quizz Terminé",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Container(
              width: 120,
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: score == MARK_TOTAL
                    ? Colors.green
                    : score < MARK_TOTAL
                        ? Colors.blue
                        : score <= MARK_TOTAL / 2
                            ? Colors.orange
                            : Colors.red,
              ),
              child: Text(
                '${score.toStringAsFixed(0)}/$MARK_TOTAL',
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => goBackToQuizzList(context),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () => restart(context),
                  icon: const Icon(Icons.refresh),
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () => goToMenu(context),
                  icon: const Icon(Icons.home),
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
