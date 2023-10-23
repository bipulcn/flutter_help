import 'dart:math';

import 'package:flutter/material.dart';

class Sector {
  final Color color;
  final double value;
  final double subtitle;
  final String title;

  Sector(
      {required this.color,
      required this.value,
      required this.subtitle,
      required this.title});
}

List<double> get randomNumbers {
  final Random random = Random();
  final rNumbers = <double>[];
  for (var i = 1; i <= 7; i++) {
    double rnum = random.nextDouble() * 100;
    rNumbers.add(rnum);
  }
  return rNumbers;
}

List<double> percent(data) {
  final percent = <double>[];
  double sum = 0.0;
  for (var i = 0; i < 7; i++) {
    sum += data[i];
  }
  for (var i = 0; i < 7; i++) {
    percent.add(((data[i] / sum) * 100));
  }
  return percent;
}

List<Sector> get industrySectors {
  final rvalue = randomNumbers;
  final prcent = percent(rvalue);
  return [
    Sector(
        color: Colors.redAccent,
        value: rvalue[0],
        subtitle: prcent[0],
        title: 'IT'),
    Sector(
        color: Colors.blue,
        value: rvalue[1],
        subtitle: prcent[1],
        title: 'Automobile'),
    Sector(
        color: Colors.deepPurpleAccent,
        value: rvalue[2],
        subtitle: prcent[2],
        title: 'Food'),
    Sector(
        color: Colors.cyan,
        value: rvalue[3],
        subtitle: prcent[3],
        title: 'Finance'),
    Sector(
        color: Colors.black45,
        value: rvalue[4],
        subtitle: prcent[4],
        title: 'Energy'),
    Sector(
        color: Colors.orange,
        value: rvalue[5],
        subtitle: prcent[5],
        title: 'Agriculture'),
    Sector(
        color: Colors.teal,
        value: rvalue[6],
        subtitle: prcent[6],
        title: 'Pharma'),
  ];
}
