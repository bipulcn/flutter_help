import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListThree extends StatefulWidget {
  const ListThree({super.key});

  @override
  State<ListThree> createState() => _ListThreeState();
}

class _ListThreeState extends State<ListThree> {
  // final prefs = SharedPreferences.getInstance();
  int test = 2;
  @override
  void initState() {
    super.initState();
    changeTest();
  }

  void changeTest() {
    setState(() {
      test++;
    });
  }
  // What is inherit widget
  // What is key how to use keys

  @override
  Widget build(BuildContext context) {
    // final data =
    //     context.inheritFromWidgetOfExactType(_InheritedStateContainer).asset;
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     itemCount: widget.personInfo.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         padding: const EdgeInsets.all(10),
            //         child: Text(widget.personInfo[index].name),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}

class perInfo {
  String name;
  String posi;
  perInfo({required this.name, required this.posi});
}
