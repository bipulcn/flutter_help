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
          margin: const EdgeInsets.symmetric(vertical: 5),
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
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "data",
                style: TextStyle(color: Colors.white),
              )),
        ),
        createTable(),
      ],
    );
  }

  Widget createTable() {
    TextStyle tst = const TextStyle(fontWeight: FontWeight.bold);

    List<TableRow> rows = [];
    rows.add(TableRow(children: [
      Text("Number", style: tst, textAlign: TextAlign.center),
      Text("Squared", style: tst, textAlign: TextAlign.center),
      Text("Cubed", style: tst, textAlign: TextAlign.center)
    ]));
    for (int i = 0; i < 25; ++i) {
      rows.add(TableRow(children: [
        Text(i.toString(), textAlign: TextAlign.center),
        Text((i * i).toString(), textAlign: TextAlign.center),
        Text((i * i * i).toString(), textAlign: TextAlign.center),
      ]));
    }
    return Expanded(child: Table(children: rows));
  }
}
