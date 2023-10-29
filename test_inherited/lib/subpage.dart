import 'package:flutter/material.dart';
import 'package:test_inherited/main.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello Frog',
        style: TextStyle(color: FrogColor.of(context).color),
      ),
    );
  }
}
