import 'package:flutter/material.dart';

class BlockData extends ChangeNotifier {
  String name = "Provide Test Data";

  void changeName(String name) {
    this.name = name;
    notifyListeners();
  }
}
