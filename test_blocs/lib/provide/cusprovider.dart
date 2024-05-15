import 'package:flutter/material.dart';

class CusProvider extends ChangeNotifier {
  CusProvider();
  var _name = 'initial';
  String get name => _name;
  void changeName(String nam) {
    _name = nam;
    notifyListeners();
  }
}
