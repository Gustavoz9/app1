

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../src/api/provinders/data_provinder.dart';
import '../../src/screens/subpages/pageDetalhes.dart';

class ListViewAPP extends ConsumerStatefulWidget {
  final List listOn;

  const ListViewAPP({
    Key? key,
    required this.listOn,
  }) : super(key: key);

  @override
  ConsumerState<ListViewAPP> createState() => _ListViewAPPState();
}

class _ListViewAPPState extends ConsumerState<ListViewAPP> {
  @override
  Widget build(BuildContext context) {
    final apiDataProvinder = ref.watch(dataProvinder.);
    return apiDataProvinder.when(
      data: ((data) {
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          padding: EdgeInsets.all(8),
          itemCount: data.data.length,
          itemBuilder: (
            context,
            int moeda,
          ) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubPageDetalhes(
                              nome: data.data[moeda].name,
                              porcento: widget.listOn[moeda].porcento,
                              preco: widget.listOn[moeda].preco,
                              title: widget.listOn[moeda].nome,
                              valorMaximo:
                                  widget.listOn[moeda].valorMaximo.toString(),
                              valorMinimo:
                                  widget.listOn[moeda].valorMinimo.toString(),
                            )));
              },
              leading: CircleAvatar(
                  backgroundImage: AssetImage(data.data[moeda].name)),
              subtitle: Text(data.data[moeda].name),
              trailing: SizedBox(
                width: 75,
                height: 45,
                child: Column(
                  children: [
                    Text("R\$" + widget.listOn[moeda].preco.toString()),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 0, 0),
                      child: Container(
                        width: 45,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: widget.listOn[moeda].porcento > 1
                                  ? Color.fromARGB(131, 191, 255, 119)
                                  : Color.fromARGB(131, 255, 119, 119)),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: widget.listOn[moeda].porcento > 1
                              ? Color.fromARGB(131, 191, 255, 119)
                              : Color.fromARGB(131, 255, 119, 119),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Text(
                            "+" +
                                widget.listOn[moeda].porcento.toString() +
                                '\%',
                            style: TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(data.data[moeda].symbol),
            );
          },
        );
      }),
      error: error(),
      loading: loading(),
    );
  }

  loading() {}

  error() {}
}
