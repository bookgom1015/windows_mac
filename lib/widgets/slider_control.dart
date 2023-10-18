import 'package:flutter/material.dart';

class SliderControl extends StatefulWidget {
  final double height;

  const SliderControl({
    super.key,
    required this.height
  });

  @override
  State<StatefulWidget> createState() => _SliderControlState();
}

class _SliderControlState extends State<SliderControl> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child : Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          borderRadius: BorderRadius.circular(12)
        )        
      )
    );
  }
}
