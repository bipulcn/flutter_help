import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/myprovider.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  Widget build(BuildContext context) {
    final myprov = Provider.of<MyProvider>(context);
    return Wrap(
      children: [Text("Hello its subpage")],
    );
  }
}
