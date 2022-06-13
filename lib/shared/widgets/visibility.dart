import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Visibilities extends StatefulWidget {
  final VoidCallback onpressed;
  final bool visibility;
  const Visibilities({
    Key? key,
    required this.visibility,
    required this.onpressed,
  }) : super(key: key);

  @override
  State<Visibilities> createState() => _VisibilitiesState();
}

class _VisibilitiesState extends State<Visibilities> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onpressed();
      },
      icon: Icon(widget.visibility ? Icons.visibility : Icons.visibility_off),
    );
  }
}
