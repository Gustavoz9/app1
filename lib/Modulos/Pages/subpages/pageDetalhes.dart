import 'package:app1/Modulos/Pages/home.dart';
import 'package:app1/Modulos/Pages/subpages/pageConversao.dart';
import 'package:app1/models/modelChart.dart';
import 'package:app1/widgets/chart.dart';
import 'package:app1/widgets/stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SubPageDetalhes extends StatefulWidget {
  final String title;
  final String nome;
  final double preco;
  final double porcento;
  final String valorMinimo;
  final String valorMaximo;
  final List<ChartsModel> chartsModel;

  const SubPageDetalhes({
    Key? key,
    required this.chartsModel,
    required this.title,
    required this.nome,
    required this.valorMinimo,
    required this.valorMaximo,
    required this.preco,
    required this.porcento,
  }) : super(key: key);

  @override
  State<SubPageDetalhes> createState() => _SubPageDetalhesState();
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class _SubPageDetalhesState extends State<SubPageDetalhes> {
  num onTapSwitchButton = 0;
  bool onTapSwitchChart = false;

  onTapChangeButton(int state) {
    setState(() {
      onTapSwitchButton = state;
    });
  }

  void _onTapChangeChart(bool state) {
    setState(() => onTapSwitchChart = state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
            child: Container(
              width: 350,
              height: 40,
              child: Text('Moeda',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(47, 0, 0, 0),
            child: Container(
              width: 350,
              height: 40,
              child: Text('- ' + widget.nome,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Container(
                width: 323,
                height: 245,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ChartAPP(
                      data: widget.chartsModel,
                      porcento: widget.porcento,
                      valor: widget.preco,
                      stateChart: _onTapChangeChart,
                      stateButton: onTapChangeButton,
                      onTapSwitchButton: onTapSwitchButton.toInt(),
                      onTapSwitchChart: onTapSwitchChart,
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 5, 0, 0),
            child: Container(
              width: 350,
              height: 20,
              child: Text('informações',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
          ),
          Divider(
            height: 10,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color.fromARGB(55, 95, 94, 94),
          ),
          StackAPP(
            texto: widget.nome,
            complemento: Padding(
              padding: EdgeInsets.fromLTRB(140, 15, 0, 0),
              child: Text('R\$ ' + widget.preco.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            subTexto: 'Valor atual',
          ),
          SizedBox(height: 10),
          StackAPP(
            texto: 'Cap de Mercado',
            complemento: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 45,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: widget.porcento > 1
                          ? Color.fromARGB(131, 191, 255, 119)
                          : Color.fromARGB(131, 255, 119, 119)),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: widget.porcento > 1
                      ? Color.fromARGB(131, 191, 255, 119)
                      : Color.fromARGB(131, 255, 119, 119),
                ),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                    child: Text(
                      "+" + widget.porcento.toString() + '\%',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
          ),
          SizedBox(height: 10),
          StackAPP(
            texto: 'valor mínimo',
            complemento: Padding(
              padding: EdgeInsets.fromLTRB(160, 15, 0, 0),
              child: Text(' R\$ ' + widget.valorMinimo,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
          SizedBox(height: 10),
          StackAPP(
            texto: 'valor máximo',
            complemento: Padding(
              padding: EdgeInsets.fromLTRB(165, 15, 0, 0),
              child: Text('R\$ ' + widget.valorMaximo,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
          Spacer(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(width: 1, color: Colors.redAccent),
                  color: Colors.redAccent,
                ),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SubPageConversao()));
                    },
                    child: Align(
                      child: Text(
                        'Converter Moeda',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )),
          SizedBox(
            height: 30,
          )
        ],
      ),
    ));
  }
}
