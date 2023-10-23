import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_charts/data/price_point.dart';

class LineChartWidget extends StatelessWidget {
  final List<PricePoint> points;

  LineChartWidget(this.points, {Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    Colors.cyan,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        duration: const Duration(milliseconds: 250),
        LineChartData(
          gridData: const FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 0.2,
            verticalInterval: 1,
          ),
          titlesData: titlesData,
          lineTouchData: lineTouchData1,
          borderData: borderData,
          minX: -1,
          maxX: 12,
          maxY: 1.2,
          minY: -.2,
          lineBarsData: [
            LineChartBarData(
              spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
              isCurved: true,
              dotData: const FlDotData(
                show: false,
              ),
              isStrokeCapRound: true,
              gradient: LinearGradient(
                colors: gradientColors,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FlTitlesData get titlesData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 2,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: .25,
          reservedSize: 35,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ));

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color.fromARGB(255, 70, 71, 55), width: 1),
          left: BorderSide(color: Color.fromARGB(255, 45, 46, 34), width: 1),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor:
              const Color.fromARGB(255, 51, 51, 50).withOpacity(0.8),
        ),
      );
}
