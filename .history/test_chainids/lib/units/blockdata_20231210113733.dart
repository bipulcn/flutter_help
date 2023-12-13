import 'package:flutter/material.dart';

class BlockData extends ChangeNotifier {
  String name;

  void changeName(String name) {
    this.name = name;
    debugPrint("Name Changing $name");
    notifyListeners();
  }

  String nameIs() {
    return name;
  }
}
