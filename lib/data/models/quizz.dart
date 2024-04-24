import 'package:code_de_la_route/data/models/question.dart';
import 'package:flutter/material.dart';

class Quizz {
  final int id;
  String? categoryId;
  String? level;
  IconData? icon;
  final List<Question> questions;
  Quizz({
    required this.id,
    this.categoryId,
    this.level,
    this.icon,
    required this.questions,
  });
}
