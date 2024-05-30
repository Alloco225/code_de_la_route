import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final storage = GetStorage();

  Future<void> saveScore(String quizzId, double score) async {
    log('saveScore', name: 'LocalStorage');
    await storage.write(quizzId, score);
  }

  Future<double?> getScore(String quizzId) async {
    double? score = storage.read(quizzId);
    return score;
  }

  Future<void> clearScore(String quizzId) async {
    await storage.remove(quizzId);
  }

  Future<List<String>> getLearnedSigns() async {
    List<String> learnedSigns = storage.read('learned_signs') ?? [];
    return learnedSigns;
  }

  Future<void> saveLearnedSigns(List<String> signs) async {
    await storage.write('learned_signs', signs);
  }
}
