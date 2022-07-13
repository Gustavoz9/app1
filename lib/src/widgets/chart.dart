import 'package:app1/shared/api/models/responses/getAll_response.dart';
import 'package:app1/shared/api/screen_providers/allScreen_providers.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'inkWell.dart';

class ChartAPP extends ConsumerStatefulWidget {
  final num porcento;
  final num valor;
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
  ConsumerState<ChartAPP> createState() => _ChartAPPState();
}

class _ChartAPPState extends ConsumerState<ChartAPP> {
  @override
  Widget build(BuildContext context) {
    final values = ref.watch(getScreenDayValueProvider);
    // values.mapOrNull().toList().whenOrNull(
    //   data: ((item) => );
    // );
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
                              ColumnSeries<GetAllResponses, double>(
                                  dataSource: values.mapOrNull().toList(),
                                  xValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString()),
                                  yValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString())),

                              ColumnSeries<GetAllResponses, double>(
                                  dataSource: values.mapOrNull().toList(),
                                  dashArray: <double>[5, 5],
                                  xValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString()),
                                  yValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString())),
                            ])
                          : SfCartesianChart(series: <ChartSeries>[
                              // Renders line chart
                              ColumnSeries<GetAllResponses, double>(
                                  dataSource: values.mapOrNull().toList(),
                                  xValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString()),
                                  yValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString())),

                              ColumnSeries<GetAllResponses, double>(
                                  dataSource: values.mapOrNull().toList(),
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
                                  xValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString()),
                                  yValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString())),
                            ]))
                  : Container(
                      width: 300,
                      height: 170,
                      child: widget.porcento > 1
                          ? SfCartesianChart(series: <ChartSeries>[
                              // Renders line chart
                              LineSeries<GetAllResponses, double>(
                                  dataSource: values.mapOrNull().toList(),
                                  xValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString()),
                                  yValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString())),

                              LineSeries<GetAllResponses, double>(
                                  dataSource: values.mapOrNull().toList(),
                                  dashArray: <double>[5, 5],
                                  xValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString()),
                                  yValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString())),
                            ])
                          : SfCartesianChart(series: <ChartSeries>[
                              // Renders line chart
                              LineSeries<GetAllResponses, double>(
                                  dataSource: values.mapOrNull().toList(),
                                  xValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString()),
                                  yValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString())),

                              LineSeries<GetAllResponses, double>(
                                  dataSource: values.mapOrNull().toList(),
                                  dashArray: <double>[5, 5],
                                  xValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString()),
                                  yValueMapper: (GetAllResponses data, _) =>
                                      double.parse(1.toString())),
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
