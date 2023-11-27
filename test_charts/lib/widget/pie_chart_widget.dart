import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_charts/data/sector.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key, required this.sectors}) : super(key: key);

  final List<Sector> sectors;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState(sectors: sectors);
}

class _PieChartWidgetState extends State<PieChartWidget> {
  final List<Sector> sectors;

  _PieChartWidgetState({required this.sectors});
  int touchedIndex = -1;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: PieChart(PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          sections: _chartSections(widget.sectors),
          centerSpaceRadius: 45.0,
          borderData: FlBorderData(show: true),
          startDegreeOffset: 0,
          sectionsSpace: 0,
        )));
  }

  double next(int min, int max) => _random.nextDouble() * (max - min) + min;

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      double radius = 70.0 + sector.value / 2.5;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: '',
      );
      list.add(data);
    }
    return list;
  }
}
