import 'package:flutter/material.dart';

class ReactingButton extends StatefulWidget {
  final double width;
  final double height;

  final EdgeInsetsGeometry? margin;

  final Color? color;
  final Color? hoveringColor;

  final BorderRadiusGeometry? borderRadius;

  final void Function()? onTap;

  final Widget? child;

  const ReactingButton(
      {super.key,
      required this.width,
      required this.height,
      this.margin,
      this.color,
      this.hoveringColor,
      this.borderRadius,
      this.onTap,
      this.child});

  @override
  State<StatefulWidget> createState() => _ReactingButtonState();
}

class _ReactingButtonState extends State<ReactingButton> {
  late Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
          color: _backgroundColor, borderRadius: widget.borderRadius),
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              _backgroundColor = widget.hoveringColor;
            });
          },
          onExit: (event) {
            setState(() {
              _backgroundColor = widget.color;
            });
          },
          cursor: SystemMouseCursors.click,
          child: widget.child,
        ),
      ),
    );
  }
}
