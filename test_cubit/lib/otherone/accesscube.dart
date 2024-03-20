import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/otherone/simplecube.dart';

class AccessCube extends StatelessWidget {
  const AccessCube({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Simple Cubit"), backgroundColor: Colors.amber),
      body: BlocProvider(
        create: (context) => SimpleCube(),
        child: const SimpCube(),
      ),
    );
  }
}

class SimpCube extends StatelessWidget {
  const SimpCube({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text("Welcome to simple cubit",
                style: TextStyle(fontSize: 24))),
        Center(
          child: Text(
            "${context.watch<SimpleCube>().state}",
            style: const TextStyle(fontSize: 30),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<SimpleCube>().rollDice();
            },
            child: const Text("Clicked"))
      ],
    );
  }
}
