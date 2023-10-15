import 'package:flutter/material.dart';

class WindowsIcon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WindowsIconState();
}

class _WindowsIconState extends State<WindowsIcon> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 55,
      height: 55,
      child: Stack(
        children: [
          WindowsIconPiece(
            fromColor: Color.fromARGB(255, 123, 213, 255), 
            toColor: Colors.black,
            alignment: Alignment.topLeft,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(4)),
          ),
          WindowsIconPiece(
            fromColor: Color.fromARGB(255, 68, 196, 255), 
            toColor: Colors.black,
            alignment: Alignment.topRight,
            borderRadius: BorderRadius.only(topRight: Radius.circular(4)),
          ),
          WindowsIconPiece(
            fromColor: Color.fromARGB(255, 68, 196, 255), 
            toColor: Colors.black,
            alignment: Alignment.bottomLeft,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4)),
          ),
          WindowsIconPiece(
            fromColor: Color.fromARGB(255, 32, 184, 255), 
            toColor: Colors.black,
            alignment: Alignment.bottomRight,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(4)),
          )
        ],
      ),
    );
  }
}

class WindowsIconPiece extends StatefulWidget {
  final Color fromColor;
  final Color toColor;
  final AlignmentGeometry alignment;
  final BorderRadiusGeometry? borderRadius;

  const WindowsIconPiece({
    super.key,
    required this.fromColor,
    required this.toColor,
    this.alignment = Alignment.center,
    this.borderRadius
  });

  @override
  State<StatefulWidget> createState() => _WindowsIconPieceState();
}

class _WindowsIconPieceState extends State<WindowsIconPiece> {  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Container(
        width: 26.5,
        height: 26.5,
        decoration: BoxDecoration(
          color: widget.fromColor,
          borderRadius: widget.borderRadius
        ),
      )
    );
  }
}