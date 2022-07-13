import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackAPP extends StatefulWidget {
  final String texto;
  final String? subTexto;
  final Widget complemento;
  const StackAPP({
    Key? key,
    required this.texto,
    required this.complemento,
    this.subTexto,
  }) : super(key: key);

  @override
  State<StackAPP> createState() => _StackAPPState();
}

class _StackAPPState extends State<StackAPP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Container(
          color: Color.fromARGB(0, 167, 147, 76),
          width: double.infinity,
          height: 50,
          child: Stack(children: [
            Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(widget.texto,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    widget.subTexto != null
                        ? Positioned(
                            top: 10,
                            child: Text(
                              widget.subTexto.toString(),
                              style: TextStyle(
                                color: Color.fromARGB(132, 45, 0, 0),
                                fontSize: 10,
                              ),
                            ),
                          )
                        : Text(
                            '',
                            style: TextStyle(
                              color: Color.fromARGB(132, 0, 0, 0),
                              fontSize: 10,
                            ),
                          ),
                  ],
                )),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: widget.complemento,
            ),
          ])),
    );
  }
}
