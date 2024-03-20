import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleCube extends Cubit<int?> {
  SimpleCube() : super(null);

  void rollDice() {
    int number;
    do {
      number = Random().nextInt(6);
    } while (number == 0);
    emit(number);
  }
}
