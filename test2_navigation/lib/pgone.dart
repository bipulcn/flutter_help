import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('First Screen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "This is our first screen",
            style: TextStyle(fontSize: 33),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/");
              },
              child: const Text("Home page"))
        ],
      )),
    );
  }
}
