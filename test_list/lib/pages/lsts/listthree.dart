import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

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
      Map<String, dynamic> obj = <String, dynamic>{};
      obj['id'] = "p4";
      obj['name'] = "bipul";
      obj['email'] = "bipul@gmail.com";
      userList.add(obj);
    });
  }

  List<PersonInfo> pinfo = [];
  void addToInfo() {
    var r = Random();
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    String str =
        List.generate(8, (index) => chars[r.nextInt(chars.length)]).join();
    pinfo.add(PersonInfo('id4', str, "$str@gmail.com"));
    print(pinfo.length);
    print(pinfo[0].name);
    setState(() {});
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
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: pinfo.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          leading: Text(pinfo[index].id),
          title: Text(pinfo[index].name),
          subtitle: Text(pinfo[index].email.toString()),
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            onPressed: addRandom, child: const Icon(Icons.nat)),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {
            // addRandom();
            addToInfo();
          },
          child: const Icon(Icons.add),
        )
      ]),
    );
  }

  void addRandom() {
    var r = Random();
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    String str =
        List.generate(8, (index) => chars[r.nextInt(chars.length)]).join();
    Map<String, dynamic> obj = <String, dynamic>{};
    obj['id'] = "p4";
    obj['name'] = str;
    obj['email'] = "$str@gmail.com";
    setState(() {
      userList.add(obj);
    });
  }
}

class PersonInfo {
  String id;
  String name;
  String email;
  PersonInfo(this.id, this.name, this.email);
}
