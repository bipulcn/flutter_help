class TestTone {
  TestTone._();
  static final instance = TestTone._();
  String tone = "";
  void checkMe() {
    tone = "This string was set over here";
    print("Test Tone");
  }

  void checkValue() {
    print(tone);
  }
}
