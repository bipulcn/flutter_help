import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/myprovider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final myprov = Provider.of<MyProvider>(context);
    return Column(
      children: [Text("Well done working ${myprov.count}")],
    );
  }
}
