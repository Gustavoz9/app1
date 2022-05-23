import 'dart:math';

import 'package:app1/models/modelMovimentaList.dart';
import 'package:app1/widgets/inkWell.dart';
import 'package:flutter/material.dart';

import '../../../repositorio/repositorioMoedas.dart';
import '../../../repositorio/repositorioMovimenta.dart';
import '../../../widgets/dropdownButtonApp.dart';
import '../carteiras.dart';

class SubPageConversao extends StatefulWidget {
  final String name;

  final double valor;

  const SubPageConversao({
    Key? key,
    required this.name,
    required this.valor,
  }) : super(key: key);

  @override
  State<SubPageConversao> createState() => _SubPageConversao();
}

class _SubPageConversao extends State<SubPageConversao>
    with SingleTickerProviderStateMixin {
  DateTime now = DateTime.now();

  final repoMoedas = MoedaRepository.tabela;
  final List valoresSalvos = MovimentaRepository.listaMovimenta;

  final carteira = MyCarteiraState();

  Animation<double>? animation;
  bool complete = false;
  int onTapSwitchButton = 0;
  String? valueChooseEntrada;
  String? valueChooseSaida;
  List listItems = ["Bitcoin", "Ethereum", "Litecoin", "Dogecoin"];
  onTapChangeButton(int state) {
    setState(() {
      onTapSwitchButton = state;
    });
  }

  chanceValueEntrada(String newValue) {
    setState(() {
      valueChooseEntrada = newValue;
    });
  }

  chanceValueSaida(String newValue) {
    setState(() {
      valueChooseSaida = newValue;
    });
  }

  allComplete(bool newValue) {
    setState(() {
      complete = newValue;
      valoresSalvos.add(MovimentaModel(
          siglaMoeda: checkSigla(),
          quantidadeComprada: 1.toString(),
          valorDaQuantidade: checkCaseMath() + checkCoin(),
          dataDaCompra: now.day.toString() +
              "/" +
              now.month.toString() +
              "/" +
              now.year.toString()));
    });
    carteira.setStateValor(checkCaseMath() + checkCoin());
  }

  AnimationController? animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animationController!.forward(from: 0);
  }

  void dispose() {
    // Stop calling setState when the clock is removed from the widget tree
    animationController!.dispose();
    super.dispose();
  }

  checkCaseMath() {
    switch (onTapSwitchButton) {
      case 1:
        return (widget.valor * 0.25);

      case 2:
        return (widget.valor * 0.50);

      case 3:
        return (widget.valor * 0.75);

      case 4:
        return (widget.valor * 1);

      default:
        return 1;
    }
  }

  checkCoin() {
    for (var i = 0; i < repoMoedas.length; i++) {
      if (valueChooseSaida == repoMoedas[i].nome) {
        return repoMoedas[i].preco;
      }
    }
  }

  checkSigla() {
    for (var i = 0; i < repoMoedas.length; i++) {
      if (valueChooseSaida == repoMoedas[i].nome) {
        return repoMoedas[i].sigla;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: complete != true
          ? Container(
              child: Column(children: [
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Container(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Conversão de moeda',
                        style: TextStyle(fontSize: 35),
                        textAlign: TextAlign.left,
                      ),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 100, 0, 0),
                  child: Container(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Converter de:',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
                    child: DropdownButtonApp(
                      name: widget.name,
                      changeble: false,
                      listItems: listItems,
                      newValue: chanceValueEntrada,
                      valueChoose: valueChooseEntrada,
                      hint: widget.name,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Text(
                            onTapSwitchButton != 0
                                ? checkCaseMath().toString()
                                : widget.valor.toString(),
                            style: TextStyle(fontSize: 20))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100, 15, 0, 0),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(126, 194, 193, 192)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: InkWellAPP(
                          colorCase: Color.fromARGB(61, 0, 0, 0),
                          radiusBorder: 20,
                          casePosition: 1,
                          state: () {
                            onTapChangeButton(1);
                          },
                          buttonDayOnTap: onTapSwitchButton,
                          text: '25\%',
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(126, 194, 193, 192)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: InkWellAPP(
                          colorCase: Color.fromARGB(61, 0, 0, 0),
                          radiusBorder: 20,
                          casePosition: 2,
                          state: () {
                            onTapChangeButton(2);
                          },
                          buttonDayOnTap: onTapSwitchButton,
                          text: '50\%',
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(126, 194, 193, 192)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: InkWellAPP(
                          colorCase: Color.fromARGB(61, 0, 0, 0),
                          radiusBorder: 20,
                          casePosition: 3,
                          state: () {
                            onTapChangeButton(3);
                          },
                          buttonDayOnTap: onTapSwitchButton,
                          text: '75\%',
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Color.fromARGB(126, 194, 193, 192)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWellAPP(
                          colorCase: Color.fromARGB(61, 0, 0, 0),
                          radiusBorder: 20,
                          casePosition: 4,
                          state: () {
                            onTapChangeButton(4);
                          },
                          buttonDayOnTap: onTapSwitchButton,
                          text: '100\%',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 100, 0, 0),
                  child: Container(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Para Receber em:',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
                    child: DropdownButtonApp(
                      name: widget.name,
                      changeble: true,
                      listItems: listItems,
                      newValue: chanceValueSaida,
                      valueChoose: valueChooseSaida,
                      hint: 'Escolha a Moeda',
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                      height: 70,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                                valueChooseSaida != null
                                    ? onTapSwitchButton != 0
                                        ? valueChooseSaida == widget.name
                                            ? checkCaseMath().toString()
                                            : (checkCaseMath() + checkCoin())
                                                .toString()
                                        : "Escolha um valor da fração"
                                    : "Escolha uma Moeda",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: valueChooseSaida != null &&
                                            onTapSwitchButton != 0
                                        ? Colors.black
                                        : Colors.black26)),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 1, 10, 1),
                              child: Text(
                                  valueChooseSaida != null &&
                                          onTapSwitchButton != 0
                                      ? '(Em ${valueChooseSaida})'
                                      : '',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black26)),
                            ),
                          )
                        ],
                      ))),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                      width: 250,
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Cancelar',
                              style: TextStyle(color: Colors.redAccent)),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            width: 1,
                            color: valueChooseSaida != null &&
                                    onTapSwitchButton != 0
                                ? Colors.redAccent
                                : Colors.blueGrey),
                        color:
                            valueChooseSaida != null && onTapSwitchButton != 0
                                ? Colors.redAccent
                                : Colors.grey,
                      ),
                      child: GestureDetector(
                        child: InkWell(
                            onTap: valueChooseSaida != null &&
                                    onTapSwitchButton != 0
                                ? () {
                                    carteira.storage.getItem('valor') >=
                                            checkCaseMath() + checkCoin()
                                        ? allComplete(true)
                                        : null;
                                  }
                                : () {},
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Converter Moeda',
                                  style: TextStyle(color: Colors.white)),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ]))
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: AnimatedBuilder(
                  animation: animationController!,
                  builder: (BuildContext context, child) {
                    final size = 100;

                    return Container(
                      width: size.toDouble(),
                      height: size.toDouble(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(size / 2),
                        ),
                        color: Color.fromARGB(255, 70, 244, 54),
                      ),
                      child: Icon(Icons.check_sharp),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
