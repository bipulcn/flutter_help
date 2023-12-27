class MyProvider extends ChangeNotifier {
  MyProvider();
  var _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}
