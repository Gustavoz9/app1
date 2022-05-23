import 'package:app1/widgets/pieChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

import '../repositorio/repositorioPieChart.dart';

class ListViewWithChart extends StatefulWidget {
  final List listOn;

  const ListViewWithChart({Key? key, required this.listOn}) : super(key: key);

  @override
  State<ListViewWithChart> createState() => _ListViewWithChartState();
}

class _ListViewWithChartState extends State<ListViewWithChart> {
  @override
  Widget build(BuildContext context) {
    final data = PieChartRepository().data;
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      padding: EdgeInsets.all(8),
      itemCount: widget.listOn.length,
      itemBuilder: (
        context,
        int moeda,
      ) {
        return ListTile(
          onTap: () {},
          title: Text(
            widget.listOn[moeda].siglaMoeda.toString(),
            style: TextStyle(fontSize: 20),
          ),
          leading: CircleAvatar(),
          subtitle: Text(widget.listOn[moeda].dataDaCompra),
          trailing: Container(
              color: Color.fromARGB(0, 105, 92, 92),
              width: 120,
              height: 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      Spacer(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            widget.listOn[moeda].quantidadeComprada.toString() +
                                " " +
                                widget.listOn[moeda].siglaMoeda.toString(),
                            style: TextStyle(fontSize: 20)),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "R\$ " +
                              widget.listOn[moeda].valorDaQuantidade.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              )),
        );
      },
    );
  }
}
