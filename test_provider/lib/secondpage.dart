import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/main.dart';
import 'package:test_provider/myprovider.dart';
import 'package:test_provider/subpage.dart';
import 'package:test_provider/thirdpage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    // final myprov = Provider.of<MyProvider>(context);
    // final preprov = Provider.of<CounterProvider>(context);
    return Column(
      children: [
        Text("Well done working ${context.watch<CounterProvider>().count}"),
        Text("Well done working ${context.watch<MyProvider>().count}"),
        TextButton(
            onPressed: () {
              context.read<MyProvider>().increment();
            },
            child: const Text(
              "+",
              style: TextStyle(fontSize: 24),
            )),
        TextButton(onPressed: () {}, child: const Text("update parent")),
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
