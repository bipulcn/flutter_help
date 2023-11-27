import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_charts/data/price_point.dart';
import 'package:test_charts/data/sector.dart';
import 'package:test_charts/widget/bar_chart_widget.dart';
import 'package:test_charts/widget/bar_charts.dart';
import 'package:test_charts/widget/line_chart_widget.dart';
import 'package:test_charts/widget/line_charts.dart';
import 'package:test_charts/widget/pie_chart_widget.dart';
import 'package:test_charts/widget/pie_chart_widget_two.dart';
import 'package:test_charts/widget/pie_charts.dart';
import 'package:test_charts/widget/scatterchart.dart';
import 'package:test_charts/widget/scatterchartcus.dart';

class Charthome extends StatefulWidget {
  const Charthome({super.key, required this.title});
  final String title;

  @override
  State<Charthome> createState() => _CharthomeState();
}

class _CharthomeState extends State<Charthome> {
  DataColumn dColumn(text) => DataColumn(
        label: Text(
          text,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      );

  List<String> pidata = ["10", "20", "7", "12", "25"];

  final _random = Random();

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

  Map<int, int> bpoint = {
    0: 45,
    1: 21,
    2: 88,
    3: 65,
    4: 74,
    5: 95,
    6: 65,
    7: 84,
    8: 35,
    9: 78,
    10: 93,
    11: 85,
  };
  Map<double, dynamic> lpoint = {
    1: 1.8,
    2: 1.9,
    3: 1.7,
    4: 3.2,
    5: 1.5,
    6: 1.8,
    7: 2.5,
  };
  Map<double, dynamic> ltpoint = {
    1: "23-3",
    2: "23-4",
    3: "23-5",
    4: "23-6",
    5: "23-7",
    6: "23-8",
    7: "23-9",
  };

  Map<double, List<double>> mapGen() {
    var rnd = Random();
    Map<double, List<double>> map = {};
    for (double a = 0; a < 30; a++) {
      map[a] = [
        rnd.nextInt(100).toDouble(),
        rnd.nextInt(100).toDouble(),
        5 + rnd.nextInt(15).toDouble()
      ];
    }
    return map;
  }

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
              LineChartCus(points: lpoint, titles: ltpoint),
              const SizedBox(height: 30),
              const Divider(),
              LineChartWidget(pricePoints),
              const Divider(),
              const SizedBox(height: 30),
              ScatterChartCus(values: mapGen()),
              const SizedBox(height: 30),
              const ScatterChartSample1(),
              const SizedBox(height: 30),
              BarChartCus(points: bpoint),
              const SizedBox(height: 50),
              PieChartWidget(sectors: industrySectors),
              const SizedBox(height: 50),
              PieChartcus(data: pidata),
              // const SizedBox(height: 50),
              // PieChartWidget(sectors: industrySectors),
              const SizedBox(height: 50),
              PieChartWidgetTwo(sectors: industrySectors),
              const SizedBox(height: 50),
              FittedBox(
                child: DataTable(
                  sortColumnIndex: 0,
                  columns: <DataColumn>[
                    dColumn('Color'),
                    dColumn('Title'),
                    dColumn('Value'),
                    dColumn('Parcent'),
                  ],
                  rows: industrySectors.map((e) => sectorData(e)).toList(),
                ),
              ),
              // Column(
              //   children: industrySectors
              //       .map<Widget>((sector) => SectorRow(sector))
              //       .toList(),
              // ),
              const Padding(padding: EdgeInsets.all(60)),
              BarChartWidget(points: pricePoints),
              const SizedBox(
                height: 30,
              ),
              ColoredBox(
                color: Colors.black38,
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.skewY(0.4)..rotateZ(-3.1458 / 12.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: const Color(0xFFE8581C),
                    child: const Text(
                      'Apartment for rent!',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow sectorData(sector) {
    return DataRow(cells: <DataCell>[
      DataCell(SizedBox(
          width: 16, child: CircleAvatar(backgroundColor: sector.color))),
      DataCell(Text(sector.title)),
      DataCell(Text('${sector.value.toStringAsFixed(2)}')),
      DataCell(Text('${sector.subtitle.toStringAsFixed(2)}%'))
    ]);
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
        const Spacer(),
        Text(sector.value.toStringAsFixed(2)),
        const Spacer(),
        Text(sector.subtitle.toStringAsFixed(2)),
      ],
    );
  }
}
