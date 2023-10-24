import 'package:flutter/material.dart';

class UpperMenuItem extends StatefulWidget {
  const UpperMenuItem({super.key});

  @override
  State<StatefulWidget> createState() => _UpperMenuItem();
}

class _UpperMenuItem extends State<UpperMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red
    );
  }
}