import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../../src/models/modelChartPie.dart';

class PieChartApp extends StatefulWidget {
  final List<PieChartModel> data;
  const PieChartApp({Key? key, required this.data}) : super(key: key);

  @override
  State<PieChartApp> createState() => _PieChartAppState();
}

class _PieChartAppState extends State<PieChartApp> {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(series: <CircularSeries>[
      // Render pie chart
      PieSeries<PieChartModel, int>(
          dataSource: widget.data,
          xValueMapper: (PieChartModel data, _) => data.year,
          yValueMapper: (PieChartModel data, _) => data.sales)
    ]);
  }
}
