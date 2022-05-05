import 'package:app1/models/modelChart.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsRepository {
  final data = [
    ChartsModel(
      year: 10,
      sales: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];
}
