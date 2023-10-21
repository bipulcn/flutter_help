import 'package:flutter/material.dart';

class ListOne extends StatefulWidget {
  const ListOne({super.key});

  @override
  State<ListOne> createState() => _ListOneState();
}

class _ListOneState extends State<ListOne> {
  List<Category> categories = [
    Category(name: 'Electronics'),
    Category(name: 'Fashions'),
    Category(name: 'Home Appliances'),
  ];
  int selectedIndex = 0;

  final List<int> colorCodes = <int>[600, 500, 100];
  final List<Color> color = <Color>[Colors.white, Colors.white, Colors.black54];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(
                    child: Text(
                  categories[index].name,
                  style: TextStyle(color: color[index], fontSize: 24),
                )),
              );
            }));
  }
}

class Category {
  String name;
  Category({required this.name});
}

List<Category> categories = [
  Category(name: 'Electronics'),
  Category(name: 'Fashions'),
  Category(name: 'Home Appliances'),
];
