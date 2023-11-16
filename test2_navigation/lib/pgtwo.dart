import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Second Screen',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: "This is",
                  style: TextStyle(fontSize: 25),
                ),
                TextSpan(
                  text: "\nour",
                  style: TextStyle(fontSize: 35),
                ),
                TextSpan(
                  text: "\nsecond screen",
                  style: TextStyle(fontSize: 45),
                ),
              ], style: TextStyle(color: Colors.blue)),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text("Go To Third page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/first'));
                // Navigator.pushNamed(context, '/first');
              },
              child: const Text("Go To page one"),
            ),
          ],
        ),
      ),
    );
  }
}
