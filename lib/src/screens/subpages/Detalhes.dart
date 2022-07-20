import 'package:app1/shared/api/viewData/value_viewData.dart';
import 'package:app1/src/screens/subpages/Conversao.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/api/screen_providers/allScreen_providers.dart';
import '../../widgets/chart.dart';
import '../../widgets/stack.dart';

class SubPageDetalhes extends ConsumerStatefulWidget {
  final String title;
  final String nome;
  final num preco;
  final num porcento;
  final num valorMinimo;
  final num valorMaximo;

  final List chartsData;

  const SubPageDetalhes({
    Key? key,
    required this.chartsData,
    required this.title,
    required this.nome,
    required this.valorMinimo,
    required this.valorMaximo,
    required this.preco,
    required this.porcento,
  }) : super(key: key);

  @override
  ConsumerState<SubPageDetalhes> createState() => _SubPageDetalhesState();
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class _SubPageDetalhesState extends ConsumerState<SubPageDetalhes> {
  num onTapSwitchButton = 5;
  bool onTapSwitchChart = false;
  final globalKey = GlobalKey<ScaffoldState>();

  onTapChangeButton(int state) {
    setState(() {
      onTapSwitchButton = state;
    });
  }

  void _onTapChangeChart(bool state) {
    setState(() => onTapSwitchChart = state);
  }

  Widget buildBottomSheet() {
    return SubPageConversao(
      name: widget.nome,
      valor: widget.preco,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
              child: SizedBox(
                width: 350,
                height: 40,
                child: Text(AppLocalizations.of(context)!.coin,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(47, 0, 0, 0),
              child: SizedBox(
                width: 350,
                height: 40,
                child: Text('- ' + widget.nome,
                    style: const TextStyle(
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
                        chartsData: widget.chartsData,
                        porcento: widget.porcento,
                        valor: widget.preco,
                        stateChart: _onTapChangeChart,
                        stateButton: onTapChangeButton,
                        onTapSwitchButton: onTapSwitchButton,
                        onTapSwitchChart: onTapSwitchChart,
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 0, 0),
              child: Container(
                width: 350,
                height: 20,
                child: Text(AppLocalizations.of(context)!.information,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(55, 95, 94, 94),
            ),
            StackAPP(
              texto: widget.nome,
              complemento: Padding(
                padding: const EdgeInsets.fromLTRB(140, 15, 0, 0),
                child: Text('R\$ ' + widget.preco.toString(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 20,
                    )),
              ),
              subTexto: AppLocalizations.of(context)!.currentvalor,
            ),
            const SizedBox(height: 10),
            StackAPP(
              texto: AppLocalizations.of(context)!.marketcap,
              complemento: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 45,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: widget.porcento > 1
                            ? const Color.fromARGB(131, 191, 255, 119)
                            : const Color.fromARGB(131, 255, 119, 119)),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: widget.porcento > 1
                        ? const Color.fromARGB(131, 191, 255, 119)
                        : const Color.fromARGB(131, 255, 119, 119),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                      child: Text(
                        "+" + widget.porcento.toString() + '\%',
                        style: const TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 10),
            StackAPP(
              texto: AppLocalizations.of(context)!.minvalor,
              complemento: Padding(
                padding: const EdgeInsets.fromLTRB(160, 15, 0, 0),
                child: Text(' R\$ ' + widget.valorMinimo.toString(),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
            const SizedBox(height: 10),
            StackAPP(
              texto: AppLocalizations.of(context)!.maxvalor,
              complemento: Padding(
                padding: const EdgeInsets.fromLTRB(165, 15, 0, 0),
                child: Text('R\$ ' + widget.valorMaximo.toString(),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(width: 1, color: Colors.redAccent),
                  color: Colors.redAccent,
                ),
                child: GestureDetector(
                  child: InkWell(
                      onTap: () => showModalBottomSheet(
                          enableDrag: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => buildBottomSheet()),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(AppLocalizations.of(context)!.convertcoin,
                            style: const TextStyle(color: Colors.white)),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
