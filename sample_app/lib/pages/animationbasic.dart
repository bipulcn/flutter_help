import 'dart:math';

import 'package:flutter/material.dart';

class AnimationBasics extends StatefulWidget {
  const AnimationBasics({super.key});

  @override
  State<AnimationBasics> createState() => _AnimationBasicsState();
}

class _AnimationBasicsState extends State<AnimationBasics> {
  double width = 0, rever = 400;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut,
                padding: const EdgeInsets.all(20),
                width: width,
                height: 100,
                color: Colors.purple,
                child: const Text("hello world")),
            AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut,
                padding: const EdgeInsets.all(20),
                width: rever,
                height: 100,
                color: Colors.blueAccent,
                child: const Text("hello world")),
          ],
        ),
        AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: const SineCurve(),
            padding: const EdgeInsets.all(20),
            width: width,
            height: 100,
            color: Colors.green,
            child: const Text("hello world")),
        // SizeTransition(
        //   child: const Text("Hello world"),
        // ),
        ElevatedButton(
          onPressed: () {
            width = (width < 100) ? 400 : 0;
            rever = (rever < 100) ? 400 : 0;

            setState(() {});
          },
          child: const Text("Scale Up"),
        )
      ]),
    );
  }
}

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 1});
  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}
