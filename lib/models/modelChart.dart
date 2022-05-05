import 'package:charts_flutter/flutter.dart' as charts;

class ChartsModel {
  int year;
  int sales;
  charts.Color barColor;

  ChartsModel(
      {required this.year, required this.sales, required this.barColor});
}
