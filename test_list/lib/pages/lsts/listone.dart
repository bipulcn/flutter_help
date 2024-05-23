import 'package:flutter/material.dart';

class ListOne extends StatefulWidget {
  const ListOne({super.key});

  @override
  State<ListOne> createState() => _ListOneState();
}

class _ListOneState extends State<ListOne> {
  List<Category> categories = [
    Category(name: 'Fashions'),
    Category(name: 'Electronics'),
    Category(name: 'Home Appliances'),
  ];
  int selectedIndex = 0;

  final List<int> colorCodes = <int>[300, 200, 100];
  final List<Color> color = <Color>[
    Colors.black87,
    Colors.black54,
    Colors.black54
  ];

  void _shortByName() {
    categories.sort((a, b) => a.name.compareTo(b.name));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.amber[colorCodes[index]],
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          categories[index].name,
                          style: TextStyle(color: color[index], fontSize: 24),
                        ),
                        const Text(
                          "Hello world",
                          style: TextStyle(fontSize: 20, color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                );
              })),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            _shortByName();
          },
          child: const Icon(Icons.upcoming),
        )
      ]),
    );
  }
}

class Category {
  String name;
  Category({required this.name});
}

// List<Category> categories = [
//   Category(name: 'Electronics'),
//   Category(name: 'Fashions'),
//   Category(name: 'Home Appliances'),
// ];
