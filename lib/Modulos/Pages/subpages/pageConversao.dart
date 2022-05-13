import 'package:flutter/material.dart';

class SubPageConversao extends StatefulWidget {
  const SubPageConversao({Key? key}) : super(key: key);

  @override
  State<SubPageConversao> createState() => _SubPageConversao();
}

class _SubPageConversao extends State<SubPageConversao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Wrap(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
          child: Container(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios)),
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Text(
            'Conversão de moeda',
            style: TextStyle(fontSize: 35),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 100, 0, 0),
          child: Text(
            'Converter de:',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.left,
          ),
        ),
      ])),
    );
  }
}
