import 'package:flutter/material.dart';
import 'package:test_layout/comp/loaderControllers.dart';

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
      body: const OneSubPage(),
    );
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
        Wrap(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 6,
              color: Colors.blueAccent,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.limeAccent,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 3,
              color: Colors.redAccent,
              child: customLoaders(),
            ),
            Container(width: 150, height: 100, color: Colors.indigoAccent),
            Container(width: 150, height: 100, color: Colors.orange),
            Container(
                width: MediaQuery.of(context).size.width - 300,
                height: 100,
                color: Colors.blueAccent),
            Container(width: 100, height: 100, color: Colors.greenAccent),
            Container(
                width: MediaQuery.of(context).size.width - 220,
                height: 100,
                color: Colors.amber),
            Container(width: 120, height: 100, color: Colors.blueGrey),
            // Expanded(   // only works with Flex, column, row
            //   child: Container(
            //     height: 100,
            //     color: Colors.greenAccent,
            //   ),
            // ),
          ],
        ),
        Divider(),
        Flex(
          direction: Axis.horizontal,
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.pinkAccent,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 3,
              color: Colors.cyanAccent,
            ),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.purple,
              ),
            ),
          ],
        ),
        Divider(),
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
            child: Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                color: Colors.black26,
                child: Text("hello world"),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              color: Colors.redAccent,
            )
          ],
        )),
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
