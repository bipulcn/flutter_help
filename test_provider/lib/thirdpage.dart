import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/main.dart';
import 'package:test_provider/myprovider.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    // final myprov = Provider.of<MyProvider>(context);
    // final preprov = Provider.of<CounterProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Third Page")),
        body: Container(
            child: Column(children: [
          const Text("hello world"),
          Text("Well done working ${context.watch<MyProvider>().count}"),
          Text("Well done working ${context.watch<CounterProvider>().count}"),
        ])));
  }
}
