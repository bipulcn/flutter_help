import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.tealAccent,
            title: const Text("Title"),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/pagetwo");
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_circle_right_outlined),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/pagethree");
                },
              )
            ]),
        body: const OneSubPage());
  }
}

class OneSubPage extends StatefulWidget {
  const OneSubPage({super.key});

  @override
  State<OneSubPage> createState() => _OneSubPageState();
}

class _OneSubPageState extends State<OneSubPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Text("Hello World"),
        ),
        Expanded(
          child: Container(
            height: 100,
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            "To use this class, make sure you set uses-material-design: true in your project's pubspec.yaml file in the flutter section.",
            textAlign: TextAlign.justify,
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            color: Colors.purpleAccent,
          ),
        ),
      ],
    );
  }
}
