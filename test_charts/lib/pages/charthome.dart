import 'package:flutter/material.dart';
import 'package:test_charts/data/price_point.dart';
import 'package:test_charts/data/sector.dart';
import 'package:test_charts/widget/bar_chart_widget.dart';
import 'package:test_charts/widget/line_chart_widget.dart';
import 'package:test_charts/widget/pie_chart_widget.dart';
import 'package:test_charts/widget/pie_chart_widget_two.dart';

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
              PieChartWidget(sectors: industrySectors),
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
