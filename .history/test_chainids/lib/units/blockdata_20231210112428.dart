import 'package:flutter/material.dart';

class BlockData extends ChangeNotifier {
  String name = "Provide Test Data";

  void changeName(String name) {
    debugPrint("Name Changing");
    this.name = name;
    notifyListeners();
  }
}
