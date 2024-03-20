import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Map<String, dynamic> _value = <String, dynamic>{};
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _value.isNotEmpty
              ? Text(
                  "Pomodoro: ${_value['Pomodoro']}\nRest Time: ${_value['Rest_Time']}\nLong Rest Time: ${_value['Long_Rest_Time']}\nTerm of Resting Time: ${_value['Term_of_Resting_Time']}")
              : const Text("No Data"),
          Divider(
            thickness: 4,
            color: Colors.blueAccent.shade100,
          ),
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
              setState(() {
                _value = selectedTimes;
              });
              print(selectedTimes['Pomodoro']);
            },
            child: const Text("Load"),
          ),
        ],
      ),
    );
  }
}
