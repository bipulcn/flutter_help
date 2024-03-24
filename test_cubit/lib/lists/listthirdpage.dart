import 'package:flutter/material.dart';

class ListThirdPage extends StatefulWidget {
  const ListThirdPage({super.key});

  @override
  State<ListThirdPage> createState() => _ListThirdPageState();
}

class _ListThirdPageState extends State<ListThirdPage> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 8, 9, 10];
  void _reset() {
    numbers.clear();
    numbers = [1, 2, 3, 4, 5, 6, 8, 9, 10];
    setState(() {});
  }

  void _double() {
    List<int> doubleNum = numbers.map((int nums) => (nums * 2)).toList();
    numbers.clear();
    numbers = doubleNum;
    setState(() {});
  }

  void _evenLst() {
    List<int> result = numbers.where((int nums) => nums % 2 == 0).toList();
    numbers.clear();
    numbers = result;
    setState(() {});
  }

  void _fold() {
    int result = numbers.fold(0, (int acc, int num) => acc + num);
    numbers.add(result);
    setState(() {});
  }

  void _reduce() {
    int result = numbers.reduce((int acc, int num) => acc + num);
    numbers.add(result);
    setState(() {});
  }

  void _suffle() {
    numbers.shuffle();
    setState(() {});
  }

  void _sorts() {
    numbers.sort();
    setState(() {});
  }

  void _anyevery() {
    bool hasEven = numbers.any((nums) => nums.isEven);
    bool everyEven = numbers.every((nums) => nums.isEven);
    numbers.add(hasEven == true ? 1 : 0);
    numbers.add(everyEven == true ? 1 : 0);
    setState(() {});
  }

  void _toList() {
    Set<int> uniqueNumbers = {1, 2, 3, 4, 5};
    numbers.clear();
    numbers = uniqueNumbers.toList();
    setState(() {});
  }

  void _takeSkip() {
    List<int> firstThree = numbers.take(3).toList();
    List<int> withoutFirstTwo = numbers.skip(5).toList();

    numbers.clear();
    numbers.addAll(firstThree);
    numbers.addAll(withoutFirstTwo);
    setState(() {});
  }

  // List also works with
  // contains, indexOf, lastIndexOf, join, clear, replaceRange, insert, insertAll, remove, removeWhere, sublist, shuffle, first, last, getRange, replaceFirst, replaceFirstWhere, removeRange, sort, asmap, expand, firstWhere, lastWhere, and, every

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Colors.lime.shade800,
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) => ListTile(
            title: Text(
          numbers[index].toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: _reset, child: const Icon(Icons.restore)),
          FloatingActionButton(
              onPressed: _double, child: const Icon(Icons.one_k)),
          FloatingActionButton(
              onPressed: _evenLst, child: const Icon(Icons.two_k)),
          FloatingActionButton(
              onPressed: _fold, child: const Icon(Icons.three_k)),
          FloatingActionButton(
              onPressed: _reduce, child: const Icon(Icons.four_k)),
          FloatingActionButton(
              onPressed: _suffle, child: const Icon(Icons.four_k)),
          FloatingActionButton(
              onPressed: _sorts, child: const Icon(Icons.four_k)),
          FloatingActionButton(
              onPressed: _anyevery, child: const Icon(Icons.four_k)),
          FloatingActionButton(
              onPressed: _toList, child: const Icon(Icons.four_k)),
          FloatingActionButton(
              onPressed: _takeSkip, child: const Icon(Icons.four_k)),
        ],
      ),
    );
  }
}
