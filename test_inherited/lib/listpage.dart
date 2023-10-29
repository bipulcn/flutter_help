import 'package:flutter/material.dart';
import 'package:test_inherited/main.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: ListObject.of(context).lsts.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(
                  ListObject.of(context).lsts[index],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
      // ListView(
      //   shrinkWrap: true,
      //   padding: const EdgeInsets.all(20.0),

      //   children: [Text("hello"), Text("world")],
      // ),
    );
  }
}
