import 'package:flutter/material.dart';

class ListSecondPage extends StatefulWidget {
  const ListSecondPage({super.key});

  @override
  State<ListSecondPage> createState() => _ListSecondPageState();
}

class _ListSecondPageState extends State<ListSecondPage> {
  List<Item> items = [
    Item(name: 'Apple', price: 0.99),
    Item(name: 'Banana', price: 0.58),
    Item(name: 'Orange', price: 0.79)
  ];
  void _sortByName() {
    items.sort((a, b) => a.name.compareTo(b.name));
    setState(() {});
  }

  void _sortByPrice() {
    items.sort((a, b) => a.price.compareTo(b.price));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Colors.brown.shade400,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(items[index].name),
          subtitle: Text(items[index].price.toString()),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: _sortByName,
            child: const Icon(Icons.sort_by_alpha),
          ),
          FloatingActionButton(
            onPressed: _sortByPrice,
            child: const Icon(Icons.sort_outlined),
          )
        ],
      ),
    );
  }
}

class Item {
  final String name;
  final double price;
  Item({required this.name, required this.price});
}
