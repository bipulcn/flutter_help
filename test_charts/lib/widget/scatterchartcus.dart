import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScatterChartCus extends StatefulWidget {
  const ScatterChartCus({super.key, required this.values});
  final Map<double, List<double>> values;

  final blue1 = Colors.orange;
  final blue2 = Colors.blueGrey;

  @override
  State<StatefulWidget> createState() => ScatterChartCusState();
}

class ScatterChartCusState extends State<ScatterChartCus> {
  final maxX = 100.0;
  final maxY = 100.0;
  final radius = 30.0;

  bool showFlutter = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showFlutter = !showFlutter;
        });
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: ScatterChart(
          ScatterChartData(
            scatterSpots: fromMap(),
            borderData: FlBorderData(
              show: true,
            ),
            gridData: const FlGridData(
              show: true,
            ),
            titlesData: ttlData,
            scatterTouchData: ScatterTouchData(
              enabled: true,
            ),
          ),
          swapAnimationDuration: const Duration(milliseconds: 600),
          swapAnimationCurve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  FlTitlesData get ttlData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 30),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 35),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ));

  List<ScatterSpot> flutterLogoData() {
    return [
      /// section 1
      ScatterSpot(20, 14.5, color: widget.blue1, radius: radius),
      ScatterSpot(22, 16.5, color: widget.blue1, radius: radius),
      ScatterSpot(24, 18.5, color: widget.blue1, radius: radius),
    ];
  }

  List<ScatterSpot> fromMap() {
    var rnd = Random();
    return widget.values.entries
        .map((e) => ScatterSpot(e.value[0], e.value[1],
            radius: e.value[2],
            color: Color.fromRGBO(rnd.nextInt(255), rnd.nextInt(255),
                rnd.nextInt(255), 0.5 + (20 - e.value[2]) / 40)))
        .toList();
  }

  List<ScatterSpot> randomData() {
    const blue1Count = 21;
    const blue2Count = 20;
    return List.generate(blue1Count + blue2Count, (i) {
      Color color;
      if (i < blue1Count) {
        color = widget.blue1;
      } else {
        color = widget.blue2;
      }

      return ScatterSpot(
        (Random().nextDouble() * (maxX - 8)) + 4,
        (Random().nextDouble() * (maxY - 8)) + 4,
        color: color,
        radius: (Random().nextDouble() * 16) + 4,
      );
    });
  }
}
