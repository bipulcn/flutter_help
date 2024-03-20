import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  MyProvider();
  var _count = 5;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}
