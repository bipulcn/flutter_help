import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_blocs/provide/cusprovider.dart';

class ProvSubpage extends StatefulWidget {
  const ProvSubpage({super.key});

  @override
  State<ProvSubpage> createState() => _ProvSubpageState();
}

class _ProvSubpageState extends State<ProvSubpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "This is provider subpage We will check value and change it from here",
          textAlign: TextAlign.center,
        ),
        Text("${context.watch<CusProvider>().name}"),
        ElevatedButton(
            onPressed: () {
              context.read<CusProvider>().changeName("Bipul");
            },
            child: Text("Change to Bipul")),
      ],
    ));
  }
}
