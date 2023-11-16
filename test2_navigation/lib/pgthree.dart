import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Third Screen'),
      ),
      body: const Center(
        child: Text(
          "This is our third screen",
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}
