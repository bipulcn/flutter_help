import 'package:flutter/material.dart';

class BlockData with ChangeNotifier {
  String name = "Bipul";
  int counter = 0;
  int get count => counter;

  void changeName(String str) {
    name = str;
    notifyListeners();
  }

  void increment() {
    counter++;
    notifyListeners();
  }

  String nameIs() {
    return "$name $counter";
  }
}
