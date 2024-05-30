import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final storage = GetStorage();

  Future<void> saveScore(String quizzId, double score) async {
    await storage.write(quizzId, score);
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setInt(quizzId, score);
  }

  Future<double?> getScore(String quizzId) async {
    double? score = storage.read(quizzId);
    return score;
    // final prefs = await SharedPreferences.getInstance();
    // return prefs.getInt(quizzId);
  }

  Future<void> clearScore(String quizzId) async {
    await storage.remove(quizzId);
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.remove(quizzId);
  }
}
