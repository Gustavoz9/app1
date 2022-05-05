import 'package:flutter/material.dart';

class InkWellAPP extends StatefulWidget {
  final VoidCallback state;
  final bool buttonDayOnTap;

  final String text;
  final int casePosition;
  const InkWellAPP({
    Key? key,
    required this.buttonDayOnTap,
    required this.state,
    required this.text,
    required this.casePosition,
  }) : super(key: key);

  @override
  State<InkWellAPP> createState() => _InkWellAPPState();
}

class _InkWellAPPState extends State<InkWellAPP> {
  bool buttonDaySwitch = false;

  daySwitch() => {
        widget.buttonDayOnTap ? buttonDaySwitch = true : buttonDaySwitch = false
      };
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
          onTap: () {
            daySwitch();
            widget.state();
          },
          child: Text(widget.text),
        ),
        width: 30,
        height: 25,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(2)),
            color: buttonDaySwitch ? Colors.grey : Colors.black));
  }
}
