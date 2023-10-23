import 'package:flutter/material.dart';
import 'package:test_list/pages/lsts/listone.dart';
import 'package:test_list/pages/lsts/listthree.dart';
import 'package:test_list/pages/lsts/listtwo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BtmTab> object = [
    BtmTab(name: "Home", icon: Icons.home),
    BtmTab(name: "Profile", icon: Icons.person),
    BtmTab(name: "Settings", icon: Icons.settings)
  ];
  List<Widget> widgetOptions = <Widget>[ListOne(), ListTwo(), ListThree()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple),
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: object
            .map<BottomNavigationBarItem>((e) => BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  label: e.name,
                ))
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class BtmTab {
  final String name;
  final IconData icon;
  BtmTab({required this.name, required this.icon});
}
