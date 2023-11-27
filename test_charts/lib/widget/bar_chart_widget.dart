import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_charts/data/price_point.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key, required this.points}) : super(key: key);

  final List<PricePoint> points;

  @override
  State<BarChartWidget> createState() =>
      _BarChartWidgetState(points: this.points);
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final List<PricePoint> points;

  _BarChartWidgetState({required this.points});

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
              horizontalInterval: 0.2,
              verticalInterval: 0.1),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(tooltipBgColor: Colors.grey),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return points
        .map(
          (point) => BarChartGroupData(
            x: point.x.toInt(),
            barRods: [
              BarChartRodData(
                toY: point.y,
                color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
                // borderSide: const BorderSide(color: Colors.grey),
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

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Jan';
              break;
            case 2:
              text = 'Mar';
              break;
            case 4:
              text = 'May';
              break;
            case 6:
              text = 'Jul';
              break;
            case 8:
              text = 'Sep';
              break;
            case 10:
              text = 'Nov';
              break;
          }

          return Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          );
        },
      );
}
