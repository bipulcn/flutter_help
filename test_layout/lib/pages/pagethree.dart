import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Three"),
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, "/pageone");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/pagetwo");
            },
          )
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
