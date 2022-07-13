import 'package:app1/src/widgets/visibility.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/models/repositorio/repositorioMoedas.dart';

import '../widgets/listView.dart';

final pageViewController = PageController();
final repoMoedas = MoedaRepository.tabela;

class MyCarteira extends ConsumerStatefulWidget {
  const MyCarteira({Key? key}) : super(key: key);

  @override
  ConsumerState<MyCarteira> createState() => MyCarteiraState();
}

class MyCarteiraState extends ConsumerState<MyCarteira> {
  LocalStorage storage = LocalStorage('valor');
  bool show = true;

  visibility() {
    setState(() {
      show = !show;
    });
  }

  @override
  initState() {
    super.initState();
    storage.setItem('valor', 1000000);
  }

  setStateValor(double valor) {
    setState(() {
      storage.setItem('valor', (storage.getItem('valor') - valor).toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(0, 187, 222, 251),
            child: Stack(children: [
              Positioned(
                top: 77,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  padding: const EdgeInsets.all(2),
                  color: const Color.fromARGB(0, 255, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Stack(
                    children: [
                      Container(
                        child: Positioned(
                            top: 5,
                            left: 25,
                            child: Visibilities(
                              onpressed: visibility,
                              visibility: show,
                            )),
                        alignment: Alignment.topRight,
                      ),
                      Positioned(
                          top: 5,
                          left: 25,
                          child: Text(
                            AppLocalizations.of(context)!.wallet,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 35,
                            ),
                          )),
                      Positioned(
                        top: 45,
                        left: 25,
                        child: show
                            ? Text("R\$ ${storage.getItem('valor').toString()}",
                                style: const TextStyle(
                                  fontSize: 30,
                                ))
                            : Container(
                                width: 200,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(75, 85, 85, 85),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          129, 92, 92, 92)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                )),
                      ),
                      Positioned(
                          top: 85,
                          left: 25,
                          child: Text('+R\$ 100,00 (100% do CDI)',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black45))),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 230,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 530,
                  color: const Color.fromARGB(0, 255, 193, 7),
                  child: const ListViewApp(),
                ),
              )
            ])));
  }
}
