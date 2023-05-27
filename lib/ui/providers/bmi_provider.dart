import 'package:flutter/material.dart';
import 'package:taw_mvvm/data/repo/bmi_repository.dart';

class BmiProvider with ChangeNotifier {
  double _bmi = 0;

  double get getBmi => _bmi;

  var bmiRepository = BmiRepository();

  void setBmi(int weight, height, age) {
    _bmi = bmiRepository.setBmi(weight, height, age);
    notifyListeners();
  }
}
