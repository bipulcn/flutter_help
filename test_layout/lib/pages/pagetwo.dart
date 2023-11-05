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
        body: const SubChildPage());
  }
}

class SubChildPage extends StatefulWidget {
  const SubChildPage({super.key});

  @override
  State<SubChildPage> createState() => _SubChildPageState();
}

class _SubChildPageState extends State<SubChildPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // it bounds the Listview to be in appropriate height
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150,
                color: Colors.green,
              ),
              Container(
                width: 150,
                color: Colors.blue,
              ),
              Container(
                width: 150,
                color: Colors.red,
              ),
              Container(
                width: 150,
                color: Colors.orange,
              ),
              Container(
                width: 150,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
        const Card(
          color: Colors.orange,
          elevation: 10,
          child: Padding(padding: EdgeInsets.all(20), child: Text("data")),
        ),
        const Text("data")
      ],
    );
  }
}
