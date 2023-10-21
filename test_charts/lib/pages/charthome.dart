import 'package:flutter/material.dart';
import 'package:test_charts/data/price_point.dart';
import 'package:test_charts/data/sector.dart';
import 'package:test_charts/widget/bar_chart_widget.dart';
import 'package:test_charts/widget/line_chart_widget.dart';
import 'package:test_charts/widget/pie_chart_widget.dart';

class Charthome extends StatefulWidget {
  const Charthome({super.key, required this.title});
  final String title;

  @override
  State<Charthome> createState() => _CharthomeState();
}

class _CharthomeState extends State<Charthome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LineChartWidget(pricePoints),
              PieChartWidget(industrySectors),
              Column(
                children: industrySectors
                    .map<Widget>((sector) => SectorRow(sector))
                    .toList(),
              ),
              const Padding(padding: EdgeInsets.all(60)),
              BarChartWidget(points: pricePoints),
            ],
          ),
        ),
      ),
    );
  }
}

class SectorRow extends StatelessWidget {
  const SectorRow(this.sector, {Key? key}) : super(key: key);
  final Sector sector;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          child: CircleAvatar(
            backgroundColor: sector.color,
          ),
        ),
        const Spacer(),
        Text(sector.title),
      ],
    );
  }
}
