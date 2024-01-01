import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/myprovider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final myprov = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: Column(children: [
        Text("hello world"),
        Text("Well done working ${myprov.count}"),
      ]),
    );
  }
}
