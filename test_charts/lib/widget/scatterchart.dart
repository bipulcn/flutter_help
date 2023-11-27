import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScatterChartSample1 extends StatefulWidget {
  const ScatterChartSample1({super.key});

  final blue1 = Colors.orange;
  final blue2 = Colors.blueGrey;

  @override
  State<StatefulWidget> createState() => ScatterChartSample1State();
}

class ScatterChartSample1State extends State<ScatterChartSample1> {
  final maxX = 50.0;
  final maxY = 50.0;
  final radius = 8.0;

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
            scatterSpots: showFlutter ? flutterLogoData() : randomData(),
            minX: 0,
            maxX: maxX,
            minY: 0,
            maxY: maxY,
            borderData: FlBorderData(
              show: true,
            ),
            gridData: const FlGridData(
              show: true,
            ),
            titlesData: const FlTitlesData(
              show: true,
            ),
            scatterTouchData: ScatterTouchData(
              enabled: false,
            ),
          ),
          swapAnimationDuration: const Duration(milliseconds: 600),
          swapAnimationCurve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  List<ScatterSpot> flutterLogoData() {
    return [
      /// section 1
      ScatterSpot(20, 14.5, color: widget.blue1, radius: radius),
      ScatterSpot(22, 16.5, color: widget.blue1, radius: radius),
      ScatterSpot(24, 18.5, color: widget.blue1, radius: radius),
    ];
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
