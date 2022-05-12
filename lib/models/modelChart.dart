import 'package:charts_flutter/flutter.dart' as charts;

class ChartData {
  ChartData(this.dias, this.preco, this.barColor);
  final double dias; // X
  final double preco; // Y
  final charts.Color barColor;
}
