import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../src/models/modelChart.dart';
import 'inkWell.dart';

class ChartAPP extends StatefulWidget {
  // final List<
  final double porcento;
  final double valor;
  final Function(int) stateButton;
  final Function(bool) stateChart;
  final num onTapSwitchButton;
  final bool onTapSwitchChart;

  const ChartAPP({
    Key? key,
    required this.valor,
    required this.porcento,
    required this.stateButton,
    required this.stateChart,
    required this.onTapSwitchButton,
    required this.onTapSwitchChart,
  }) : super(key: key);

  @override
  State<ChartAPP> createState() => _ChartAPPState();
}

class _ChartAPPState extends State<ChartAPP> {
  final data = ChartsRepository();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'R\$' + widget.valor.toString(),
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Center(
              child: widget.onTapSwitchChart == true
                  ? Container(
                      width: 300,
                      height: 170,
                      child: widget.porcento > 1
                          ? SfCartesianChart(series: <ChartSeries>[
                              // Renders line chart
                              ColumnSeries<ChartData, double>(
                                  dataSource: data.chartDataUp,
                                  xValueMapper: (ChartData data, _) =>
                                      data.dias *
                                      widget.onTapSwitchButton.toInt(),
                                  yValueMapper: (ChartData data, _) =>
                                      data.preco *
                                      widget.onTapSwitchButton.toInt()),

                              ColumnSeries<ChartData, double>(
                                  dataSource: data.chartDataDashUp,
                                  dashArray: <double>[
                                    5 * widget.onTapSwitchButton.toDouble(),
                                    5 * widget.onTapSwitchButton.toDouble()
                                  ],
                                  xValueMapper: (ChartData data, _) =>
                                      data.dias *
                                      widget.onTapSwitchButton.toInt(),
                                  yValueMapper: (ChartData data, _) =>
                                      data.preco *
                                      widget.onTapSwitchButton.toInt()),
                            ])
                          : SfCartesianChart(series: <ChartSeries>[
                              // Renders line chart
                              ColumnSeries<ChartData, double>(
                                  dataSource: data.chartDataDown,
                                  xValueMapper: (ChartData data, _) =>
                                      data.dias *
                                      widget.onTapSwitchButton.toInt(),
                                  yValueMapper: (ChartData data, _) =>
                                      data.preco *
                                      widget.onTapSwitchButton.toInt()),

                              ColumnSeries<ChartData, double>(
                                  dataSource: data.chartDataDashDown,
                                  dashArray: <double>[
                                    5 *
                                        widget.onTapSwitchButton
                                            .toInt()
                                            .toDouble(),
                                    5 *
                                        widget.onTapSwitchButton
                                            .toInt()
                                            .toDouble()
                                  ],
                                  xValueMapper: (ChartData data, _) =>
                                      data.dias *
                                      widget.onTapSwitchButton.toInt(),
                                  yValueMapper: (ChartData data, _) =>
                                      data.preco *
                                      widget.onTapSwitchButton.toInt()),
                            ]))
                  : Container(
                      width: 300,
                      height: 170,
                      child: widget.porcento > 1
                          ? SfCartesianChart(series: <ChartSeries>[
                              // Renders line chart
                              LineSeries<ChartData, double>(
                                  dataSource: data.chartDataUp,
                                  xValueMapper: (ChartData data, _) =>
                                      data.dias *
                                      widget.onTapSwitchButton.toInt(),
                                  yValueMapper: (ChartData data, _) =>
                                      data.preco *
                                      widget.onTapSwitchButton.toInt()),

                              LineSeries<ChartData, double>(
                                  dataSource: data.chartDataDashUp,
                                  dashArray: <double>[5, 5],
                                  xValueMapper: (ChartData data, _) =>
                                      data.dias *
                                      widget.onTapSwitchButton.toInt(),
                                  yValueMapper: (ChartData data, _) =>
                                      data.preco *
                                      widget.onTapSwitchButton.toInt()),
                            ])
                          : SfCartesianChart(series: <ChartSeries>[
                              // Renders line chart
                              LineSeries<ChartData, double>(
                                  dataSource: data.chartDataDown,
                                  xValueMapper: (ChartData data, _) =>
                                      data.dias *
                                      widget.onTapSwitchButton.toInt().toInt(),
                                  yValueMapper: (ChartData data, _) =>
                                      data.preco *
                                      widget.onTapSwitchButton.toInt().toInt()),

                              LineSeries<ChartData, double>(
                                  dataSource: data.chartDataDashDown,
                                  dashArray: <double>[5, 5],
                                  xValueMapper: (ChartData data, _) =>
                                      data.dias *
                                      widget.onTapSwitchButton.toInt(),
                                  yValueMapper: (ChartData data, _) =>
                                      data.preco *
                                      widget.onTapSwitchButton.toInt()),
                            ]))),
          Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),
          Stack(
            children: [
              Wrap(
                spacing: 10,
                children: [
                  Spacer(),
                  InkWellAPP(
                    colorCase: Color.fromARGB(69, 104, 95, 95),
                    radiusBorder: 5,
                    casePosition: 1,
                    state: () {
                      widget.stateButton(1);
                    },
                    buttonDayOnTap: widget.onTapSwitchButton.toInt(),
                    text: '5D',
                  ),
                  InkWellAPP(
                    colorCase: Color.fromARGB(69, 104, 95, 95),
                    radiusBorder: 5,
                    casePosition: 2,
                    state: () {
                      widget.stateButton(2);
                    },
                    buttonDayOnTap: widget.onTapSwitchButton.toInt(),
                    text: '10D',
                  ),
                  InkWellAPP(
                    colorCase: Color.fromARGB(69, 104, 95, 95),
                    radiusBorder: 5,
                    casePosition: 3,
                    state: () {
                      widget.stateButton(3);
                    },
                    buttonDayOnTap: widget.onTapSwitchButton.toInt(),
                    text: '15D',
                  ),
                  InkWellAPP(
                    colorCase: Color.fromARGB(69, 104, 95, 95),
                    radiusBorder: 5,
                    casePosition: 4,
                    state: () {
                      widget.stateButton(4);
                    },
                    buttonDayOnTap: widget.onTapSwitchButton.toInt(),
                    text: '20D',
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: InkWell(
                      onTap: () {
                        widget.stateChart(!widget.onTapSwitchChart);
                      },
                      child: Center(
                          child: widget.onTapSwitchChart
                              ? Icon(Icons.show_chart)
                              : Icon(Icons.bar_chart))),
                  width: 30,
                  height: 25,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class ChartsRepository {
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
}


/////////////////////////////////////////////
///
/////////////////////////////////////////////
///
/////////////////////////////////////////////
///
/////////////////////////////////////////////
///
