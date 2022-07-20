import 'package:flutter/material.dart';

class InkWellAPP extends StatefulWidget {
  final Function state;
  final Color colorCase;

  final int buttonDayOnTap;
  final int radiusBorder;
  final int casePosition;

  final String text;

  const InkWellAPP({
    Key? key,
    required this.state,
    required this.text,
    required this.casePosition,
    required this.buttonDayOnTap,
    required this.radiusBorder,
    required this.colorCase,
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
              ),
            )),
        width: 30,
        height: 25,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(0, 0, 0, 0), width: 1),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.radiusBorder.toDouble())),
            color: widget.buttonDayOnTap == widget.casePosition
                ? widget.colorCase
                : null));
  }
}
