import 'package:flutter/material.dart';

class InkWellAPP extends StatefulWidget {
  final Function state;
  final int buttonDayOnTap;

  final String text;
  final int casePosition;
  const InkWellAPP({
    Key? key,
    required this.state,
    required this.text,
    required this.casePosition,
    required this.buttonDayOnTap,
  }) : super(key: key);

  @override
  State<InkWellAPP> createState() => _InkWellAPPState();
}

class _InkWellAPPState extends State<InkWellAPP> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
            onTap: () {
              widget.state();
            },
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(),
              ),
            )),
        width: 30,
        height: 25,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(0, 0, 0, 0), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: widget.buttonDayOnTap == widget.casePosition
                ? Color.fromARGB(122, 158, 158, 158)
                : Color.fromARGB(0, 255, 255, 255)));
  }
}
