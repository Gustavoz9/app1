import 'package:app1/widgets/listView.dart';
import 'package:flutter/material.dart';

class MyMoviment extends StatefulWidget {
  const MyMoviment({Key? key}) : super(key: key);

  @override
  State<MyMoviment> createState() => MyMovimentState();
}

class MyMovimentState extends State<MyMoviment> {
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: InkWell(onTap: () {}),
    ));
  }
}
