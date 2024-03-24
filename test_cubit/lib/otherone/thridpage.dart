import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Thirdpage extends StatelessWidget {
  const Thirdpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("First tab"),
          centerTitle: true,
          backgroundColor: Colors.cyan.shade300,
        ),
        body: BlocProvider(
          create: (context) => CounterCubit(),
          child: const DateAccess(),
        ));
  }
}

class DateAccess extends StatelessWidget {
  const DateAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: Text("Your Number is ${context.watch<CounterCubit>().state}",
              style: const TextStyle(fontSize: 24))),
      ElevatedButton(
          onPressed: () {
            context.read<CounterCubit>().increment();
          },
          child: const Text("Click me")),
      ElevatedButton(
          onPressed: () => context.read<CounterCubit>().decrement(),
          child: const Text("-"))
    ]);
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(1);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state > 1) emit(state - 1);
  }
}
