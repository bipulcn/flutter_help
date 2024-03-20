import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartcus extends StatefulWidget {
  final List<String> data;
  const PieChartcus({Key? key, required this.data}) : super(key: key);

  @override
  State<PieChartcus> createState() => _PieChartcusState(data: data);
}

class _PieChartcusState extends State<PieChartcus> {
  final List<String> data;
  _PieChartcusState({required this.data});
  Random random = Random();
  List<PieChartSectionData> piedata = [];
  // const PieChart({super.key, required this.obj});
  @override
  void initState() {
    for (var i = 0; i < data.length; i++) {
      piedata.add(PieChartSectionData(
          value: double.parse(data[i]),
          title: data[i],
          color: Color.fromRGBO(
            100 + random.nextInt(155),
            100 + random.nextInt(155),
            100 + random.nextInt(155),
            1,
          ),
          radius: 80 + int.parse(data[i]) * 0.75));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(PieChartData(
        sections: piedata,
        sectionsSpace: 0,
        centerSpaceRadius: 45.0,
      )),
    );
  }
}
