import 'package:flutter/material.dart';

class TestTone {
  TestTone._();
  static final instance = TestTone._();
  String tone = "";
  void checkMe() {
    tone = "This string was set over here";
    debugPrint("Test Tone");
  }

  void checkValue() {
    debugPrint(tone);
  }
}
