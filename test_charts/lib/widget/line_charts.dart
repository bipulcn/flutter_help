import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCus extends StatefulWidget {
  const LineChartCus({super.key, required this.points, required this.titles});
  final Map<double, dynamic> points;
  final Map<double, dynamic> titles;
  @override
  State<LineChartCus> createState() => _LineChartCusState();
}

class _LineChartCusState extends State<LineChartCus> {
  final List<Color> gradientColors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: LineChart(
            duration: const Duration(milliseconds: 250),
            LineChartData(
              gridData: const FlGridData(
                show: true,
                drawVerticalLine: true,
              ),
              titlesData: ttlData,
              lineTouchData: lineTouchData1,
              borderData: borderData,
              lineBarsData: [
                LineChartBarData(
                  spots: widget.points.entries
                      .map((entry) => FlSpot(entry.key, entry.value.toDouble()))
                      .toList(),
                  isCurved: true,
                  dotData: const FlDotData(
                    show: true,
                  ),
                  isStrokeCapRound: true,
                  gradient: LinearGradient(
                    colors: gradientColors,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: gradientColors
                          .map((color) => color.withOpacity(0.25))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final Widget text = RotatedBox(
        quarterTurns: -1,
        child: Text(
          widget.titles[value.toInt()],
          style: const TextStyle(
            color: Color(0xff7589a2),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ));
    return SideTitleWidget(
      axisSide: AxisSide.bottom,
      space: 6,
      child: text,
    );
  }

  FlTitlesData get ttlData => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: bottomTitles,
          reservedSize: 42,
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: .25,
          reservedSize: 35,
        ),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
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

// class LineChartCus extends StatelessWidget {
//   final List<PricePoint> points;

  
// }
