import 'package:app1/src/models/repositorio/repositorioMovimenta.dart';
import 'package:app1/src/widgets/listViewWithChart.dart';
import 'package:flutter/material.dart';

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
