import 'package:flutter/material.dart';

import '../../repositorio/repositorioMoedas.dart';
import '../../widgets/listView.dart';
import '../../widgets/visibility.dart';

final pageViewController = PageController();
final repoMoedas = MoedaRepository.tabela;

class MyCarteira extends StatefulWidget {
  const MyCarteira({Key? key}) : super(key: key);

  @override
  State<MyCarteira> createState() => MyCarteiraState();
}

class MyCarteiraState extends State<MyCarteira> {
  bool show = true;
  visibility() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color.fromARGB(0, 187, 222, 251),
            child: Stack(children: [
              Positioned(
                top: 77,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  padding: EdgeInsets.all(2),
                  color: Color.fromARGB(0, 255, 0, 0),
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
                            'Carteira',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          )),
                      Positioned(
                        top: 45,
                        left: 25,
                        child: show
                            ? Text('R\$ 1.000,00',
                                style: TextStyle(
                                  fontSize: 30,
                                ))
                            : Container(
                                width: 200,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(75, 85, 85, 85),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromARGB(129, 92, 92, 92)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
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
                    color: Color.fromARGB(0, 255, 193, 7),
                    child: ListViewAPP(
                      listOn: repoMoedas,
                    ),
                  ))
            ])));
  }
}
