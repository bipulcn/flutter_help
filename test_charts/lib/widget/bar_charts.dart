import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartCus extends StatefulWidget {
  const BarChartCus({Key? key, required this.points}) : super(key: key);

  final Map<int, int> points;

  @override
  State<BarChartCus> createState() => _BarChartCusState();
}

class _BarChartCusState extends State<BarChartCus> {
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          // alignment: BarChartAlignment.spaceBetween,
          barGroups: _chartGroups(),
          borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide())),
          gridData: const FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 10,
              verticalInterval: 1),
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(tooltipBgColor: Colors.grey),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return widget.points.entries
        .map(
          (e) => BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                toY: e.value.toDouble(),
                color: Color.fromRGBO(100 + _random.nextInt(155),
                    100 + _random.nextInt(155), 100 + _random.nextInt(155), 1),
                width: 10,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 1.0,
                  color: const Color.fromARGB(48, 158, 158, 158),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
