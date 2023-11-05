import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Two"),
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_circle_left_outlined),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/pageone");
            }),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_circle_right_outlined),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/pagethree");
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        width: double.infinity,
        height: double.infinity,
        child: const Text("Hello world"),
      ),
    );
  }
}
