import 'package:code_de_la_route/data/models/answer.dart';
import 'package:code_de_la_route/data/models/question.dart';
import 'package:code_de_la_route/data/models/quizz.dart';
import 'package:code_de_la_route/data/models/quizz_category.dart';
import 'package:flutter/material.dart';

final List<QuizzCategory> CATEGORIES = [
  QuizzCategory(
      name: "Dégagement",
      id: "degagement",
      image: "assets/images/categories/degagement.jpg"),
  QuizzCategory(
      name: "Signalisation",
      id: "signalisation",
      image: "assets/images/categories/signalisation.jpeg"),
];

final List<Quizz> DEGAGEMENT_QUIZZES = [
  Quizz(
    id: 0,
    categoryId: "degagement",
    level: "Facile",
    questions: [
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_1.png",
        correctOrder: "Bleu, Rouge, Jaune, Vert",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_2.png",
        correctOrder: "Jaune, Bleu, Rouge",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_3.png",
        correctOrder: "Bleu, Jaune, Rouge",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_4.png",
        correctOrder: "Bleu, Rouge, Jaune",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_5.png",
        correctOrder: "Jaune, Rouge, Bleu",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_6.png",
        correctOrder: "Jaune, Rouge, Vert, Bleu",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_7.png",
        correctOrder: "Rouge, Jaune, Bleu",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_8.png",
        correctOrder: "Jaune, Bleu, Rouge",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_9.png",
        correctOrder: "Bleu, Rouge, Jaune",
      ),
      Question(
        categoryId: "degagement",
        prompt: "Quel est l'ordre de passage ?",
        type: "order",
        image: "/degagement/degagement_10.png",
        correctOrder: "Jaune, Rouge, Vert",
      ),
    ],
  ),
];

final List<Quizz> SIGNALS_QUIZZES = [
  Quizz(
      id: 0,
      categoryId: "signalisation",
      level: "Signalisation Verticale",
      icon: Icons.directions,
      questions: [
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            type: "image",
            image: "/signalisation/585f901ccb11b227491c3570.png",
            answers: [
              Answer(
                content: "Panneau Rond Point",
              ),
              Answer(
                content: "Panneau Attention Virage à gauche",
              ),
              Answer(
                content: "Panneau STOP sur un poteau",
                isCorrect: true,
              ),
              Answer(
                content: "Panneau Accès interdits aux motos",
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            image: "/signalisation/585f9250cb11b227491c357d.png",
            answers: [
              Answer(
                content: "Panneau STOP sur un poteau",
              ),
              Answer(
                content: "Panneau Rond Point",
                isCorrect: true,
              ),
              Answer(
                content: "Panneau Arrêt et stationnement interdits",
              ),
              Answer(
                content: "Panneau Céder le passage",
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            // image: "https://assets.stickpng.com/thumbs/585f90abcb11b227491c3571.png",
            image: "/signalisation/585f90abcb11b227491c3571.png",
            answers: [
              Answer(
                content: "Panneau Arrêt au poste de douane",
              ),
              Answer(
                content:
                    "Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué",
              ),
              Answer(
                content: "Panneau Céder le passage",
                isCorrect: true,
              ),
              Answer(
                content: "Panneau STOP sur un poteau",
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            image: "/signalisation/585f8f6dcb11b227491c355c.png",
            answers: [
              Answer(
                content:
                    "Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué",
                isCorrect: true,
              ),
              Answer(
                content: "Panneau Arrêt au poste de douane",
              ),
              Answer(
                content: "Panneau Arrêt et stationnement interdits",
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            image: "/signalisation/585f8f49cb11b227491c3558.png",
            answers: [
              Answer(
                content: "Panneau Arrêt au poste de douane",
              ),
              Answer(
                content:
                    "Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué",
              ),
              Answer(
                content: "Panneau Accès interdits aux motos",
                isCorrect: true,
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            image: "/signalisation/585f8f74cb11b227491c355d.png",
            answers: [
              Answer(
                content: "Panneau STOP sur un poteau",
              ),
              Answer(
                content: "Panneau Arrêt au poste de douane",
                isCorrect: true,
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            image: "/signalisation/585f8f29cb11b227491c3555.png",
            answers: [
              Answer(
                content: "Panneau Accès interdits aux motos",
              ),
              Answer(
                content: "Panneau Arrêt et stationnement interdits",
                isCorrect: true,
              ),
              Answer(
                content: "Panneau Attention Virage à gauche",
              ),
              Answer(
                content: "Panneau STOP sur un poteau",
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            image: "/signalisation/585f8f40cb11b227491c3557.png",
            answers: [
              Answer(
                content: "Panneau Bouchon Possible",
              ),
              Answer(
                content: "Panneau Attention Virage à gauche",
                isCorrect: true,
              ),
              Answer(
                content: "Panneau STOP sur un poteau",
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            image: "/signalisation/585f8fb9cb11b227491c3563.png",
            answers: [
              Answer(
                content: "Panneau Chaussée glissante",
              ),
              Answer(
                content: "Panneau STOP sur un poteau",
              ),
              Answer(
                content: "Panneau Cassis ou dos-d'âne",
                isCorrect: true,
              ),
            ]),
        Question(
            categoryId: "signalisation",
            prompt: "De quel panneau s'agit-il ?",
            level: "",
            type: "image",
            image: "/signalisation/585f900ecb11b227491c356e.png",
            answers: [
              Answer(
                content: "Panneau Cassis ou dos-d'âne",
              ),
              Answer(
                content: "Panneau Chaussée glissante",
                isCorrect: true,
              ),
              Answer(
                content: "Panneau Bouchon Possible",
              ),
              Answer(
                content: "Panneau STOP sur un poteau",
              ),
            ])
      ]),
  Quizz(
    id: 1,
    categoryId: "signalisation",
    level: "Signalisation Gestuelle",
    icon: Icons.sign_language,
    questions: [
      Question(
          categoryId: "signalisation",
          prompt: "De quel panneau s'agit-il ?",
          type: "voice",
          image: "/signalisation/585f901ccb11b227491c3570.png",
          correctAnswers: [
            "Panneau STOP sur un poteau",
            "Panneau STOP",
          ]),
      Question(
          categoryId: "signalisation",
          prompt: "De quel panneau s'agit-il ?",
          type: "voice",
          image: "/signalisation/585f90abcb11b227491c3571.png",
          correctAnswers: [
            "Panneau Céder le passage",
          ]),
    ],
  ),
  Quizz(
    id: 1,
    categoryId: "signalisation",
    level: "Signalisation Horizontale",
    icon: Icons.remove_road,
    questions: [],
  ),
];

final QUIZZES = [...SIGNALS_QUIZZES, ...DEGAGEMENT_QUIZZES];
