import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/main.dart';
import 'package:test_provider/myprovider.dart';
import 'package:test_provider/secondpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final myprov = Provider.of<MyProvider>(context);
    final preprov = Provider.of<CounterProvider>(context);
    return Column(
      children: [
        Text("Well done working ${myprov.count}"),
        TextButton(
            onPressed: () {
              myprov.increment();
            },
            child: const Text("Increment")),
        TextButton(
            onPressed: () {
              preprov.increment();
            },
            child: const Text("update parent")),
        FilledButton(
            onPressed: () {
              debugPrint("Not working");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ChangeNotifierProvider(
                          create: (context) => MyProvider(),
                          child: const SecondPage()))));
            },
            child: const Text("Go To second Page"))
      ],
    );
  }
}
