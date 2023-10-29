import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _selectedIndex = 0;
  double groupAlignment = -1.0;
  Future<void> saveData() async {
    final SharedPreferences prefs = await _prefs;
    Map<String, dynamic> selectedTimes = {
      "Pomodoro": 15,
      "Rest_Time": 5,
      "Long_Rest_Time": 15,
      "Term_of_Resting_Time": 5
    };
    String encodedMap = json.encode(selectedTimes);
    print(encodedMap);
    setState(() {
      prefs.setString("timeData", encodedMap);
    });
    // _prefs.setString('timeData', encodedMap);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            groupAlignment: groupAlignment,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text("First")),
              NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Second')),
              NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Third')),
            ],
          ),
          const VerticalDivider(thickness: 1),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Page $_selectedIndex'),
                  const Divider(thickness: 1),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      Map<String, dynamic> selectedTimes =
                          json.decode(prefs.getString("timeData").toString());
                      print(selectedTimes['Pomodoro']);
                    },
                    child: const Text("Save"),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    onPressed: saveData,
                    child: const Icon(Icons.save),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: SizedBox(
                      width: 200,
                      height: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
