import 'dart:ffi';

import 'package:app1/Modulos/Pages/home.dart';
import 'package:app1/models/modelView.dart';
import 'package:flutter/material.dart';

import '../Modulos/Pages/subpages/pageDetalhes.dart';
import '../models/modelChart.dart';

class ListViewAPP extends StatefulWidget {
  final List listOn;
  final String chartId;
  final List<ChartsModel> chartData;

  const ListViewAPP({
    Key? key,
    required this.chartData,
    required this.listOn,
    required this.chartId,
  }) : super(key: key);

  @override
  State<ListViewAPP> createState() => _ListViewAPPState();
}

class _ListViewAPPState extends State<ListViewAPP> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      padding: EdgeInsets.all(8),
      itemCount: widget.listOn.length,
      itemBuilder: (
        context,
        int moeda,
      ) {
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubpageDetalhes(
                          nome: widget.listOn[moeda].nome,
                          porcento: widget.listOn[moeda].porcento,
                          preco: widget.listOn[moeda].preco,
                          title: widget.listOn[moeda].nome,
                          valorMaximo:
                              widget.listOn[moeda].valorMaximo.toString(),
                          valorMinimo:
                              widget.listOn[moeda].valorMinimo.toString(),
                          chartsModel: widget.chartData,
                        )));
          },
          leading: CircleAvatar(
              backgroundImage: AssetImage(widget.listOn[moeda].imagem)),
          subtitle: Text(widget.listOn[moeda].nome),
          trailing: Container(
            width: 75,
            height: 45,
            child: Column(
              children: [
                Text("R\$" + widget.listOn[moeda].preco.toString()),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 5, 0, 0),
                  child: Container(
                    width: 45,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: widget.listOn[moeda].porcento > 1
                              ? Color.fromARGB(131, 191, 255, 119)
                              : Color.fromARGB(131, 255, 119, 119)),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: widget.listOn[moeda].porcento > 1
                          ? Color.fromARGB(131, 191, 255, 119)
                          : Color.fromARGB(131, 255, 119, 119),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                      child: Text(
                        "+" + widget.listOn[moeda].porcento.toString() + '\%',
                        style: TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Text(widget.listOn[moeda].sigla.toString()),
        );
      },
    );
  }
}
