import 'package:flutter/material.dart';

class ListFirstPage extends StatefulWidget {
  const ListFirstPage({super.key});

  @override
  State<ListFirstPage> createState() => _ListFirstPageState();
}

class _ListFirstPageState extends State<ListFirstPage> {
  List<FruitInfo> items = [FruitInfo('apple', 1.5, 2.3)];
  void _refreshList() {
    items.add(FruitInfo('banana', 3.0, 1.0));
    setState(() {});
  }

  void _reloadList() {
    items.add(FruitInfo('orange', 1.5, 2.0));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("data"),
          backgroundColor: Colors.tealAccent.shade400,
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    items[index].name[0].toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                title: Text(items[index].name.toUpperCase()),
                subtitle:
                    Text("${items[index].price}\$ ${items[index].size}cm"),
                onTap: () {
                  debugPrint("hello");
                },
                trailing: IconButton(
                    onPressed: () {
                      items.removeAt(index);
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove_circle)),
              );
            }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _refreshList,
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _reloadList,
              child: const Icon(Icons.receipt_long),
            )
          ],
        ));
  }
}

class FruitInfo {
  String name;
  double size;
  double price;

  FruitInfo(this.name, this.size, this.price);
}
