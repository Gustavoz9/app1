import 'package:app1/repositorio/repositorioMovimenta.dart';

import 'package:flutter/material.dart';

import '../../widgets/listViewWithChart.dart';

class MyMoviment extends StatefulWidget {
  const MyMoviment({Key? key}) : super(key: key);

  @override
  State<MyMoviment> createState() => MyMovimentState();
}

class MyMovimentState extends State<MyMoviment> {
  List salvos = MovimentaRepository.listaMovimenta;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ListViewWithChart(
              listOn: salvos,
            ),
          ],
        ),
      ),
    );
  }
}
