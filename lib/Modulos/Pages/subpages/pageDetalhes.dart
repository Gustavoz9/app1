import 'package:app1/Modulos/Pages/home.dart';
import 'package:app1/models/modelChart.dart';
import 'package:app1/widgets/chart.dart';
import 'package:app1/widgets/stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SubpageDetalhes extends StatefulWidget {
  final String title;
  final String nome;
  final double preco;
  final double porcento;
  final String valorMinimo;
  final String valorMaximo;
  final List<ChartsModel> chartsModel;

  const SubpageDetalhes({
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
  State<SubpageDetalhes> createState() => _SubpageDetalhesState();
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class _SubpageDetalhesState extends State<SubpageDetalhes> {
  bool buttonDayOnTap = true;

  onTap() {
    setState(() {
      buttonDayOnTap = !buttonDayOnTap;
    });
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
                color: Color.fromARGB(71, 179, 179, 179),
                child: Column(
                  children: [
                    ChartAPP(
                      data: widget.chartsModel,
                      porcento: widget.porcento,
                      state: onTap,
                      buttonDayOnTap: buttonDayOnTap,
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 15, 0, 0),
            child: Container(
              width: 350,
              height: 20,
              child: Text('informaçãoes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
          ),
          Divider(
            height: 20,
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
          StackAPP(
            texto: 'Cap de Mercado',
            complemento: Padding(
              padding: EdgeInsets.fromLTRB(
                180,
                15,
                0,
                0,
              ),
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
          StackAPP(
            texto: 'valor mínimo',
            complemento: Padding(
              padding: EdgeInsets.fromLTRB(160, 15, 0, 0),
              child: Text(' R\$ ' + widget.valorMinimo,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
          StackAPP(
            texto: 'valor máximo',
            complemento: Padding(
              padding: EdgeInsets.fromLTRB(165, 15, 0, 0),
              child: Text('R\$ ' + widget.valorMaximo,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
