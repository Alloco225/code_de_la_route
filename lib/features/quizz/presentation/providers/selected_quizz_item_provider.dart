import 'package:flutter/material.dart';

class SelectedQuizzItemProvider extends ChangeNotifier {
  int number;

  SelectedQuizzItemProvider({
    this.number = 0,
  });

  void changeNumber({required int newNumber}) {
    number = newNumber;
    notifyListeners();
  }
}
