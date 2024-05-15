import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_blocs/bloc/bloc/blocclass.dart';

class BlocSubPage extends StatefulWidget {
  const BlocSubPage({super.key});

  @override
  State<BlocSubPage> createState() => _BlocSubPageState();
}

class _BlocSubPageState extends State<BlocSubPage> {
  @override
  Widget build(BuildContext context) {
    var lst = context.watch<BlocClass>().name;
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Container(
          padding: EdgeInsets.all(40),
          color: Colors.blueGrey.shade100,
          child: Text("Hello world"),
        ),
        Container(
          padding: EdgeInsets.all(40),
          color: Colors.blueGrey.shade200,
          child: Column(
            children: [for (int i = 0; i < lst.length; i++) Text("${lst[i]}")],
          ),
        )
      ],
    );
  }
}
