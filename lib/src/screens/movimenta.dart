import 'package:flutter/material.dart';

import '../../shared/widgets/listViewWithChart.dart';
import '../repositorio/repositorioMovimenta.dart';

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
