import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SalesGraph extends StatefulWidget {
  @override
  _SalesGraphState createState() => _SalesGraphState();
}

class _SalesGraphState extends State<SalesGraph> {
  List<_SalesData> filledCylinder = [
    _SalesData('Jan', 20),
    _SalesData('Feb', 38),
    _SalesData('Mar', 24),
    _SalesData('Apr', 42),
    _SalesData('May', 50),
    _SalesData('Jun', 20),
    _SalesData('Jul', 15),
    _SalesData('Aug', 38),
    _SalesData('Sep', 44),
    _SalesData('Oct', 22),
    _SalesData('Nov', 30),
    _SalesData('Dec', 18),
  ];
  List<_SalesData> emptyCylinder = [
    _SalesData('Jan', 50),
    _SalesData('Feb', 28),
    _SalesData('Mar', 14),
    _SalesData('Apr', 62),
    _SalesData('May', 10),
    _SalesData('Jun', 20),
    _SalesData('Jul', 25),
    _SalesData('Aug', 48),
    _SalesData('Sep', 64),
    _SalesData('Oct', 12),
    _SalesData('Nov', 10),
    _SalesData('Dec', 28),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(
                  text: 'Sales analysis',
                  textStyle: TextStyle(
                      color: Colors.deepPurple[400],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  alignment: ChartAlignment.near),
              // Enable legend
              legend: Legend(isVisible: true, position: LegendPosition.bottom),

              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    color: Colors.green,
                    dataSource: filledCylinder,
                    xValueMapper: (_SalesData filledCylinder, _) =>
                        filledCylinder.year,
                    yValueMapper: (_SalesData filledCylinder, _) =>
                        filledCylinder.sales,
                    name: 'Filled Cylinder',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
                LineSeries<_SalesData, String>(
                    color: Colors.red,
                    dataSource: emptyCylinder,
                    xValueMapper: (_SalesData emptyCylinder, _) =>
                        emptyCylinder.year,
                    yValueMapper: (_SalesData emptyCylinder, _) =>
                        emptyCylinder.sales,
                    name: 'EmptyCylinder',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
              ]),
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
