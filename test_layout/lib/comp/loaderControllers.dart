import 'package:flutter/material.dart';

Widget customLoaders() {
  // Constants constants = Constants();

  return Center(
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(15)),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 172, 243, 5),
        ),
      ),
    ),
  );
}
