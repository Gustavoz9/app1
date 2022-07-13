import 'package:app1/src/models/modelChartPie.dart';
import 'package:flutter/material.dart';

class PieChartRepository {
  final List<PieChartModel> data = [
    PieChartModel(
      0,
      100,
    ),
    PieChartModel(1, 75),
    PieChartModel(2, 25),
    PieChartModel(3, 5)
  ];
}
