import 'dart:math';

import 'package:app1/shared/api/screen_providers/allScreen_providers.dart';
import 'package:app1/shared/api/viewData/value_viewData.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../screens/subpages/Detalhes.dart';

class ListViewApp extends ConsumerWidget {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    format(num num, String casas) {
      NumberFormat format = NumberFormat(casas, "en_US".toString());
      return format.format(num);
    }

    final apiDataProvinder = ref.watch(getScreenDataProvider);
    final values = ref.watch(getScreenDayValueProvider);

    // integrar os dados //
    List<dynamic> chartsData = [];
    values.whenOrNull(
      data: (data) {
        return chartsData = data
            .map((e) => ValueViewData(btc_timeseries: e.btc_timeseries))
            .toList();
      },
    );
    return apiDataProvinder.when(
      data: ((data) {
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          padding: EdgeInsets.all(8),
          itemCount: 1,
          itemBuilder: (
            context,
            int moeda,
          ) {
            return Column(
                children: data
                    .map((e) => ListTile(
                          leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage(Colors.black.toString())),
                          subtitle: Text(e.name),
                          trailing: SizedBox(
                            width: 100,
                            height: 45,
                            child: Column(children: [
                              Text(
                                  "R\$ " +
                                      format(e.metrics.market_data.price_usd,
                                              "###.##")
                                          .toString(),
                                  style: TextStyle(fontSize: 15)),
                              Padding(
                                padding: EdgeInsets.fromLTRB(25, 5, 0, 0),
                                child: Container(
                                  width: 45,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: double.parse(e
                                                    .metrics
                                                    .market_data
                                                    .percent_change_usd_last_1_hour
                                                    .toString()) >
                                                1
                                            ? Color.fromARGB(131, 191, 255, 119)
                                            : Color.fromARGB(
                                                131, 255, 119, 119)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: double.parse(e.metrics.market_data
                                                .percent_change_usd_last_1_hour
                                                .toString()) >
                                            1
                                        ? Color.fromARGB(131, 191, 255, 119)
                                        : Color.fromARGB(131, 255, 119, 119),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                    child: Text(
                                      "+" +
                                          format(
                                                  e.metrics.market_data
                                                      .percent_change_usd_last_1_hour,
                                                  "###.##")
                                              .toString() +
                                          '\%',
                                      style: TextStyle(fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubPageDetalhes(
                                  nome: e.name,
                                  porcento: double.parse(e.metrics.market_data
                                      .percent_change_usd_last_1_hour
                                      .toString()),
                                  preco: double.parse(format(
                                      e.metrics.market_data.price_usd,
                                      "###.##")),
                                  title: e.symbol,
                                  valorMaximo: e.metrics.market_data
                                      .ohlcv_last_1_hour.low,
                                  valorMinimo: e.metrics.market_data
                                      .ohlcv_last_1_hour.higth,
                                  chartsData: chartsData,
                                ),
                              ),
                            );
                          },
                          title: Text(e.name),
                        ))
                    .toList());
          },
        );
      }),
      error: (Object error, StackTrace? stackTrace) {
        print(error.toString());
        return Text(error.toString());
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
