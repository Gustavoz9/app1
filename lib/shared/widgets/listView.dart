import 'dart:math';

import 'package:app1/src/api/screen_providers/allScreen_providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../src/screens/subpages/pageDetalhes.dart';

class ListViewApp extends ConsumerWidget {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiDataProvinder = ref.watch(getScreenProvider);
    return apiDataProvinder.when(
      data: ((data) {
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          padding: EdgeInsets.all(8),
          itemCount: data.length,
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
                            width: 75,
                            height: 45,
                            child: Column(children: [
                              Text("R\$" +
                                  e.metrics.market_data.price_usd.toString()),
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
                                          e.metrics.market_data
                                              .percent_change_usd_last_1_hour
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
                                  porcento: e.metrics.market_data
                                      .percent_change_usd_last_1_hour,
                                  preco: e.metrics.market_data.price_usd,
                                  title: e.symbol,
                                  valorMaximo: e.metrics.market_data
                                      .ohlcv_last_1_hour.close,
                                  valorMinimo: e.metrics.market_data
                                      .ohlcv_last_1_hour.open,
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
        return const Text('Ops! Algo está errado!');
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
