import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_blocs/bloc/bloc/blocevent.dart';
import 'package:test_blocs/bloc/bloc/blocstate.dart';

class BlocClass extends Bloc<NameEvent, NameState> {
  List<String> name = [];

  BlocClass() : super(InitalState()) {
    on<NameChangeEvent>(onNameChange);
    on<NameAppendEvent>(onNameAppend);
  }

  void onNameChange(NameChangeEvent event, Emitter<NameState> emit) async {
    name = ['Bipul'];
    emit(UpdateState(name));
  }

  void onNameAppend(NameAppendEvent event, Emitter<NameState> emit) async {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    String word = getRandomString(7);
    name.add(word);
    emit(UpdateState(name));
  }
}
