import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_list/data/user.dart';

class ListThree extends StatefulWidget {
  const ListThree({super.key});

  @override
  State<ListThree> createState() => _ListThreeState();
}

class _ListThreeState extends State<ListThree> {
  int test = 2;
  @override
  void initState() {
    super.initState();
    changeTest();
  }

  void changeTest() async {
    setState(() {
      test++;
    });
  }

  List userList = [];
  Future<void> readJson() async {
    final String response =
        await DefaultAssetBundle.of(context).loadString('assets/user.json');
    final data = await json.decode(response);
    setState(() {
      userList = data["items"];
      print("..number of items ${userList.length}");
      Map<String, dynamic> obj = new Map<String, dynamic>();
      obj['id'] = "p4";
      obj['name'] = "bipul";
      obj['email'] = "bipul@gmail.com";
      userList.add(obj);
    });
  }

  @override
  Widget build(BuildContext context) {
    // String objText =
    //     '{["name": "bezkoder", "email": "bezkoder@gmail.com"], ["name": "Jone", "email": "jone@gmail.com"]}';
    // // var encodedString = jsonEncode(objText);
    // final userMap = jsonDecode(objText) as Map<String, dynamic>;
    // final user = User.fromJson(userMap);

    // final data =
    //     context.inheritFromWidgetOfExactType(_InheritedStateContainer).asset;
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                leading: Text(userList[index]['id']),
                title: Text(userList[index]['name']),
                subtitle: Text(userList[index]['email'].toString()),
              ),
            ),
            TextButton(
                onPressed: () {
                  addRandom();
                },
                child: const Text("Add")),
            TextButton(
                onPressed: () {
                  for (int i = 0; i < 5; i++) {
                    addRandom();
                  }
                  // print(user.name);
                },
                child: const Text("Json Create")),
          ],
        ),
      ),
    );
  }

  void addRandom() {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    String str =
        List.generate(8, (index) => _chars[r.nextInt(_chars.length)]).join();
    print(str);
    Map<String, dynamic> obj = new Map<String, dynamic>();
    obj['id'] = "p4";
    obj['name'] = str;
    obj['email'] = str + "@gmail.com";
    setState(() {
      userList.add(obj);
    });
  }
}
