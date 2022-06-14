import 'dart:ffi';

import 'package:app1/src/api/screen_providers/allScreen_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../src/api/endPoint/endPoint_provider.dart';
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
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubPageDetalhes(
                              nome: data[moeda].name,
                              porcento: double.parse(data
                                  .map((e) => e.metrics.marketData
                                      .percent_change_usd_last_1_hour)
                                  .toString()),
                              preco: double.parse(data
                                  .map((e) => e..metrics.marketData.price_usd)
                                  .toString()),
                              title: data.map((e) => e.symbol).toString(),
                              valorMaximo: data
                                  .map((e) => e.metrics.marketData.ohlcv.close)
                                  .toString(),
                              valorMinimo: data
                                  .map((e) => e.metrics.marketData.ohlcv.open)
                                  .toString(),
                            )));
              },
              leading: CircleAvatar(
                  backgroundImage: AssetImage(Colors.black.toString())),
              subtitle: Text(data.map((e) => e.name).toString()),
              trailing: SizedBox(
                width: 75,
                height: 45,
                child: Column(
                  children: [
                    Text("R\$" +
                        data
                            .map((e) => e..metrics.marketData.price_usd)
                            .toString()),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 0, 0),
                      child: Container(
                        width: 45,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: double.parse(data
                                          .map((e) => e.metrics.marketData
                                              .percent_change_usd_last_1_hour)
                                          .toString()) >
                                      1
                                  ? Color.fromARGB(131, 191, 255, 119)
                                  : Color.fromARGB(131, 255, 119, 119)),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: double.parse(data
                                      .map((e) => e.metrics.marketData
                                          .percent_change_usd_last_1_hour)
                                      .toString()) >
                                  1
                              ? Color.fromARGB(131, 191, 255, 119)
                              : Color.fromARGB(131, 255, 119, 119),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Text(
                            "+" +
                                data
                                    .map((e) => e.metrics.marketData
                                        .percent_change_usd_last_1_hour)
                                    .toString() +
                                '\%',
                            style: TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(data.map((e) => e.symbol).toString()),
            );
          },
        );
      }),
      error: error(),
      loading: loading(),
    );
  }

  loading() {}

  error() {}
}
