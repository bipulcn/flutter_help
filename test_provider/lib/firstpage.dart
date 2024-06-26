import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/main.dart';
import 'package:test_provider/myprovider.dart';
import 'package:test_provider/subpage.dart';
import 'package:test_provider/thirdpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    // final myprov = Provider.of<MyProvider>(context);
    // final preprov = Provider.of<CounterProvider>(context);
    return Column(
      children: [
        Text("Well done working ${context.watch<MyProvider>().count}"),
        Text("Well done working ${context.watch<CounterProvider>().count}"),
        TextButton(
            onPressed: () {
              context.read<MyProvider>().increment();
            },
            child: const Text(
              "+",
              style: TextStyle(fontSize: 24),
            )),
        TextButton(
            onPressed: () {
              context.read<CounterProvider>().increment();
            },
            child: const Text("update parent")),
        FilledButton(
            onPressed: () {
              debugPrint("Not working");
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const ThirdPage())));
            },
            child: const Text("Go To second Page")),
        const SubPage(),
      ],
    );
  }
}
