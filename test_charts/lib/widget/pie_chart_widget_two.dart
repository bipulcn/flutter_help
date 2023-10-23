import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_charts/data/sector.dart';

class PieChartWidgetTwo extends StatefulWidget {
  const PieChartWidgetTwo({Key? key, required this.sectors}) : super(key: key);

  final List<Sector> sectors;

  @override
  State<PieChartWidgetTwo> createState() =>
      _PieChartWidgetTwoState(sectors: this.sectors);
}

class _PieChartWidgetTwoState extends State<PieChartWidgetTwo> {
  final List<Sector> sectors;

  _PieChartWidgetTwoState({required this.sectors});
  int touchedIndex = -1;
  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Expanded(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: PieChart(
            PieChartData(
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
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(197, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listWidget(widget.sectors),
        ),
      ),
    ]);
  }

  double next(int min, int max) => _random.nextDouble() * (max - min) + min;
  List<Widget> listWidget(List<Sector> sectors) {
    final List<Widget> list = [];
    for (var sector in sectors) {
      Widget ind = Row(children: [
        Container(
          width: 10,
          height: 10,
          color: sector.color,
        ),
        const SizedBox(width: 10),
        Text(
          sector.title,
          style: TextStyle(fontSize: 16),
        )
      ]);
      list.add(ind);
    }
    return list;
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      double radius = 90.0;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: '${sector.subtitle.toStringAsFixed(1)}%',
        titleStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 5)
          ],
        ),
      );
      list.add(data);
    }
    return list;
  }
}
