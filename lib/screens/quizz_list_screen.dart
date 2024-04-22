import 'package:cdlr/db/db.dart';
import 'package:cdlr/data/models/quizz.dart';
import 'package:cdlr/data/models/quizz_category.dart';
import 'package:cdlr/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizzListScreen extends StatefulWidget {
  const QuizzListScreen({super.key});

  @override
  State<QuizzListScreen> createState() => _QuizzListScreenState();
}

class _QuizzListScreenState extends State<QuizzListScreen> {
  late QuizzCategory? selectedCategory;
  late List<Quizz> quizzes;
  late String categoryId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //

    initPage();
  }

  initPage() {
    Map? params = ModalRoute.of(context)?.settings.arguments as Map?;

    categoryId = params?['categoryId'];

    setState(() {
      selectedCategory = CATEGORIES.firstWhere((el) => el.id == categoryId);
      quizzes = QUIZZES.where((el) => el.categoryId == categoryId).toList();
    });
  }

  gotoQuizz(quizzId) {
    // TODO add analytics
    Navigator.of(context).pushNamed(Routes.quizzDetails,
        arguments: {'quizzId': quizzId, 'categoryId': categoryId});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory?.name ?? ''),
      ),
      body: Container(
        child: Column(
          children: [
            // Appbar
            Container(
              child: const Row(
                children: [],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: quizzes.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () => gotoQuizz(quizzes[i].id),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.white)),
                    tileColor: Colors.grey.withOpacity(.2),
                    leading:
                        quizzes[i].icon != null ? Icon(quizzes[i].icon) : null,
                    title: Text(
                      quizzes[i].level ?? 'Quizz $i',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
