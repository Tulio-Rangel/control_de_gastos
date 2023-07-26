import 'package:control_de_gastos/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;

  const MyBarGraph(
      {super.key,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount,
      required this.sunAmount,
      required this.maxY});

  @override
  Widget build(BuildContext context) {
    // Initialize the bar data
    BarData myBarData = BarData(
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount,
        sunAmount: sunAmount);
    myBarData.initializeBarData();

    return BarChart(BarChartData(
        maxY: maxY,
        minY: 0,
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(
                x: data.x, barRods: [BarChartRodData(toY: data.y)]))
            .toList()));
  }
}
