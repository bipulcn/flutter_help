import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class ObjCubit extends Cubit<String?> {
  ObjCubit() : super(null);

  void randomWords() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    String word = getRandomString(7);
    emit(word);
  }

  void rndNumber() {
    Random _rnd = Random();
    int num = _rnd.nextInt(10000);
    emit(num.toString());
  }
}
