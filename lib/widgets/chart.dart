import 'dart:math';

import 'package:app1/Modulos/Pages/subpages/pageDetalhes.dart';
import 'package:app1/models/modelChart.dart';
import 'package:app1/widgets/inkWell.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartAPP extends StatefulWidget {
  final List<ChartsModel> data;
  final double porcento;
  final VoidCallback state;
  final bool buttonDayOnTap;

  const ChartAPP({
    Key? key,
    required this.data,
    required this.porcento,
    required this.state,
    required this.buttonDayOnTap,
  }) : super(key: key);

  @override
  State<ChartAPP> createState() => _ChartAPPState();
}

class _ChartAPPState extends State<ChartAPP> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Column(children: [
        Text(
          'R\$10000',
          textAlign: TextAlign.right,
        ),
        Center(
            child: Container(
                width: 300,
                height: 170,
                child: widget.porcento > 1
                    ? SfCartesianChart(series: <ChartSeries>[
                        // Renders line chart
                        LineSeries<ChartData, int>(
                            dataSource: chartDataUp,
                            xValueMapper: (ChartData data, _) => data.dias,
                            yValueMapper: (ChartData data, _) => data.preco),

                        LineSeries<ChartData, int>(
                            dataSource: chartDataDashUp,
                            dashArray: <double>[5, 5],
                            xValueMapper: (ChartData data, _) => data.dias,
                            yValueMapper: (ChartData data, _) => data.preco),
                      ])
                    : SfCartesianChart(series: <ChartSeries>[
                        // Renders line chart
                        LineSeries<ChartData, int>(
                            dataSource: chartDataDown,
                            xValueMapper: (ChartData data, _) => data.dias,
                            yValueMapper: (ChartData data, _) => data.preco),

                        LineSeries<ChartData, int>(
                            dataSource: chartDataDashDown,
                            dashArray: <double>[5, 5],
                            xValueMapper: (ChartData data, _) => data.dias,
                            yValueMapper: (ChartData data, _) => data.preco),
                      ]))),
        Divider(
          height: 1,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        Positioned(
            width: 200,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWellAPP(
                  casePosition: 1,
                  state: widget.state,
                  buttonDayOnTap: widget.buttonDayOnTap,
                  text: '5D',
                ),
                InkWellAPP(
                  casePosition: 2,
                  state: widget.state,
                  buttonDayOnTap: widget.buttonDayOnTap,
                  text: '10D',
                ),
                InkWellAPP(
                  casePosition: 3,
                  state: widget.state,
                  buttonDayOnTap: widget.buttonDayOnTap,
                  text: '15D',
                ),
                InkWellAPP(
                  casePosition: 4,
                  state: widget.state,
                  buttonDayOnTap: widget.buttonDayOnTap,
                  text: '20D',
                ),
              ],
            ))
      ]),
    );
  }
}

class ChartData {
  ChartData(this.dias, this.preco, this.barColor);
  final int dias; // X
  final double preco; // Y
  final charts.Color barColor;
}

final List<ChartData> chartDataUp = [
  ChartData(
    0,
    10,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    14,
    45,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    17,
    52,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    27,
    69,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    40,
    70,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
];
final List<ChartData> chartDataDashUp = [
  ChartData(
    0,
    0,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    40,
    40,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
];
final List<ChartData> chartDataDown = [
  ChartData(
    0,
    50,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    5,
    36,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    15,
    32,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    25,
    39,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    30,
    27,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
];
final List<ChartData> chartDataDashDown = [
  ChartData(
    0,
    30,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
  ChartData(
    30,
    0,
    charts.ColorUtil.fromDartColor(Colors.amber),
  ),
];
