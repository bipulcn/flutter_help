import 'package:flutter/material.dart';
import 'package:test_bloc/bloc_pages/counter_event.dart';
import 'package:test_bloc/bloc_pages/counter_state.dart';
import 'package:test_bloc/bloc_pages/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bloc Demo APP"),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          if (state is InitialState) {
            return _counter(context);
          }
          if (state is UpdateState) {
            return _counter(context);
          }
          return const Center(
            child: Text("Its a problem"),
          );
        },
      ),
    );
  }
}

Widget _counter(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.watch<CounterBloc>().counter.toString(),
          // counter.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          width: 50,
        ),
        const SecondPage(),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.red,
              elevation: 0.0,
              height: 50,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Text(
                "-",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              onPressed: () {
                context.read<CounterBloc>().add(NumberDecreaseEvent());
              },
            ),
            const SizedBox(
              width: 50,
            ),
            MaterialButton(
              color: Colors.green,
              elevation: 0.0,
              height: 50,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Text(
                "+",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              onPressed: () {
                context.read<CounterBloc>().add(NumberIncreaseEvent());
              },
            ),
          ],
        )
      ],
    ),
  );
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("This is second Class"),
          Text(
            "${context.watch<CounterBloc>().counter}",
            style: const TextStyle(fontSize: 54),
          )
        ],
      ),
    );
  }
}
