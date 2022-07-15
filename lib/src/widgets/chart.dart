import 'package:app1/shared/api/models/responses/getAll_response.dart';
import 'package:app1/shared/api/screen_providers/allScreen_providers.dart';
import 'package:app1/shared/api/viewData/getAll_viewData.dart';
import 'package:app1/shared/api/viewData/value_viewData.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'inkWell.dart';

class ChartAPP extends ConsumerStatefulWidget {
  final num porcento;
  final num valor;
  final Function(int) stateButton;
  final Function(bool) stateChart;
  final num onTapSwitchButton;
  final bool onTapSwitchChart;

  final List chartsData;

  const ChartAPP({
    Key? key,
    required this.chartsData,
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

format(num num, String casas) {
  NumberFormat format = NumberFormat(casas, "en_US".toString());
  return format.format(num);
}

class _ChartAPPState extends ConsumerState<ChartAPP> {
  @override
  Widget build(BuildContext context) {
    // adicionar os valores //
    List<dynamic> chartsData = widget.chartsData;
    num currentDay = 0;
    num daysLenght = widget.onTapSwitchButton;

    List<dynamic> chartsValues(num daysLenght) {
      final List<dynamic> values = [];
      for (int i = 0; i < daysLenght; ++i) {
        values.add([chartsData[0].btc_timeseries[i][1], currentDay + 1]);
        currentDay += daysLenght;
      }
      return values;
    }

    chartsData = chartsValues(daysLenght);

    // aplicar no grafico //
    List<LineSeries<dynamic, double>> lineseries = [
      LineSeries(
        dataSource: chartsData,
        xValueMapper: (dynamic lineseries, _) => lineseries[1],
        yValueMapper: (dynamic lineseries, _) => lineseries[0],
      )
    ];
    List<ColumnSeries<dynamic, double>> barseries = [
      ColumnSeries(
        dataSource: chartsData,
        xValueMapper: (dynamic barseries, _) => barseries[1],
        yValueMapper: (dynamic barseries, _) => barseries[0],
      )
    ];

    // -------------------------------- //

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
                        ? SfCartesianChart(series: barseries)
                        : SfCartesianChart(series: barseries),
                  )
                : Container(
                    width: 300,
                    height: 170,
                    child: widget.porcento > 1
                        ? SfCartesianChart(series: lineseries)
                        : SfCartesianChart(series: lineseries),
                  ),
          ),
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
                      widget.stateButton(5);
                    },
                    buttonDayOnTap: widget.onTapSwitchButton.toInt(),
                    text: '5D',
                  ),
                  InkWellAPP(
                    colorCase: Color.fromARGB(69, 104, 95, 95),
                    radiusBorder: 5,
                    casePosition: 2,
                    state: () {
                      widget.stateButton(10);
                    },
                    buttonDayOnTap: widget.onTapSwitchButton.toInt(),
                    text: '10D',
                  ),
                  InkWellAPP(
                    colorCase: Color.fromARGB(69, 104, 95, 95),
                    radiusBorder: 5,
                    casePosition: 3,
                    state: () {
                      widget.stateButton(15);
                    },
                    buttonDayOnTap: widget.onTapSwitchButton.toInt(),
                    text: '15D',
                  ),
                  InkWellAPP(
                    colorCase: Color.fromARGB(69, 104, 95, 95),
                    radiusBorder: 5,
                    casePosition: 4,
                    state: () {
                      widget.stateButton(20);
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
