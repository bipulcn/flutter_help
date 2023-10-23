import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  List<perInfo> person = [
    perInfo(name: "John", posi: 'Ass. Software Engineer'),
    perInfo(name: "Jahir", posi: 'Accounce'),
    perInfo(name: "Bipul", posi: 'Software Engineer'),
    perInfo(name: "Udoy", posi: 'Ass. Manager'),
  ];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 26, fontWeight: FontWeight.w100, color: Colors.white);
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
  List<Widget> widgetOptions = <Widget>[
    const ListOne(),
    const ListTwo(),
    const ListThree()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.title,
            style: optionStyle,
          ),
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.menu,
          //       color: Colors.white,
          //     )),
          actions: [
            _selectedIndex == 2
                ? Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      onPressed: () {
                        showDia();
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(),
          ],
          centerTitle: true,
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

  Future<dynamic> showDia() async {
    final prefs = await SharedPreferences.getInstance();
    final nameCon = TextEditingController();
    final desiCon = TextEditingController();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Info form"),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.black38)),
                    controller: nameCon,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        hintText: "Designation",
                        hintStyle: TextStyle(color: Colors.black38)),
                    controller: desiCon,
                  ),
                ]),
            actions: [
              TextButton(
                  onPressed: () async {
                    print("${nameCon.text} \n${desiCon.text}");
                    // Navigator.of(context).pop();
                    perInfo obj =
                        new perInfo(name: nameCon.text, posi: desiCon.text);
                    await prefs.setString("user", obj.name);
                  },
                  child: Text("Save"))
            ],
          );
        });
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _HomePageState data;
  _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class perInfo {
  String name;
  String posi;
  perInfo({required this.name, required this.posi});
}

class BtmTab {
  final String name;
  final IconData icon;
  BtmTab({required this.name, required this.icon});
}
