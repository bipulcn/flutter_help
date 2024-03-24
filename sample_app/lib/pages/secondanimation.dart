import 'package:flutter/material.dart';

class SecondAnimation extends StatefulWidget {
  const SecondAnimation({super.key});

  @override
  State<SecondAnimation> createState() => _SecondAnimationState();
}

class _SecondAnimationState extends State<SecondAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;
  double targetValue = 24.0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(_controller);
    _sizeAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 100.0, end: 200.0), weight: 1),
      TweenSequenceItem(
          tween: Tween<double>(begin: 200.0, end: 100.0), weight: 1)
    ]).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Container(
              height: _sizeAnimation.value,
              width: _sizeAnimation.value,
              color: _colorAnimation.value,
            );
          }),
      TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: targetValue),
        duration: const Duration(seconds: 1),
        builder: (BuildContext context, double size, Widget? child) {
          return IconButton(
            iconSize: size,
            color: Colors.blue,
            icon: child!,
            onPressed: () {
              setState(() {
                targetValue = targetValue == 24.0 ? 48.0 : 24.0;
              });
            },
          );
        },
        child: const Icon(Icons.aspect_ratio),
      ),
      // ElevatedButton(
      //     onPressed: () {
      //       _controller.forward();
      //     },
      //     child: const Icon(Icons.play_arrow))
    ]));
  }
}
