import 'package:flutter/material.dart';

class BlockData extends ChangeNotifier {
  String name = "Bipul";
  int counter = 0;
  int get count => counter;

  void changeName(String str) {
    name = str;
    counter++;
    notifyListeners();
  }

  String nameIs() {
    return "$name $counter";
  }
}
