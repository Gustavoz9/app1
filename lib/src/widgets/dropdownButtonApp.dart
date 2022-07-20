import 'package:flutter/material.dart';

class DropdownButtonApp extends StatefulWidget {
  final List listItems;
  final bool changeble;
  final String? valueChoose;
  final String hint;
  final String name;
  final Function(String) newValue;
  const DropdownButtonApp({
    Key? key,
    required this.listItems,
    required this.newValue,
    required this.valueChoose,
    required this.hint,
    required this.changeble,
    required this.name,
  }) : super(key: key);

  @override
  State<DropdownButtonApp> createState() => _DropdownButtonAppState();
}

class _DropdownButtonAppState extends State<DropdownButtonApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: widget.changeble != false ? null : Icon(Icons.check_sharp),
              isExpanded: true,
              hint: Text(
                widget.hint.toString(),
                style: TextStyle(fontSize: 20),
              ),
              value: widget.valueChoose,
              onChanged: widget.changeble == true
                  ? (newValue) {
                      widget.newValue(newValue.toString());
                    }
                  : null,
              items: widget.listItems.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:
                              Text(valueItem, style: TextStyle(fontSize: 20)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: widget.valueChoose == valueItem
                              ? Icon(Icons.check_sharp)
                              : null,
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
